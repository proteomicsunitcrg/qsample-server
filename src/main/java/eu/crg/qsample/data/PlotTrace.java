package eu.crg.qsample.data;

import java.util.ArrayList;
import java.util.List;

import eu.crg.qsample.TraceColor.TraceColor;

public class PlotTrace implements Comparable<PlotTrace> {

    private String abbreviated;

    private TraceColor traceColor;

    private List<PlotTracePoint> plotTracePoints;

    private Long contextSourceId;

    public PlotTrace() {
        this.plotTracePoints = new ArrayList<>();
    }

    public String getAbbreviated() {
        return abbreviated;
    }

    public void setAbbreviated(String abbreviated) {
        this.abbreviated = abbreviated;
    }

    public TraceColor getTraceColor() {
        return traceColor;
    }

    public void setTraceColor(TraceColor traceColor) {
        this.traceColor = traceColor;
    }

    public List<PlotTracePoint> getPlotTracePoints() {
        return plotTracePoints;
    }

    public void setPlotTracePoints(List<PlotTracePoint> plotTracePoints) {
        this.plotTracePoints = plotTracePoints;
    }

    @Override
    public int compareTo(PlotTrace o) {
        try {
            Float me = Float.parseFloat(abbreviated);
            Float other = Float.parseFloat(o.getAbbreviated());
            if (me > other) {
                return -1;
            } else {
                return 1;
            }
        } catch (NullPointerException npe) {
            return 0;
        } catch (NumberFormatException nfe) {
            return 0;
        }
    }

    public Long getContextSourceId() {
        return contextSourceId;
    }

    public void setContextSourceId(Long contextSourceId) {
        this.contextSourceId = contextSourceId;
    }

}