package eu.crg.qsample.charts.dto;

public class WetlabChartConfigDTO {

    private Long id;
    private Long wetlabId;
    private Long chartId;
    private String chartName;
    private String chartTitle;
    private String chartType;
    private String dataSourceKey;
    private Boolean enabled;
    private Integer orderIndex;

    public WetlabChartConfigDTO(
            Long id,
            Long wetlabId,
            Long chartId,
            String chartName,
            String chartTitle,
            String chartType,
            String dataSourceKey,
            Boolean enabled,
            Integer orderIndex
    ) {
        this.id = id;
        this.wetlabId = wetlabId;
        this.chartId = chartId;
        this.chartName = chartName;
        this.chartTitle = chartTitle;
        this.chartType = chartType;
        this.dataSourceKey = dataSourceKey;
        this.enabled = enabled;
        this.orderIndex = orderIndex;
    }

    public Long getId() {
        return id;
    }

    public Long getWetlabId() {
        return wetlabId;
    }

    public Long getChartId() {
        return chartId;
    }

    public String getChartName() {
        return chartName;
    }

    public String getChartTitle() {
        return chartTitle;
    }

    public String getChartType() {
        return chartType;
    }

    public String getDataSourceKey() {
        return dataSourceKey;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public Integer getOrderIndex() {
        return orderIndex;
    }
}
