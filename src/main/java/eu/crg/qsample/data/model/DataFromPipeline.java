package eu.crg.qsample.data.model;

import java.util.List;

import eu.crg.qsample.file.File;
import eu.crg.qsample.wetlab.WetLabFile;

public class DataFromPipeline {

    private WetLabFile file;

    private List<ParameterData> data;

    public WetLabFile getFile() {
        return file;
    }

    public void setFile(WetLabFile file) {
        this.file = file;
    }

    public List<ParameterData> getData() {
        return data;
    }

    public void setData(List<ParameterData> data) {
        this.data = data;
    }

}
