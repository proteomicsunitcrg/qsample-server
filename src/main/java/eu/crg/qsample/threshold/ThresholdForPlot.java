package eu.crg.qsample.threshold;


public class ThresholdForPlot {

    private Direction direction;

    private int steps;

    private float stepValue;

    private float initialValue;

    public Direction getDirection() {
        return direction;
    }

    public void setDirection(Direction direction) {
        this.direction = direction;
    }

    public int getSteps() {
        return steps;
    }

    public void setSteps(int steps) {
        this.steps = steps;
    }

    public float getStepValue() {
        return stepValue;
    }

    public void setStepValue(float stepValue) {
        this.stepValue = stepValue;
    }

    public float getInitialValue() {
        return initialValue;
    }

    public void setInitialValue(float initialValue) {
        this.initialValue = initialValue;
    }

    public ThresholdForPlot(Direction direction, int steps, float stepValue, float initialValue) {
        this.direction = direction;
        this.steps = steps;
        this.stepValue = stepValue;
        this.initialValue = initialValue;
    }

}