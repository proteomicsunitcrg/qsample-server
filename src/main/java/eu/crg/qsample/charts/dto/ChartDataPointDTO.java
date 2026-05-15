package eu.crg.qsample.charts.dto;

public class ChartDataPointDTO {

    private String label;
    private Number value;

    public ChartDataPointDTO() {
    }

    public ChartDataPointDTO(String label, Number value) {
        this.label = label;
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public Number getValue() {
        return value;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public void setValue(Number value) {
        this.value = value;
    }
}