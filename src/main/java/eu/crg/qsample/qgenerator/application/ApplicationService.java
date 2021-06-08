package eu.crg.qsample.qgenerator.application;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.crg.qsample.qgenerator.injections_conditions.InjectionConditions;
import eu.crg.qsample.qgenerator.instrument.Instrument;

@Service
public class ApplicationService {

    @Autowired
    ApplicationRepository applicationRepo;

    public List<Application> getAll() {
        List<Application> applications = new ArrayList<>();
        applicationRepo.findAll().forEach(applications::add);
        return applications;
    }

    public Application getById(Long id) {
        return applicationRepo.findById(id).get();
    }

    public Application save(Application instrument) {
        return applicationRepo.save(instrument);
    }

    public boolean delete(Long id) {
        try {
            applicationRepo.deleteById(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public Application getByName(String name) {
        return applicationRepo.findOneByName(name);
    }

}
