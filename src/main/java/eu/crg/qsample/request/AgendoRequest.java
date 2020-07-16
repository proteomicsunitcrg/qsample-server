package eu.crg.qsample.request;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AgendoRequest {
    private long id;

    private String group;

    @JsonProperty("class")
    private String classs;

    private Date date_created;

    private String status;

    private String account;

    private String total;

    private String delivery_date;

    private String delivery_location;

    private String comment;

    private AgendoRequestLastAction last_action;

    private AgendoRequestUser created_by;

    private List<AgendoRequestFieldProduct> fields;

    private List<AgendoRequestFieldProduct> products;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public String getClasss() {
        return classs;
    }

    public void setClasss(String classs) {
        this.classs = classs;
    }

    public Date getdate_created() {
        return date_created;
    }

    public void setdate_created(Date date_created) {
        this.date_created = date_created;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getDelivery_date() {
        return delivery_date;
    }

    public void setDelivery_date(String delivery_date) {
        this.delivery_date = delivery_date;
    }

    public String getDelivery_location() {
        return delivery_location;
    }

    public void setDelivery_location(String delivery_location) {
        this.delivery_location = delivery_location;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public AgendoRequestLastAction getLast_action() {
        return last_action;
    }

    public void setLast_action(AgendoRequestLastAction last_action) {
        this.last_action = last_action;
    }

    public AgendoRequestUser getCreated_by() {
        return created_by;
    }

    public void setCreated_by(AgendoRequestUser created_by) {
        this.created_by = created_by;
    }

    public List<AgendoRequestFieldProduct> getFields() {
        return fields;
    }

    public void setFields(List<AgendoRequestFieldProduct> fields) {
        this.fields = fields;
    }

    public List<AgendoRequestFieldProduct> getProducts() {
        return products;
    }

    public void setProducts(List<AgendoRequestFieldProduct> products) {
        this.products = products;
    }

    public AgendoRequest() {
    }

    public AgendoRequest(long id, String group, String classs, Date date_created, String status, String account,
            String total, String delivery_date, String delivery_location, String comment,
            AgendoRequestLastAction last_action, AgendoRequestUser created_by, List<AgendoRequestFieldProduct> fields,
            List<AgendoRequestFieldProduct> products) {
        this.id = id;
        this.group = group;
        this.classs = classs;
        this.date_created = date_created;
        this.status = status;
        this.account = account;
        this.total = total;
        this.delivery_date = delivery_date;
        this.delivery_location = delivery_location;
        this.comment = comment;
        this.last_action = last_action;
        this.created_by = created_by;
        this.fields = fields;
        this.products = products;
    }



}