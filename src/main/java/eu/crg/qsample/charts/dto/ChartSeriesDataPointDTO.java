package eu.crg.qsample.charts.dto;

public class ChartSeriesDataPointDTO {

    private String label;
    private String series;
    private Double value;
    private String checksum;


    public ChartSeriesDataPointDTO(String label, String series, Double value, String checksum) {
        this.label = label;
        this.series = series;
        this.value = value;
        this.checksum = checksum;

    }

    public String getLabel() {
        return label;
    }

    public String getSeries() {
        return series;
    }

    public String getChecksum() {
        return checksum;
    }

    public Double getValue() {
        return value;
    }
}