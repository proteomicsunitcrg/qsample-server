package eu.crg.qsample.charts.dto;

public class WetlabPlotConfigDTO {

    private Long id;
    private Long wetlabId;
    private Long plotId;
    private String plotName;
    private Boolean enabled;
    private Integer orderIndex;

    public WetlabPlotConfigDTO(
            Long id,
            Long wetlabId,
            Long plotId,
            String plotName,
            Boolean enabled,
            Integer orderIndex
    ) {
        this.id = id;
        this.wetlabId = wetlabId;
        this.plotId = plotId;
        this.plotName = plotName;
        this.enabled = enabled;
        this.orderIndex = orderIndex;
    }

    public Long getId() {
        return id;
    }

    public Long getWetlabId() {
        return wetlabId;
    }

    public Long getPlotId() {
        return plotId;
    }

    public String getPlotName() {
        return plotName;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public Integer getOrderIndex() {
        return orderIndex;
    }
}
