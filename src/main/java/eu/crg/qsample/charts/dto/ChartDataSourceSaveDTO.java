package eu.crg.qsample.charts.dto;

import java.util.List;

public class ChartDataSourceSaveDTO {

    private String name;
    private Long paramId;
    private List<Long> contextSourceIds;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getParamId() {
        return paramId;
    }

    public void setParamId(Long paramId) {
        this.paramId = paramId;
    }

    public List<Long> getContextSourceIds() {
        return contextSourceIds;
    }

    public void setContextSourceIds(List<Long> contextSourceIds) {
        this.contextSourceIds = contextSourceIds;
    }
}
