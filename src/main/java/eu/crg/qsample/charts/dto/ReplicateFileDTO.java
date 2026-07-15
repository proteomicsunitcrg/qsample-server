package eu.crg.qsample.charts.dto;

public class ReplicateFileDTO {

    private String filename;
    private Number value;

    public ReplicateFileDTO() {
    }

    public ReplicateFileDTO(String filename, Number value) {
        this.filename = filename;
        this.value = value;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Number getValue() {
        return value;
    }

    public void setValue(Number value) {
        this.value = value;
    }
}
