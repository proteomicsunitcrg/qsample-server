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

import eu.crg.qsample.qgenerator.instrument.Instrument;

@Entity
@Table(name = "injection_conditions_qc")
public class InjectionConditionsQC {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "injectionConditions_qc_seq")
    @SequenceGenerator(name = "injectionConditions_qc_seq", sequenceName = "injectionConditions_qc_seq", allocationSize = 1)
    private Long id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "instrument_id", referencedColumnName = "id")
    private Instrument instrument;

    @Column(name = "qctype")
    private String qctype;

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

    public String getQctype() {
        return qctype;
    }

    public void setQctype(String qctype) {
        this.qctype = qctype;
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

    public InjectionConditionsQC(Long id, Instrument instrument, String qctype, String method, Float volume) {
        this.id = id;
        this.instrument = instrument;
        this.qctype = qctype;
        this.method = method;
        this.volume = volume;
    }

    public InjectionConditionsQC() {
    }
}
