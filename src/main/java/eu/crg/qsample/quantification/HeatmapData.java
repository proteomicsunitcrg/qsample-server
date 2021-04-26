package eu.crg.qsample.quantification;

import java.util.List;

public class HeatmapData {
    List<List<Double>> data;

    List <String> names;

    public List<List<Double>> getData() {
        return data;
    }

    public void setData(List<List<Double>> data) {
        this.data = data;
    }

    public HeatmapData() {
    }

    public List<String> getNames() {
        return names;
    }

    public HeatmapData(List<List<Double>> data, List<String> names) {
        this.data = data;
        this.names = names;
    }

    public void setNames(List<String> names) {
        this.names = names;
    }


}
