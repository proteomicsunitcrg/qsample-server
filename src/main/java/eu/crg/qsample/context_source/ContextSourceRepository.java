package eu.crg.qsample.context_source;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.repository.CrudRepository;

public interface ContextSourceRepository extends CrudRepository<ContextSource, Long> {

    Optional <ContextSource> findOneByApiKey(UUID apiKey);
}