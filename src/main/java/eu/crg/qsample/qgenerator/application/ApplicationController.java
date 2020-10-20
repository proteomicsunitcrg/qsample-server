package eu.crg.qsample.qgenerator.application;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import eu.crg.qsample.qgenerator.injections_conditions.InjectionConditions;
import eu.crg.qsample.qgenerator.instrument.Instrument;

@RestController
@RequestMapping("/api/application")
public class ApplicationController {


    @Autowired
    ApplicationService applicationService;

    @GetMapping
    @PreAuthorize("hasRole('INTERNAL')")
    public List<Application> getAll() {
        return applicationService.getAll();
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasRole('INTERNAL')")
    public Application getById(@PathVariable Long id) {
        return applicationService.getById(id);
    }

    @PostMapping
    @PreAuthorize("hasRole('MANAGER')")
    public Application save(@RequestBody Application instrument) {
        return applicationService.save(instrument);
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('MANAGER')")
    public boolean delete(@PathVariable Long id) {
        return applicationService.delete(id);
    }

}
