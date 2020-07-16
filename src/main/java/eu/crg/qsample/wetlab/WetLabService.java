package eu.crg.qsample.wetlab;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.crg.qsample.data.DataRepository;
import eu.crg.qsample.exceptions.NotFoundException;
import eu.crg.qsample.file.FileRepository;
import eu.crg.qsample.file.QCloud2File;

@Service
public class WetLabService {

    @Autowired
    WetLabRepository wetLabRepo;

    @Autowired
    FileRepository fileRepo;

    public List<WetLab> getAllWetLabs() {
        List<WetLab> wetLabs = new ArrayList<>();
        wetLabRepo.findAll().forEach(wetLabs::add);
        return wetLabs;
    }

    public WetLab getByApiKey(UUID apiKey) {
        Optional<WetLab> wetlabOpt = wetLabRepo.findOneByApiKey(apiKey);
        if (wetlabOpt.isPresent()) {
            return wetlabOpt.get();
        } else {
            throw new NotFoundException("WetLab not found");
        }
    }

    public List<WetLabFile> getWetLabFilesByApiKey(UUID apiKey) {
        return fileRepo.findAllByTypeApiKey(apiKey);
    }

}