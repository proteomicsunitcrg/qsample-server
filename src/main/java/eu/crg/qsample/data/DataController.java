package eu.crg.qsample.data;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@RestController
@RequestMapping("/api/data")
public class DataController {

    @Autowired
    DataService dataService;

    @GetMapping("/traces/{startDate}/{endDate}/{plotId}/{wetLabApiKey}")
    @PreAuthorize("hasRole('INTERNAL')")
    public List<PlotTrace> getTrace(@PathVariable @DateTimeFormat(iso = ISO.DATE_TIME) java.util.Date startDate,
    @PathVariable @DateTimeFormat(iso = ISO.DATE_TIME) java.util.Date endDate, @PathVariable Long plotId,
    @PathVariable UUID wetLabApiKey) {
        return dataService.getTraceData(startDate, endDate, plotId, wetLabApiKey);
    }
}