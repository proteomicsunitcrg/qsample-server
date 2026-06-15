package eu.crg.qsample.charts.dto;

public class WetlabPlotConfigSaveDTO {

    private Long plotId;
    private Boolean enabled;
    private Integer orderIndex;

    public Long getPlotId() {
        return plotId;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public Integer getOrderIndex() {
        return orderIndex;
    }

    public void setPlotId(Long plotId) {
        this.plotId = plotId;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public void setOrderIndex(Integer orderIndex) {
        this.orderIndex = orderIndex;
    }
}
