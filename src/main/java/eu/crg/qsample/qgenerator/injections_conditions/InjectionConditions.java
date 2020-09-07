package eu.crg.qsample.qgenerator.injections_conditions;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import eu.crg.qsample.qgenerator.application.Application;
import eu.crg.qsample.qgenerator.instrument.Instrument;

@Entity
@Table(name = "injectionConditions")
public class InjectionConditions {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "injectionConditions_seq")
    @SequenceGenerator(name = "injectionConditions_seq", sequenceName = "injectionConditions_seq", allocationSize = 1)
    private Long id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "instrument_id", referencedColumnName = "id")
    private Instrument instrument;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "application_id", referencedColumnName = "id")
    private Application application;

    @Column(name = "method")
    private String method;

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

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public Float getVolume() {
        return volume;
    }

    public void setVolume(Float volume) {
        this.volume = volume;
    }

    public InjectionConditions() {
    }

    public InjectionConditions(Long id, Instrument instrument, Application application, String method, Float volume) {
        this.id = id;
        this.instrument = instrument;
        this.application = application;
        this.method = method;
        this.volume = volume;
    }

}
