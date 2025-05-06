package eu.crg.qsample.qgenerator;

import eu.crg.qsample.qgenerator.injections_conditions.InjectionConditions;
import java.util.List;
import java.util.Optional;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InjectionConditionsRepository extends CrudRepository<InjectionConditions, Long> {

  Optional<List<InjectionConditions>> findByApplicationName(String appName);

  Optional<InjectionConditions> findByApplicationIdAndInstrumentId(Long appId, Long instrumentId);
}
