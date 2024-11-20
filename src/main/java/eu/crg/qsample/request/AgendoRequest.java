package eu.crg.qsample.request;

import com.google.gson.annotations.SerializedName;
import java.util.ArrayList;
import java.util.List;

public class AgendoRequest {
  private long id;

  private String ref;

  private String group;

  @SerializedName("class")
  private String classs;

  private String date_created;

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

  private List<AgendoRequestSample> samples;

  private String localCode;

  private String localCreator;

  private String localCreationDate;

  private String localTaxonomy;

  public String getLocalTaxonomy() {
    return localTaxonomy;
  }

  public void setLocalTaxonomy(String localTaxonomy) {
    this.localTaxonomy = localTaxonomy;
  }

  public List<AgendoRequestSample> getSamples() {
    return samples;
  }

  public void setSamples(List<AgendoRequestSample> samples) {
    this.samples = samples;
  }

  // This needed to be created for syncing with RequestLocal
  public void setSamplesViaString(String samplesStr) {
    // samplesStr = "Sample1---Sample2---Sample3"
    String[] sampleNames = samplesStr.split("---");
    List<AgendoRequestSample> samples = new ArrayList<>();

    for (String sampleName : sampleNames) {
      AgendoRequestSample sample = new AgendoRequestSample();
      sample.setCode(sampleName);
      samples.add(sample);
    }

    this.samples = samples;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public String getRef() {
    return ref;
  }

  public void setRef(String ref) {
    this.ref = ref;
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

  public String getdate_created() {
    return date_created.split("\\.")[0];
  }

  public void setdate_created(String date_created) {
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

  public AgendoRequest() {}

  public AgendoRequest(
      long id,
      String ref,
      String group,
      String classs,
      String date_created,
      String status,
      String account,
      String total,
      String delivery_date,
      String delivery_location,
      String comment,
      AgendoRequestLastAction last_action,
      AgendoRequestUser created_by,
      List<AgendoRequestFieldProduct> fields,
      List<AgendoRequestFieldProduct> products) {
    this.id = id;
    this.ref = ref;
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

  public AgendoRequest(
      long id, String ref, String group, String classs, String date_created, String status) {
    this.id = id;
    this.ref = ref;
    this.group = group;
    this.classs = classs;
    this.date_created = date_created;
    this.status = status;
  }

  public String getLocalCode() {
    return localCode;
  }

  public void setLocalCode(String localCode) {
    this.localCode = localCode;
  }

  public String getLocalCreator() {
    return localCreator;
  }

  public void setLocalCreator(String localCreator) {
    this.localCreator = localCreator;
  }

  public String getLocalCreationDate() {
    return localCreationDate;
  }

  public void setLocalCreationDate(String localCreationDate) {
    this.localCreationDate = localCreationDate;
  }

  @Override
  public String toString() {
    return "AgendoRequest [account="
        + account
        + ", classs="
        + classs
        + ", comment="
        + comment
        + ", created_by="
        + created_by
        + ", date_created="
        + date_created
        + ", delivery_date="
        + delivery_date
        + ", delivery_location="
        + delivery_location
        + ", fields="
        + fields
        + ", group="
        + group
        + ", id="
        + id
        + ", last_action="
        + last_action
        + ", localCode="
        + localCode
        + ", localCreationDate="
        + localCreationDate
        + ", localCreator="
        + localCreator
        + ", products="
        + products
        + ", ref="
        + ref
        + ", status="
        + status
        + ", total="
        + total
        + "]";
  }
}
