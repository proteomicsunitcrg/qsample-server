package eu.crg.qsample.charts.dto;

public class ChartSeriesDataPointDTO {

    private String label;
    private String series;
    private Double value;
    private String checksum;
    private String creationDate;


    public ChartSeriesDataPointDTO(String label, String series, Double value, String checksum, String creationDate) {
        this.label = label;
        this.series = series;
        this.value = value;
        this.checksum = checksum;
        this.creationDate = creationDate;

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

    public String getCreationDate() {
        return creationDate;
    }

    public Double getValue() {
        return value;
    }
}