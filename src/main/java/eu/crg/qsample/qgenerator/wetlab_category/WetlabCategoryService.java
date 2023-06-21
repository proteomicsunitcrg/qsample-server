package eu.crg.qsample.qgenerator.wetlab_category;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.crg.qsample.qgenerator.injections_conditions.InjectionConditions;
import eu.crg.qsample.qgenerator.instrument.Instrument;

@Service
public class WetlabCategoryService {

    @Autowired
    WetlabCategoryRepository wetlab_categoryRepo;

    public List<WetlabCategory> getAll() {
        List<WetlabCategory> wetlab_categories = new ArrayList<>();
        WetlabCategoryRepo.findAll().forEach(wetlab_categories::add);
        return wetlab_categories;
    }

    public WetlabCategory getById(Long id) {
        return WetlabCategoryRepo.findById(id).get();
    }

    public WetlabCategory getByName(String name) {
        return WetlabCategoryRepo.findOneByName(name);
    }

}
