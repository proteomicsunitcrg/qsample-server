package eu.crg.qsample.charts.dto;

public class ChartDefinitionDTO {

    private Long id;
    private String name;
    private String title;
    private String description;
    private String chartType;
    private String library;
    private String dataSourceKey;
    private Boolean active;

    public ChartDefinitionDTO(Long id, String name, String title, String description,
                              String chartType, String library, String dataSourceKey,
                              Boolean active) {
        this.id = id;
        this.name = name;
        this.title = title;
        this.description = description;
        this.chartType = chartType;
        this.library = library;
        this.dataSourceKey = dataSourceKey;
        this.active = active;
    }

    public Long getId() { return id; }
    public String getName() { return name; }
    public String getTitle() { return title; }
    public String getDescription() { return description; }
    public String getChartType() { return chartType; }
    public String getLibrary() { return library; }
    public String getDataSourceKey() { return dataSourceKey; }
    public Boolean getActive() { return active; }
}
