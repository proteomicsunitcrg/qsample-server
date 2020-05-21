package eu.crg.qsample.data;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import eu.crg.qsample.Threshold.InstrumentStatus;
import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.file.File;
import eu.crg.qsample.param.Param;

@Entity
@Table(name = "data")
public class Data {
    @JsonIgnore
	@EmbeddedId
	private DataId dataId;

	@ManyToOne
	@JoinColumn(name = "paramId", insertable = false, updatable = false)
	private Param param;

	@ManyToOne
	@JoinColumn(name = "contextSourceId", insertable = false, updatable = false)
	private ContextSource contextSource;

	@ManyToOne
	@JoinColumn(name = "fileId", insertable = false, updatable = false)
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

	public DataId getDataId() {
		return dataId;
	}

	public void setDataId(DataId dataId) {
		this.dataId = dataId;
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
		return "Data [calculatedValue=" + calculatedValue + ", contextSource=" + contextSource + ", dataId=" + dataId
				+ ", file=" + file + ", nonConformityStatus=" + nonConformityStatus + ", param=" + param + ", value="
				+ value + "]";
	}

}