package eu.crg.qsample.guideset;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import eu.crg.qsample.wetlab.WetLab;

public interface GuideSetRepository extends CrudRepository<GuideSet, Long>{
}