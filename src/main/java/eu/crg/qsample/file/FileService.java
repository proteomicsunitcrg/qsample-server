package eu.crg.qsample.file;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.ws.rs.NotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import eu.crg.qsample.threshold.InstrumentStatus;
import eu.crg.qsample.context_source.ContextSourceRepository;
import eu.crg.qsample.data.Data;
import eu.crg.qsample.data.DataRepository;
import eu.crg.qsample.guideset.GuideSetRepository;
import eu.crg.qsample.mail.Mail;
import eu.crg.qsample.mail.MailService;
import eu.crg.qsample.param.ParamRepository;
import eu.crg.qsample.request.favorite_request.FavoriteRequestRepository;
import eu.crg.qsample.request.favorite_request.FavoriteRequestService;
import eu.crg.qsample.request.favorite_request.FavoriteRequestsUsers;
import eu.crg.qsample.restservice_nextflow.RestServiceNextflow;
import eu.crg.qsample.restservice_qcloud2.ResponseFile;
import eu.crg.qsample.restservice_qcloud2.RestServiceQCloud2;
import eu.crg.qsample.security.model.User;
import eu.crg.qsample.threshold.InstrumentStatus;
import eu.crg.qsample.wetlab.WetLab;
import eu.crg.qsample.wetlab.WetLabFile;
import eu.crg.qsample.wetlab.WetLabRepository;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

@Service
public class FileService {

    private final Log logger = LogFactory.getLog(this.getClass());

    @Autowired
    WetLabRepository wetlabRepo;

    @Autowired
    FileRepository fileRepository;

    @Autowired
    RequestFileRepository requestFileRepo;

    @Autowired
    ParamRepository paramRepo;

    @Autowired
    ContextSourceRepository csRepo;

    @Autowired
    DataRepository dataRepo;

    @Autowired
    GuideSetRepository guideSetRepo;

    @Autowired
    RestServiceQCloud2 restQcloud2;

    @Autowired
    MailService mailService;

    @Autowired
    FavoriteRequestService favoriteRequestService;

    @Autowired
    RestServiceNextflow restServiceNextflow;

    @Value("${qcloud2.disable}")
    boolean qcloud2Disabled;

    public File insertDummyFileData() {
        // System.out.println(csRepo.findById(1l).get().toString());
        File file1 = new WetLabFile(null, "check1", new Date(), "dummy1", wetlabRepo.findById(1l).get());
        fileRepository.save(file1);
        Data data1 = new Data(null, paramRepo.findById(1l).get(), csRepo.findById(1l).get(), file1, 23f, 12f,
                InstrumentStatus.OK);
        // System.out.println(data1.getContextSource().getName());
        dataRepo.save(data1);
        return null;
    }

    public Optional<WetLabFile> getFileByChecksum(String checksum) {
        return fileRepository.findOneByChecksum(checksum);
    }

    public WetLabFile insertFile(WetLabFile toInsert, UUID wetLabApiKey) {
        if (getFileByChecksum(toInsert.getChecksum()).isPresent()) {
            throw new DataIntegrityViolationException("A file with that checksum already exists!");
        }
        Optional<WetLab> wetlab = wetlabRepo.findOneByApiKey(wetLabApiKey);
        if (!wetlab.isPresent()) {
            throw new DataRetrievalFailureException("WetLab not found");
        }
        // if (isLastFile(toInsert, wetlab.get())) {
        //     throw new DataIntegrityViolationException(
        //             "Can not insert this file because it is not the last file! | Checksum: " + toInsert.getChecksum());
        // }
        Optional <List<WetLabFile>> checker = fileRepository.findOneBytypeApiKeyAndWeekAndYearAndReplicate(wetLabApiKey, toInsert.getWeek(), toInsert.getYear(), toInsert.getReplicate());
        if (checker.isPresent()) {
            throw new DataIntegrityViolationException(
                "Can not insert this file a file in this wetlab exists with this replicate, week and year | Checksum: " + toInsert.getChecksum());
        }
        toInsert.setType(wetlab.get());
        fileRepository.save(toInsert);
        return toInsert;
    }

