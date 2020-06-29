package eu.crg.qsample.threshold;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import eu.crg.qsample.wetlab.WetLabService;

@RestController
@RequestMapping("/api/threshold")
public class ThresholdController {

    @Autowired
    ThresholdService thresholdService;

    @GetMapping("/plot/{chartApiKey}/{wetlabApiKey}")
    @PreAuthorize("hasRole('INTERNAL')")
    public ThresholdForPlot getThresholdForPlot(@PathVariable UUID chartApiKey, @PathVariable UUID wetlabApiKey) {
        return thresholdService.getThresholdForPlot(chartApiKey, wetlabApiKey);
    }
}