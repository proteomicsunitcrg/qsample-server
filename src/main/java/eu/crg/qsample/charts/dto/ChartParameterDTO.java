package eu.crg.qsample.charts.dto;

public class ChartParameterDTO {

    private String key;
    private String value;
    private String type;
    private String description;

    public ChartParameterDTO(String key, String value, String type, String description) {
        this.key = key;
        this.value = value;
        this.type = type;
        this.description = description;
    }

    public String getKey() {
        return key;
    }

    public String getValue() {
        return value;
    }

    public String getType() {
        return type;
    }

    public String getDescription() {
        return description;
    }
}