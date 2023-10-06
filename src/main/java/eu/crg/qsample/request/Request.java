package eu.crg.qsample.request;

import eu.crg.qsample.security.model.User;

public class Request {

    private Long id;

    private String name;

    private String status;

    private User assignedTo;

    public Request() {}

    public Request(Long id, String name, String status, User assignedTo) {
        this.id = id;
        this.name = name;
        this.status = status;
        this.assignedTo = assignedTo;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public User getAssignedTo() {
        return assignedTo;
    }

    public void setAssignedTo(User assignedTo) {
        this.assignedTo = assignedTo;
    }
}
