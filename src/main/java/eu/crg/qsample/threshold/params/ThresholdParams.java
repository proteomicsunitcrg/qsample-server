package eu.crg.qsample.threshold.params;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.threshold.Threshold;

@Entity
@Table(name = "threshold_params")
public class ThresholdParams {

    @EmbeddedId
    private ThresholdParamsId thresholdParamsId;

    @Column(name = "step_value")
    private Float stepValue;

    @Column(name = "initial_value", nullable = true)
    private Float initialValue;

    @ManyToOne
    @JoinColumn(name = "contextSourceId", insertable = false, updatable = false)
    private ContextSource contextSource;

    @Column(name = "is_enabled", columnDefinition = "tinyint(1) default 1")
    private boolean isEnabled;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "thresholdId", insertable = false, updatable = false)
    private Threshold threshold;

    public ThresholdParamsId getThresholdParamsId() {
        return thresholdParamsId;
    }

    public void setThresholdParamsId(ThresholdParamsId thresholdParamsId) {
        this.thresholdParamsId = thresholdParamsId;
    }

    public Float getStepValue() {
        return stepValue;
    }

    public void setStepValue(Float stepValue) {
        this.stepValue = stepValue;
    }

    public Float getInitialValue() {
        return initialValue;
    }

    public void setInitialValue(Float initialValue) {
        this.initialValue = initialValue;
    }

    public ContextSource getContextSource() {
        return contextSource;
    }

    public void setContextSource(ContextSource contextSource) {
        this.contextSource = contextSource;
    }

    public boolean isEnabled() {
        return isEnabled;
    }

    public void setEnabled(boolean isEnabled) {
        this.isEnabled = isEnabled;
    }

    public ThresholdParams() {
    }

    public ThresholdParams(ThresholdParamsId thresholdParamsId, Float stepValue, Float initialValue,
            ContextSource contextSource, boolean isEnabled) {
        this.thresholdParamsId = thresholdParamsId;
        this.stepValue = stepValue;
        this.initialValue = initialValue;
        this.contextSource = contextSource;
        this.isEnabled = isEnabled;
    }

    @Override
    public String toString() {
        return "ThresholdParams [contextSource=" + contextSource.getName() + ", initialValue=" + initialValue + ", isEnabled="
                + isEnabled + ", stepValue=" + stepValue + ", threshold=" + threshold + ", thresholdParamsId="
                + thresholdParamsId + "]";
    }
}
