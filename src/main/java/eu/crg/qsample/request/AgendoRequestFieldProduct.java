package eu.crg.qsample.request;

public class AgendoRequestFieldProduct {

    private long id;

    private String name;

    private String value;

    private long type;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public long getType() {
        return type;
    }

    public void setType(long type) {
        this.type = type;
    }

    public AgendoRequestFieldProduct(long id, String name, String value, long type) {
        this.id = id;
        this.name = name;
        this.value = value;
        this.type = type;
    }

    public AgendoRequestFieldProduct() {
    }

    @Override
    public String toString() {
        return "AgendoRequestFieldProduct [id=" + id + ", name=" + name + ", type=" + type + ", value=" + value + "]";
    }


}