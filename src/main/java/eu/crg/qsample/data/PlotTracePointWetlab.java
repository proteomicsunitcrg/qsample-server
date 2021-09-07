package eu.crg.qsample.data;

import eu.crg.qsample.threshold.InstrumentStatus;
import eu.crg.qsample.file.File;


public class PlotTracePointWetlab {
    private String name;

    private double value;

    private double std;

    private int order;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public PlotTracePointWetlab(String name, double value, double std) {
        this.name = name;
        this.value = value;
        this.std = std;
    }

    public PlotTracePointWetlab(String name, double value) {
        this.name = name;
        this.value = value;
    }


    public PlotTracePointWetlab(String name, double value, double std, int order) {
        this.name = name;
        this.value = value;
        this.std = std;
        this.order = order;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }



    public double getStd() {
        return std;
    }

    public void setStd(double std) {
        this.std = std;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }




}