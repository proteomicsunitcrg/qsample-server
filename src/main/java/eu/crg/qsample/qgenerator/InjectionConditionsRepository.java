package eu.crg.qsample.qgenerator;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import eu.crg.qsample.qgenerator.injections_conditions.InjectionConditions;

@Repository
public interface InjectionConditionsRepository extends CrudRepository<InjectionConditions, Long>{

    Optional<List<InjectionConditions>> findByApplicationName(String appName);

    Optional <InjectionConditions> findByApplicationNameAndInstrumentId(String appName, Long instrumentId);

}
