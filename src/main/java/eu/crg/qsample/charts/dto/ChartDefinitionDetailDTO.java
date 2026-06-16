package eu.crg.qsample.charts.dto;

import java.util.List;

public class ChartDefinitionDetailDTO {

    private Long id;
    private String name;
    private String title;
    private String description;
    private String chartType;
    private String chartMode;
    private String library;
    private String dataSourceKey;
    private Boolean active;
    private List<ChartParameterDTO> parameters;

    public ChartDefinitionDetailDTO(
            Long id,
            String name,
            String title,
            String description,
            String chartType,
            String chartMode,
            String library,
            String dataSourceKey,
            Boolean active,
            List<ChartParameterDTO> parameters) {
        this.id = id;
        this.name = name;
        this.title = title;
        this.description = description;
        this.chartType = chartType;
        this.chartMode = chartMode;
        this.library = library;
        this.dataSourceKey = dataSourceKey;
        this.active = active;
        this.parameters = parameters;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getChartType() {
        return chartType;
    }

    public String getChartMode() {
        return chartMode;
    }

    public String getLibrary() {
        return library;
    }

    public String getDataSourceKey() {
        return dataSourceKey;
    }

    public Boolean getActive() {
        return active;
    }

    public List<ChartParameterDTO> getParameters() {
        return parameters;
    }
}