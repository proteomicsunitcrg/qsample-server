package eu.crg.qsample.qgenerator.injections_conditions;

import eu.crg.qsample.qgenerator.application.Application;
import eu.crg.qsample.qgenerator.instrument.Instrument;
import eu.crg.qsample.qgenerator.method.Method;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "injectionConditions")
public class InjectionConditions {

  @Id
  @Column(name = "id")
  @GeneratedValue(strategy = GenerationType.AUTO, generator = "injectionConditions_seq")
  @SequenceGenerator(
      name = "injectionConditions_seq",
      sequenceName = "injectionConditions_seq",
      allocationSize = 1)
  private Long id;

  @OneToOne(cascade = CascadeType.ALL)
  @JoinColumn(name = "instrument_id", referencedColumnName = "id")
  private Instrument instrument;

  @OneToOne(cascade = CascadeType.ALL)
  @JoinColumn(name = "application_id", referencedColumnName = "id")
  private Application application;

  @ManyToMany(cascade = CascadeType.ALL)
  @JoinColumn(name = "method", referencedColumnName = "id")
  List<Method> methods;

  @Column(name = "volume")
  private Float volume;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Instrument getInstrument() {
    return instrument;
  }

  public void setInstrument(Instrument instrument) {
    this.instrument = instrument;
  }

  public Application getApplication() {
    return application;
  }

  public void setApplication(Application application) {
    this.application = application;
  }

  public List<Method> getMethods() {
    return methods;
  }

  public void setMethod(List<Method> methods) {
    this.methods = methods;
  }

  public Float getVolume() {
    return volume;
  }

  public void setVolume(Float volume) {
    this.volume = volume;
  }

  public InjectionConditions() {}

  public InjectionConditions(
      Long id, Instrument instrument, Application application, List<Method> methods, Float volume) {
    this.id = id;
    this.instrument = instrument;
    this.application = application;
    this.methods = methods;
    this.volume = volume;
  }
}
