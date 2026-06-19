package eu.crg.qsample.charts.dto;

import java.util.Map;

public class ChartConfigDTO {

    private Long id;
    private String name;
    private String title;
    private String description;
    private String chartType;
    private String library;
    private String dataSourceKey;
    private String chartMode;
    private Boolean active;
    private Map<String, Object> parameters;

    public ChartConfigDTO(
            Long id,
            String name,
            String title,
            String description,
            String chartType,
            String library,
            String dataSourceKey,
                String chartMode,
            Boolean active,
            Map<String, Object> parameters
    ) {
        this.id = id;
        this.name = name;
        this.title = title;
        this.description = description;
        this.chartType = chartType;
        this.library = library;
        this.dataSourceKey = dataSourceKey;
        this.chartMode = chartMode;
        this.active = active;
        this.parameters = parameters;
    }

    public Long getId() { return id; }
    public String getName() { return name; }
    public String getTitle() { return title; }
    public String getDescription() { return description; }
    public String getChartType() { return chartType; }
    public String getLibrary() { return library; }
    public String getDataSourceKey() { return dataSourceKey; }
    public String getChartMode() { return chartMode; }
    public Boolean getActive() { return active; }
    public Map<String, Object> getParameters() { return parameters; }
}
