package eu.crg.qsample.charts.dto;

public class ChartSeriesDataPointDTO {

    private String label;
    private String series;
    private Double value;

    public ChartSeriesDataPointDTO(String label, String series, Double value) {
        this.label = label;
        this.series = series;
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public String getSeries() {
        return series;
    }

    public Double getValue() {
        return value;
    }
}