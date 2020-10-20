package eu.crg.qsample.qgenerator.instrument;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InstrumentRepository extends CrudRepository<Instrument, Long>{

}
