package eu.crg.qsample.request.local;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import eu.crg.qsample.qgenerator.application.Application;

@Entity
@Table(name = "request_local")
public class RequestLocal {

    @Id
    @GeneratedValue
    private Long id;

    private String requestCode;

    @ManyToOne
    private Application application;

    private Date creationDate;

    @Column(name = "statuss") // some version f mysql doest accept that name
    private String status;

    @Column(name = "groupp")
    private String group;

    private String creator;

    @Column(length = 5000) // some version f mysql doest accept that name
    private String samples; // all samples stored at the same field separated by ---

    private String taxonomy;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRequestCode() {
        return requestCode;
    }

    public void setRequestCode(String requestCode) {
        this.requestCode = requestCode;
    }

    public Application getApplication() {
        return application;
    }

    public void setApplication(Application application) {
        this.application = application;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public String getSamples() {
        return samples;
    }

    public void setSamples(String samples) {
        this.samples = samples;
    }

    public String getTaxonomy() {
        return taxonomy;
    }

    public void setTaxonomy(String taxonomy) {
        this.taxonomy = taxonomy;
    }

    

    public RequestLocal() {
    }

    public RequestLocal(Long id, String requestCode, Application application, Date creationDate, String status, String group,
            String samples, String taxonomy, String creator) {
        this.id = id;
        this.requestCode = requestCode;
        this.application = application;
        this.creationDate = creationDate;
        this.status = status;
        this.group = group;
        this.samples = samples;
        this.taxonomy = taxonomy;
        this.creator = creator;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    
}