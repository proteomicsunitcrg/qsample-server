package eu.crg.qsample.file;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.crg.qsample.context_source.ContextSourceRepository;
import eu.crg.qsample.data.Data;
import eu.crg.qsample.data.DataRepository;
import eu.crg.qsample.param.ParamRepository;
import eu.crg.qsample.threshold.InstrumentStatus;
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


    public File insertDummyFileData() {
        System.out.println(csRepo.findById(1l).get().toString());
        File file1 = new WetLabFile(null, "check1", new Date(), "dummy1", wetlabRepo.findById(1l).get());
        fileRepository.save(file1);
        Data data1 = new Data(null, paramRepo.findById(1l).get(), csRepo.findById(1l).get(),file1, 23f, 12f, InstrumentStatus.OK);
        System.out.println(data1.getContextSource().getName());
        dataRepo.save(data1);
        return null;
	}

}