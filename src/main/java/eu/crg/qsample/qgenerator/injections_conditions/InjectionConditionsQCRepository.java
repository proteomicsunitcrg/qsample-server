package eu.crg.qsample.qgenerator.injections_conditions;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import eu.crg.qsample.qgenerator.injections_conditions.InjectionConditions;

@Repository
public interface InjectionConditionsQCRepository extends CrudRepository<InjectionConditionsQC, Long>{

    Optional <List<InjectionConditionsQC>> findByInstrumentIdAndQCtype(Long instrumentId, String qcType);

}
