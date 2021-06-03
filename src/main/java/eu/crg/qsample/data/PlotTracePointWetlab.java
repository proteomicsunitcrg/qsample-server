package eu.crg.qsample.data;

import eu.crg.qsample.threshold.InstrumentStatus;
import eu.crg.qsample.file.File;


public class PlotTracePointWetlab {
    private String name;

    private double value;

    private Float std;



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public PlotTracePointWetlab(String name, double value, Float std) {
        this.name = name;
        this.value = value;
        this.std = std;
    }

    public PlotTracePointWetlab(String name, double value) {
        this.name = name;
        this.value = value;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }



    public Float getStd() {
        return std;
    }

    public void setStd(Float std) {
        this.std = std;
    }


}