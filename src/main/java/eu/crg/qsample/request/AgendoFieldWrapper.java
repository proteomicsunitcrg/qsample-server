package eu.crg.qsample.request;

import java.util.List;

public class AgendoFieldWrapper {
    private List<AgendoField> fields;

    public List<AgendoField> getFields() {
        return fields;
    }

    public void setFields(List<AgendoField> fields) {
        this.fields = fields;
    }

    public AgendoFieldWrapper() {
    }

    public AgendoFieldWrapper(List<AgendoField> fields) {
        this.fields = fields;
    }


}
