package eu.crg.qsample.charts.dto;

public class ApplicationChartConfigDTO {

    private Long id;
    private Long applicationId;
    private Long chartId;
    private String chartName;
    private String chartTitle;
    private String chartType;
    private String dataSourceKey;
    private Boolean enabled;
    private Integer orderIndex;

    public ApplicationChartConfigDTO(
            Long id,
            Long applicationId,
            Long chartId,
            String chartName,
            String chartTitle,
            String chartType,
            String dataSourceKey,
            Boolean enabled,
            Integer orderIndex
    ) {
        this.id = id;
        this.applicationId = applicationId;
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

    public Long getApplicationId() {
        return applicationId;
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