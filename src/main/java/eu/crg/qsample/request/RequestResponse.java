package eu.crg.qsample.request;


public class RequestResponse {

    private Long id;

    private String name;

    private String status;

    private Long assignedTo;

    public RequestResponse() {
    }

    public RequestResponse(Long id, String name, String status, Long assignedTo) {
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

    public Long getAssignedTo() {
        return assignedTo;
    }

    public void setAssignedTo(Long assignedTo) {
        this.assignedTo = assignedTo;
    }
}