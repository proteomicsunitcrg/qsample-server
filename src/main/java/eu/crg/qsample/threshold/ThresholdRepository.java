package eu.crg.qsample.threshold;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.param.Param;
import eu.crg.qsample.wetlab.WetLab;

@Repository
public interface ThresholdRepository extends CrudRepository<Threshold, Long> {
    Optional <Threshold> findOneByThresholdParamsContextSourceAndParamAndWetLab(ContextSource cs, Param param, WetLab wetlab);

    Optional<Threshold> findOneByParamAndWetLab(Param param, WetLab wetlab);

    Optional <List<Threshold>> findByWetLab(WetLab wetLab);
}