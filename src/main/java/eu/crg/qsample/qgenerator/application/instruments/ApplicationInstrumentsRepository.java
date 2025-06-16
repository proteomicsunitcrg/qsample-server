package eu.crg.qsample.qgenerator.application.instruments;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface ApplicationInstrumentsRepository
    extends CrudRepository<ApplicationInstruments, Long> {

  @Query(
      "SELECT ai.instrumentId FROM application_instruments ai WHERE ai.applicationId ="
          + " :applicationId")
  List<Long> findInstrumentIdsByApplicationId(Long applicationId);
}
