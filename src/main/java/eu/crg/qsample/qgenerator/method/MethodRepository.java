package eu.crg.qsample.qgenerator.method;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MethodRepository extends CrudRepository<Method, Long>{

}
