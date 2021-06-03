package eu.crg.qsample.threshold;

import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.crg.qsample.plot.Plot;
import eu.crg.qsample.plot.PlotRepository;
import eu.crg.qsample.threshold.params.ThresholdParams;
import eu.crg.qsample.wetlab.WetLab;
import eu.crg.qsample.wetlab.WetLabRepository;

@Service
public class ThresholdService {

    @Autowired
    PlotRepository plotRepo;

    @Autowired
    WetLabRepository wetLabRepo;

    @Autowired
    ThresholdRepository thresholdRepository;

    public ThresholdForPlot getThresholdForPlot(UUID chartApiKey, UUID wetlabApiKey) {
        Optional<WetLab> wetlab = wetLabRepo.findOneByApiKey(wetlabApiKey);
        Plot plot = null;
        if (wetlab.isPresent()) {
            for (Plot ploterino: wetlab.get().getPlot()) {
                if (ploterino.getApiKey().equals(chartApiKey)) {
                    plot = ploterino;
                    break;
                }
            }
            if (plot.getContextSource().size()>1) {
                System.out.println("Plot has more than one cs");
                return null;
            }
            Optional <Threshold> threshold = thresholdRepository.findOneByThresholdParamsContextSourceAndParamAndWetLab(plot.getContextSource().get(0), plot.getParam(), wetlab.get());
            if (threshold.isPresent()) {
                for (ThresholdParams param: threshold.get().getThresholdParams()) {
                    if(param.getContextSource().getApiKey().equals(plot.getContextSource().get(0).getApiKey())) {
                        ThresholdForPlot forPlot = new ThresholdForPlot(threshold.get().getNonConformityDirection(), threshold.get().getSteps(),param.getStepValue(), param.getInitialValue());
                        return forPlot;
                    }
                }
                return null;
            } else {
                System.out.println("No threshold found");
                return null;
            }
        }
        System.out.println("Wetlab not found");
        return null;
    }

}