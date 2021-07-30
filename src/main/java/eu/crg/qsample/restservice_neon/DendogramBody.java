package eu.crg.qsample.restservice_neon;

import java.util.List;

public class DendogramBody {

    private List<List<Double>> values;

    private List<String> labels;

    private String theme;

    public DendogramBody() {
    }

    public DendogramBody(List<List<Double>> values, List<String> labels, String theme) {
        this.values = values;
        this.labels = labels;
        this.theme = theme;
    }

    public List<List<Double>> getValues() {
        return values;
    }

    public void setValues(List<List<Double>> values) {
        this.values = values;
    }

    public List<String> getLabels() {
        return labels;
    }

    public void setLabels(List<String> labels) {
        this.labels = labels;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }



}
