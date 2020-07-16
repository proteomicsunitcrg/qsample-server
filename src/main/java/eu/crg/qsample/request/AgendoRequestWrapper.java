package eu.crg.qsample.request;

public class AgendoRequestWrapper {
    private boolean success;

    private long count;

    private AgendoRequest request;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    public AgendoRequest getRequest() {
        return request;
    }

    public void setRequest(AgendoRequest request) {
        this.request = request;
    }

    public AgendoRequestWrapper() {
    }

    public AgendoRequestWrapper(boolean success, long count, AgendoRequest request) {
        this.success = success;
        this.count = count;
        this.request = request;
    }


}