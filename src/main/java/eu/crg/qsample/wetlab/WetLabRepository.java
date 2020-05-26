package eu.crg.qsample.wetlab;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WetLabRepository extends CrudRepository<WetLab, Long> {

    public Optional <WetLab> findOneByApiKey(UUID apiKey);

}