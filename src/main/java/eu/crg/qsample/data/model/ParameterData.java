package eu.crg.qsample.data.model;

import java.util.List;

import eu.crg.qsample.param.Param;

public class ParameterData {

    private Param parameter;

    private List<DataValues> values;

    public Param getParameter() {
        return parameter;
    }

    public void setParameter(Param parameter) {
        this.parameter = parameter;
    }

    public List<DataValues> getValues() {
        return values;
    }

    public void setValues(List<DataValues> values) {
        this.values = values;
    }

    public ParameterData(Long paramId, List<DataValues> values) {
        this.parameter = new Param();
        this.parameter.setId(paramId);
        this.values = values;
    }

}
