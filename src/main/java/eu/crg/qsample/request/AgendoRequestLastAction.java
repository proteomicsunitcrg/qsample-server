package eu.crg.qsample.request;

import java.util.Date;

public class AgendoRequestLastAction {

    private AgendoRequestUser user;

    private Date date;

    private String action;

    public AgendoRequestUser getUser() {
        return user;
    }

    public void setUser(AgendoRequestUser user) {
        this.user = user;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public AgendoRequestLastAction() {
    }

    public AgendoRequestLastAction(AgendoRequestUser user, Date date, String action) {
        this.user = user;
        this.date = date;
        this.action = action;
    }


}