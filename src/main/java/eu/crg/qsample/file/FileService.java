package eu.crg.qsample.file;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.stereotype.Service;

import eu.crg.qsample.Threshold.InstrumentStatus;
import eu.crg.qsample.context_source.ContextSourceRepository;
import eu.crg.qsample.data.Data;
import eu.crg.qsample.data.DataRepository;
import eu.crg.qsample.guideset.GuideSetRepository;
import eu.crg.qsample.param.ParamRepository;
import eu.crg.qsample.wetlab.WetLab;
import eu.crg.qsample.wetlab.WetLabFile;
import eu.crg.qsample.wetlab.WetLabRepository;

@Service
public class FileService {

    @Autowired
    WetLabRepository wetlabRepo;

    @Autowired
    FileRepository fileRepository;

    @Autowired
    ParamRepository paramRepo;

    @Autowired
    ContextSourceRepository csRepo;

    @Autowired
    DataRepository dataRepo;

    @Autowired
    GuideSetRepository guideSetRepo;

    public File insertDummyFileData() {
        System.out.println(csRepo.findById(1l).get().toString());
        File file1 = new WetLabFile(null, "check1", new Date(), "dummy1", wetlabRepo.findById(1l).get());
        fileRepository.save(file1);
        Data data1 = new Data(null, paramRepo.findById(1l).get(), csRepo.findById(1l).get(), file1, 23f, 12f,
                InstrumentStatus.OK);
        System.out.println(data1.getContextSource().getName());
        dataRepo.save(data1);
        return null;
    }

    public Optional<WetLabFile> getWetLabFileByChecksum(String checksum) {
        return fileRepository.findOneByChecksum(checksum);
    }

    public WetLabFile insertFile(WetLabFile toInsert, UUID wetLabApiKey) {
        if (getWetLabFileByChecksum(toInsert.getChecksum()).isPresent()) {
            throw new DataIntegrityViolationException("A file with that checksum already exists!");
        }
        Optional<WetLab> wetlab = wetlabRepo.findOneByApiKey(wetLabApiKey);
        if (!wetlab.isPresent()) {
            throw new DataRetrievalFailureException("WetLab not found");
        }
        if (isLastFile(toInsert, wetlab.get())) {
            throw new DataIntegrityViolationException(
                    "Can not insert this file because it is not the last file! | Checksum: " + toInsert.getChecksum());
        }
        toInsert.setType(wetlab.get());
        fileRepository.save(toInsert);
        return toInsert;
    }

    private boolean isLastFile(WetLabFile file, WetLab wetlab) {
        return fileRepository.findOneByCreationDateGreaterThanAndTypeApiKey(file.getCreation_date(), wetlab.getApiKey())
                .isPresent();
    }

}