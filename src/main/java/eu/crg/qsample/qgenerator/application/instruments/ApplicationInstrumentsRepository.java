package eu.crg.qsample.qgenerator.application.instruments;

import eu.crg.qsample.qgenerator.application.Application;
import eu.crg.qsample.qgenerator.instrument.Instrument;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface ApplicationInstrumentsRepository
    extends CrudRepository<ApplicationInstruments, Long> {
  @Query("SELECT ai.instrument FROM ApplicationInstruments ai WHERE ai.application = :application")
  List<Instrument> findInstrumentsByApplication(Application application);
}
