package eu.crg.qsample.qgenerator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import eu.crg.qsample.qgenerator.injections_conditions.InjectionConditions;
import eu.crg.qsample.qgenerator.instrument.Instrument;

@RestController
@RequestMapping("/api/qgenerator")
public class QGeneratorController {


    @Autowired
    QGeneratorService qGeneratorService;

    @GetMapping("/available/{appName}")
    @PreAuthorize("hasRole('INTERNAL')")
    public List<Instrument> getInstruentsByAppName(@PathVariable String appName) {
        return qGeneratorService.getInstruentsByAppName(appName);
    }

    @GetMapping("/getByAppNameAndInstrumentId/{appName}/{instrumentId}")
    @PreAuthorize("hasRole('INTERNAL')")
    public InjectionConditions getMethodsByAppNameAndInstrumentId(@PathVariable String appName, @PathVariable Long instrumentId) {
        return qGeneratorService.getMethodsByAppNameAndInstrumentId(appName, instrumentId);
    }
}