    private boolean isLastFile(WetLabFile file, WetLab wetlab) {
        return fileRepository.findByCreationDateGreaterThanAndTypeApiKey(file.getCreationDate(), wetlab.getApiKey())
                .isPresent();
    }

    public List<QCloud2File> getQCloud2Files(String requestCode) {
        List<QCloud2File> res = restQcloud2.getFiles(requestCode);
        return res;
    }

    public File insertFileRequest(RequestFile file) {
        if (requestFileRepo.findOneByChecksum(file.getChecksum()).isPresent()) {
            throw new DataIntegrityViolationException("A file with that checksum already exists!");
        }
        logger.info("File inserted with checksum: " + file.getChecksum());
        RequestFile fileInserted = fileRepository.save(file);
        notifyToFavRequest(fileInserted);
        return fileInserted;
    }

    public void notifyToFavRequest(RequestFile file) {
        List <FavoriteRequestsUsers> favRequestList = favoriteRequestService.getByRequestCodeAndNotify(file.getRequestCode(), true);
        if (favRequestList.size() != 0) {
            List <User> users = new ArrayList<>();
            for (FavoriteRequestsUsers rel: favRequestList) {
                users.add(rel.getUser());
            }
            Mail mail = mailService.createFilePipelineNotifyMail(users, file);
            mailService.sendManualEmail(mail);
        }
    }

    public boolean checkFileExists(String checksum) {
        Optional<WetLabFile> wetlabOpt = fileRepository.findOneByChecksum(checksum);
        Optional<RequestFile> reqFileOpt = requestFileRepo.findOneByChecksum(checksum);
        if (!wetlabOpt.isPresent() && !reqFileOpt.isPresent()) {
            return true;
        } else {
            return false;
        }
    }

    public List<RequestFile> findAllByRequestCode(String requestCode, String order) {
        Optional<List<RequestFile>> files = Optional.of(new ArrayList<RequestFile>());
        switch (order) {
            case "filename":
            files = fileRepository.findAllByRequestCodeOrderByFilename(requestCode);
                break;
            case "date":
            files = fileRepository.findAllByRequestCodeOrderByCreationDate(requestCode);
                break;
            default:
            files = fileRepository.findAllByRequestCodeOrderByFilename(requestCode);
                break;
        }
        if (!files.isPresent()) {
            return null;
        }
        return files.get();
    }

    public RequestFile getRequestFileByChecksum(String checksum) {
        Optional <RequestFile> optFile = requestFileRepo.findOneByChecksum(checksum);
        if (optFile.isPresent()) {
            return optFile.get();
        }  else {
            throw new DataRetrievalFailureException("File not found");
        }
    }

    public List<RequestFile> getRequestFileDashboard(Date startDate, Date endDate, String filename, String code) {
        return requestFileRepo.findAllByCreationDateBetweenAndRequestCodeContainsAndFilenameContainsOrderByCreationDateDesc(endDate, startDate, filename, code);
        // return fileRepository.findAllByRequestCodeContainsAndFilenameContainsOrderByFilename(filename, code);
    }

    public List<WetLabFile> getWetlabFileDashboard(Date startDate, Date endDate, String filename, Long wetlabId) {
        // System.out.println(wetlabId);
        if (wetlabId == 0l) {
            return fileRepository.findAllByCreationDateBetweenAndFilenameContainsOrderByCreationDateDesc(endDate, startDate, filename);
        }
        return fileRepository.findAllByCreationDateBetweenAndFilenameContainsAndTypeIdOrderByCreationDateDesc(endDate, startDate, filename, wetlabId);
    }

    public String getNextflowWorkflow() {
        return restServiceNextflow.getWorkflows();
    }

    public boolean isWorkflowEnabled() {
        return qcloud2Disabled;
    }

}
