package eu.crg.qsample.request;

/**
 * Wrapper to work with JSON from Agendo
 * This class is used only 4 the request that returns one request given 1 id
 */
public class AgendoRequestResponseWithCode {

    private String requestCode;

    private AgendoRequest request;


    public AgendoRequest getRequest() {
        return request;
    }

    public void setRequest(AgendoRequest request) {
        this.request = request;
    }

    public AgendoRequestResponseWithCode() {
    }

    public AgendoRequestResponseWithCode(String requestCode, AgendoRequest request) {
        this.requestCode = requestCode;
        this.request = request;
    }

    public String getRequestCode() {
        return requestCode;
    }

    public void setRequestCode(String requestCode) {
        this.requestCode = requestCode;
    }


}