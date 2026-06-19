package eu.crg.qsample.charts.dto;

public class WetlabChartConfigSaveDTO {

    private Long chartId;
    private Boolean enabled;
    private Integer orderIndex;

    public Long getChartId() {
        return chartId;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public Integer getOrderIndex() {
        return orderIndex;
    }

    public void setChartId(Long chartId) {
        this.chartId = chartId;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public void setOrderIndex(Integer orderIndex) {
        this.orderIndex = orderIndex;
    }
}
