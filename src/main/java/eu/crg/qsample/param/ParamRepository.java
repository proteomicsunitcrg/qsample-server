package eu.crg.qsample.param;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.repository.CrudRepository;

public interface ParamRepository extends CrudRepository<Param, Long> {

    Optional<Param> findOneByApiKey(UUID apiKey);

    List<Param> findAll();

}