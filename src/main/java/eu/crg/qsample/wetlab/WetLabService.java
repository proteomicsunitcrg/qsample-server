package eu.crg.qsample.wetlab;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.crg.qsample.exceptions.NotFoundException;

@Service
public class WetLabService {

    @Autowired
    WetLabRepository wetLabRepo;

	public List<WetLab> getAllWetLabs() {
        List<WetLab> wetLabs = new ArrayList<>();
        wetLabRepo.findAll().forEach(wetLabs::add);
        return wetLabs;
	}

	public WetLab getByApiKey(UUID apiKey) {
        System.out.println(apiKey);
        Optional <WetLab> wetlabOpt =  wetLabRepo.findOneByApiKey(apiKey);
        if (wetlabOpt.isPresent()) {
            return wetlabOpt.get();
        } else {
            throw new NotFoundException("WetLab not found");
        }
	}

}