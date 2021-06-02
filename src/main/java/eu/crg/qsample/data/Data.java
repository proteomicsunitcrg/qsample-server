package eu.crg.qsample.data;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import eu.crg.qsample.threshold.InstrumentStatus;
import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.file.File;
import eu.crg.qsample.param.Param;

@Entity
@Table(name = "data")
public class Data {
    // @JsonIgnore
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "data_seq")
    @SequenceGenerator(name = "data_seq", sequenceName = "data_seq", allocationSize = 1)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "paramId", insertable = true, updatable = false)
    private Param param;

    @ManyToOne
    @JoinColumn(name = "contextSourceId", insertable = true, updatable = false)
    private ContextSource contextSource;

    @ManyToOne
    @JoinColumn(name = "fileId", insertable = true, updatable = false)
    private File file;

    private Float value;

    private Float calculatedValue;

    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "varchar(255) default 'OK'")
    private InstrumentStatus nonConformityStatus = InstrumentStatus.OK;

    public Float getValue() {
        return value;
    }

    public void setValue(Float value) {
        this.value = value;
    }

    public Data() {
    }

    public Data(Param param, ContextSource contextSource, File file) {
        this.param = param;
        this.contextSource = contextSource;
        this.file = file;
    }

    public Long getDataId() {
        return id;
    }

    public void setDataId(Long dataId) {
        this.id = dataId;
    }

    public Param getParam() {
        return param;
    }

    public void setParam(Param param) {
        this.param = param;
    }

    public ContextSource getContextSource() {
        return contextSource;
    }

    public void setContextSource(ContextSource contextSource) {
        this.contextSource = contextSource;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public Float getCalculatedValue() {
        if (calculatedValue == null) {
            return Float.NaN;
        }
        return calculatedValue;
    }

    public void setCalculatedValue(Float calculatedValue) {
        this.calculatedValue = calculatedValue;
    }

    public InstrumentStatus getNonConformityStatus() {
        return nonConformityStatus;
    }

    public void setNonConformityStatus(InstrumentStatus nonConformityStatus) {
        this.nonConformityStatus = nonConformityStatus;
    }

    @Override
    public String toString() {
        return "Data [calculatedValue=" + calculatedValue + ", contextSource=" + contextSource + ", dataId=" + id
                + ", file=" + file + ", nonConformityStatus=" + nonConformityStatus + ", param=" + param + ", value="
                + value + "]";
    }

    public Data(Long id, Param param, ContextSource contextSource, File file, Float value, Float calculatedValue,
            InstrumentStatus nonConformityStatus) {
        this.id = id;
        this.param = param;
        this.contextSource = contextSource;
        this.file = file;
        this.value = value;
        this.calculatedValue = calculatedValue;
        this.nonConformityStatus = nonConformityStatus;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


}