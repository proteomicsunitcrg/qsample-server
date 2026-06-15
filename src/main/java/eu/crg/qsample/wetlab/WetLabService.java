package eu.crg.qsample.wetlab;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.crg.qsample.charts.entity.WetlabPlotConfig;
import eu.crg.qsample.charts.repository.WetlabPlotConfigRepository;
import eu.crg.qsample.exceptions.NotFoundException;
import eu.crg.qsample.file.FileRepository;
import eu.crg.qsample.plot.Plot;

@Service
public class WetLabService {

    @Autowired
    WetLabRepository wetLabRepo;

    @Autowired
    FileRepository fileRepo;

    @Autowired
    WetlabPlotConfigRepository wetlabPlotConfigRepository;

    public List<WetLab> getAllWetLabs() {
        List<WetLab> wetLabs = new ArrayList<>();
        wetLabRepo.findAll().forEach(wetlab -> wetLabs.add(copyWithConfiguredPlots(wetlab)));
        return wetLabs;
    }

    public WetLab getByApiKey(UUID apiKey) {
        Optional<WetLab> wetlabOpt = wetLabRepo.findOneByApiKey(apiKey);
        if (wetlabOpt.isPresent()) {
            return copyWithConfiguredPlots(wetlabOpt.get());
        } else {
            throw new NotFoundException("WetLab not found");
        }
    }

    public List<WetLabFile> getWetLabFilesByApiKey(UUID apiKey) {
        return fileRepo.findAllByTypeApiKey(apiKey);
    }

    private WetLab copyWithConfiguredPlots(WetLab wetlab) {
        return new WetLab(
                wetlab.getId(),
                wetlab.getApiKey(),
                wetlab.getName(),
                getConfiguredPlots(wetlab),
                wetlab.getWetlabCategory()
        );
    }

    private List<Plot> getConfiguredPlots(WetLab wetlab) {
        List<WetlabPlotConfig> configs =
                wetlabPlotConfigRepository
                        .findByWetlabIdOrderByOrderIndexAsc(wetlab.getId());

        if (configs == null || configs.isEmpty()) {
            return wetlab.getPlot();
        }

        return configs
                .stream()
                .filter(config -> Boolean.TRUE.equals(config.getEnabled()))
                .map(WetlabPlotConfig::getPlot)
                .collect(Collectors.toList());
    }

}
