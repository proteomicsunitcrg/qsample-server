package eu.crg.qsample.request;

public class AgendoField {

    private Long id;

    private String value;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public AgendoField(Long id, String value) {
        this.id = id;
        this.value = value;
    }

    public AgendoField() {
    }


}
