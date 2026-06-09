package eu.crg.qsample.charts.dto;

public class ChartDataPointDTO {

    private String label;
    private Number value;
    private String checksum;
    private String creationDate;



    public ChartDataPointDTO() {
    }

    public ChartDataPointDTO(String label, Number value, String checksum, String creationDate) {
        this.label = label;
        this.value = value;
        this.checksum = checksum;
        this.creationDate = creationDate;


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

    public String getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(String creationDate) {
        this.creationDate = creationDate;
    }

    public void setChecksum(String checksum) {
        this.checksum = checksum;
    }

    public void setValue(Number value) {
        this.value = value;
    }
}