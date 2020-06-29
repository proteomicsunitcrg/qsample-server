package eu.crg.qsample.threshold.params;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ThresholdParamsId implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 13329L;

    @Column(nullable = false, updatable = false)
    private Long thresholdId;
    @Column(nullable = false, updatable = false)
    private Long contextSourceId;

    public ThresholdParamsId() {
    }

    public Long getThresholdId() {
        return thresholdId;
    }

    public void setThresholdId(Long thresholdId) {
        this.thresholdId = thresholdId;
    }

    public Long getContextSourceId() {
        return contextSourceId;
    }

    public void setContextSourceId(Long contextSourceId) {
        this.contextSourceId = contextSourceId;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((contextSourceId == null) ? 0 : contextSourceId.hashCode());
        result = prime * result + ((thresholdId == null) ? 0 : thresholdId.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        ThresholdParamsId other = (ThresholdParamsId) obj;
        if (contextSourceId == null) {
            if (other.contextSourceId != null)
                return false;
        } else if (!contextSourceId.equals(other.contextSourceId))
            return false;
        if (thresholdId == null) {
            if (other.thresholdId != null)
                return false;
        } else if (!thresholdId.equals(other.thresholdId))
            return false;
        return true;
    }

    public ThresholdParamsId(Long thresholdId, Long contextSourceId) {
        this.thresholdId = thresholdId;
        this.contextSourceId = contextSourceId;
    }

}
