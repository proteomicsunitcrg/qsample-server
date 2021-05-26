package eu.crg.qsample.file.fileinfo;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.stereotype.Service;

import eu.crg.qsample.file.RequestFile;
import eu.crg.qsample.file.RequestFileRepository;

@Service
public class FileInfoService {

    @Autowired
    RequestFileRepository fileRepository;

    @Autowired
    FileInfoRepository fileInfoRepository;

    public void insertFileInfoFromPipeline(FileInfoFromPipeline fileInfoPipeline) {
        Optional<RequestFile> fileOpt = fileRepository.findOneByChecksum(fileInfoPipeline.getFile().getChecksum());
        if (!fileOpt.isPresent()) {
            System.out.println("File not found");
            throw new DataRetrievalFailureException("File not found");
        }
        fileOpt.get().setFileInfo(fileInfoRepository.save(fileInfoPipeline.getInfo()));
        fileRepository.save(fileOpt.get());
    }

    public void deleteFileInfo(FileInfo fileInfo) {
        fileInfoRepository.delete(fileInfo);
    }
}
