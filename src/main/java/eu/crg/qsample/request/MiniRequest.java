package eu.crg.qsample.request;

import java.util.Date;

public class MiniRequest {
    private long id;

    private String type;

    private String creatorMail;

    private String creatorName;

    private String creationDate;

    private String status;

    private String lastField; // request code

    private boolean hasData;

    private boolean local;

    



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

    public String getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(String creationDate) {
        this.creationDate = creationDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    public String getLastField() {
        return lastField;
    }

    public void setLastField(String lastField) {
        this.lastField = lastField;
    }

    public boolean isHasData() {
        return hasData;
    }

    public void setHasData(boolean hasData) {
        this.hasData = hasData;
    }

    public MiniRequest() {
    }

    public MiniRequest(long id, String type, String creatorMail, String creatorName,String creationDate, String status) {
        this.id = id;
        this.type = type;
        this.creatorMail = creatorMail;
        this.creatorName = creatorName;
        this.creationDate = creationDate;
        this.status = status;
    }

    public MiniRequest(long id, String type, String creatorMail, String creatorName, String creationDate, String status,
            String lastField, boolean hasData, boolean local) {
        this.id = id;
        this.type = type;
        this.creatorMail = creatorMail;
        this.creatorName = creatorName;
        this.creationDate = creationDate;
        this.status = status;
        this.lastField = lastField;
        this.hasData = hasData;
        this.local = local;
    }

    public boolean isLocal() {
        return local;
    }

    public void setLocal(boolean local) {
        this.local = local;
    }



}