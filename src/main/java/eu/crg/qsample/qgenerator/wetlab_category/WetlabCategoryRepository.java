package eu.crg.qsample.qgenerator.wetlab_category;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WetlabCategoryRepository extends CrudRepository<WetlabCategory, Long>{

    public WetlabCategory findOneByName(String name);

}
