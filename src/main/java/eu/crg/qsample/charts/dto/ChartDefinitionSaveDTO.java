package eu.crg.qsample.charts.dto;

import java.util.List;

public class ChartDefinitionSaveDTO {

    private String name;
    private String title;
    private String description;
    private String chartType;
    private String chartMode;
    private String library;
    private String dataSourceKey;
    private Boolean active;
    private String providerType;
    private String constraintFlag;
    private List<ChartParameterSaveDTO> parameters;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getChartType() {
        return chartType;
    }

    public void setChartType(String chartType) {
        this.chartType = chartType;
    }

    public String getChartMode() {
        return chartMode;
    }

    public void setChartMode(String chartMode) {
        this.chartMode = chartMode;
    }

    public String getLibrary() {
        return library;
    }

    public void setLibrary(String library) {
        this.library = library;
    }

    public String getDataSourceKey() {
        return dataSourceKey;
    }

    public void setDataSourceKey(String dataSourceKey) {
        this.dataSourceKey = dataSourceKey;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public String getProviderType() {
        return providerType;
    }

    public void setProviderType(String providerType) {
        this.providerType = providerType;
    }

    public String getConstraintFlag() {
        return constraintFlag;
    }

    public void setConstraintFlag(String constraintFlag) {
        this.constraintFlag = constraintFlag;
    }

    public List<ChartParameterSaveDTO> getParameters() {
        return parameters;
    }

    public void setParameters(List<ChartParameterSaveDTO> parameters) {
        this.parameters = parameters;
    }
}