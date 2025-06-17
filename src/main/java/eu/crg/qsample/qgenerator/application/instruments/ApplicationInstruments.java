package eu.crg.qsample.qgenerator.application.instruments;

import eu.crg.qsample.qgenerator.application.Application;
import eu.crg.qsample.qgenerator.instrument.Instrument;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "application_instruments")
public class ApplicationInstruments implements Serializable {

  @Id
  @Column(name = "id")
  @GeneratedValue(strategy = GenerationType.AUTO, generator = "application_instruments_seq")
  @SequenceGenerator(
      name = "application_instruments_seq",
      sequenceName = "application_instruments_seq",
      allocationSize = 1)
  private Long id;

  @ManyToOne
  @JoinColumn(name = "application_id", referencedColumnName = "id")
  private Application application;

  @ManyToOne
  @JoinColumn(name = "instrument_id", referencedColumnName = "id")
  private Instrument instrument;

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

  public ApplicationInstruments(Long id, Application application, Instrument instrument) {
    this.id = id;
    this.application = application;
    this.instrument = instrument;
  }

  public ApplicationInstruments() {}
}
