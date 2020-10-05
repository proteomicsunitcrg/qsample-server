package eu.crg.qsample.data.model;

import java.util.UUID;

public class DataValues {

    private Long contextSource;

    private Float value;

    private Float calculatedValue;

    private Float std;

    public Long getContextSource() {
        return contextSource;
    }

    public void setContextSource(Long contextSource) {
        this.contextSource = contextSource;
    }

    public Float getValue() {
        return value;
    }

    public void setValue(Float value) {
        this.value = value;
    }

    public Float getCalculatedValue() {
        return calculatedValue;
    }

    public void setCalculatedValue(Float calculatedValue) {
        this.calculatedValue = calculatedValue;
    }

    public Float getStd() {
        return std;
    }

    public void setStd(Float std) {
        this.std = std;
    }

    public DataValues(Long contextSource, Float value, Float calculatedValue, Float std) {
        this.contextSource = contextSource;
        this.value = value;
        this.calculatedValue = calculatedValue;
        this.std = std;
    }

}
