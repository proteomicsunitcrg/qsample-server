package eu.crg.qsample.data;

import eu.crg.qsample.threshold.InstrumentStatus;
import eu.crg.qsample.wetlab.WetLabFile;

import java.util.List;

import eu.crg.qsample.file.File;

public class PlotTracePointWetlab {
    private String name;

    private double value;

    private double std;

    private int week;

    private int year;

    private List<WetLabFile> triplicats;

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
        this.week = order;
    }

    public PlotTracePointWetlab(String name, double value, double std, int week, int year,
            List<WetLabFile> triplicats) {
        this.name = name;
        this.value = value;
        this.std = std;
        this.week = week;
        this.year = year;
        this.triplicats = triplicats;
    }

    public PlotTracePointWetlab(String name, double value, double std, int week, int year) {
        this.name = name;
        this.value = value;
        this.std = std;
        this.week = week;
        this.year = year;
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

    public int getWeek() {
        return week;
    }

    public void setWeek(int week) {
        this.week = week;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public List<WetLabFile> getTriplicats() {
        return triplicats;
    }

    public void setTriplicats(List<WetLabFile> triplicats) {
        this.triplicats = triplicats;
    }

}