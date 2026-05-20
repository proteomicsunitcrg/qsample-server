package eu.crg.qsample.charts.dto;

public class ChartDataPointDTO {

    private String label;
    private Number value;
    private String checksum;


    public ChartDataPointDTO() {
    }

    public ChartDataPointDTO(String label, Number value, String checksum) {
        this.label = label;
        this.value = value;
        this.checksum = checksum;

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

    public String getChecksum() {
        return checksum;
    }

    public void setChecksum(String checksum) {
        this.checksum = checksum;
    }

    public void setValue(Number value) {
        this.value = value;
        this.checksum = checksum;

    }
}