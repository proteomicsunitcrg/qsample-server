package eu.crg.qsample.plot;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.repository.CrudRepository;

public interface PlotRepository extends CrudRepository<Plot, Long> {

    Optional <Plot> findOneByApiKey(UUID apiKey);
}