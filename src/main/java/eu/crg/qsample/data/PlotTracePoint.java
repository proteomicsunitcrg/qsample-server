package eu.crg.qsample.data;

import eu.crg.qsample.threshold.InstrumentStatus;
import eu.crg.qsample.file.File;


public class PlotTracePoint {
    private File file;

    private Float value;

    private Float std;

    private InstrumentStatus nonConformityStatus;

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public Float getValue() {
        return value;
    }

    public void setValue(Float value) {
        this.value = value;
    }

    public PlotTracePoint(File file, Float value, InstrumentStatus nonConformityStatus) {
        this.file = new File();
        this.file.setFilename(file.getFilename());
        this.file.setCreationDate(file.getCreationDate());
        this.file.setChecksum(file.getChecksum());
        this.value = value;
        this.nonConformityStatus = nonConformityStatus;
    }

    public InstrumentStatus getNonConformityStatus() {
        return nonConformityStatus;
    }

    public void setNonConformityStatus(InstrumentStatus nonConformityStatus) {
        this.nonConformityStatus = nonConformityStatus;
    }

    public Float getStd() {
        return std;
    }

    public void setStd(Float std) {
        this.std = std;
    }

    public PlotTracePoint(File file, Float value, Float std, InstrumentStatus nonConformityStatus) {
        this.file = file;
        this.value = value;
        this.std = std;
        this.nonConformityStatus = nonConformityStatus;
    }

}