package eu.crg.qsample.charts.dto;

import java.util.List;

public class ChartDataPointDTO {

    private String label;
    private Number value;
    private String checksum;
    private String creationDate;
    private Number std;
    private List<String> replicateFiles;



    public ChartDataPointDTO() {
    }

    public ChartDataPointDTO(String label, Number value, String checksum, String creationDate) {
        this(label, value, checksum, creationDate, null);
    }

    public ChartDataPointDTO(String label, Number value, String checksum, String creationDate, Number std) {
        this(label, value, checksum, creationDate, std, null);
    }

    public ChartDataPointDTO(String label, Number value, String checksum, String creationDate, Number std, List<String> replicateFiles) {
        this.label = label;
        this.value = value;
        this.checksum = checksum;
        this.creationDate = creationDate;
        this.std = std;
        this.replicateFiles = replicateFiles;
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

    public Number getStd() {
        return std;
    }

    public void setStd(Number std) {
        this.std = std;
    }

    public List<String> getReplicateFiles() {
        return replicateFiles;
    }

    public void setReplicateFiles(List<String> replicateFiles) {
        this.replicateFiles = replicateFiles;
    }

    public void setValue(Number value) {
        this.value = value;
    }
}