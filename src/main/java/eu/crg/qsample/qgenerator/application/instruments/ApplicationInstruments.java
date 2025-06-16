package eu.crg.qsample.qgenerator.application.instruments;

import eu.crg.qsample.qgenerator.application.Application;
import eu.crg.qsample.qgenerator.instrument.Instrument;
import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "application_instruments")
public class ApplicationInstruments implements Serializable {

  @EmbeddedId private ApplicationInstrumentsId applicationInstrumentsId;

  @ManyToOne
  @JoinColumn(name = "application_id", insertable = false, updatable = false)
  private Application application;

  @ManyToOne
  @JoinColumn(name = "instrument_id", insertable = false, updatable = false)
  private Instrument instrument;

  // Getters and setters
  public ApplicationInstrumentsId getApplicationInstrumentsId() {
    return applicationInstrumentsId;
  }

  public void setApplicationInstrumentId(ApplicationInstrumentsId applicationInstrumentsId) {
    this.applicationInstrumentsId = applicationInstrumentsId;
  }

  public Application getApplication() {
    return application;
  }

  public void setApplication(Application application) {
    this.application = application;
  }

  public Instrument getInstrument() {
    return instrument;
  }

  public void setInstrument(Instrument instrument) {
    this.instrument = instrument;
  }
}
