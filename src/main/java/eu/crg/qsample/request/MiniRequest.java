package eu.crg.qsample.request;

import java.util.Date;

public class MiniRequest {
    private long id;

    private String type;

    private String creatorMail;

    private Date creationDate;

    private String status;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCreatorMail() {
        return creatorMail;
    }

    public void setCreatorMail(String creatorMail) {
        this.creatorMail = creatorMail;
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

    public MiniRequest() {
    }

    public MiniRequest(long id, String type, String creatorMail, Date creationDate, String status) {
        this.id = id;
        this.type = type;
        this.creatorMail = creatorMail;
        this.creationDate = creationDate;
        this.status = status;
    }


}