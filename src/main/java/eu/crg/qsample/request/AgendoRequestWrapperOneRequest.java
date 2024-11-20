package eu.crg.qsample.request;

/**
 * Wrapper to work with JSON from Agendo This class is used only 4 the request that returns one
 * request given 1 id
 */
public class AgendoRequestWrapperOneRequest {
  private boolean success;

  private AgendoRequest request;

  public boolean isSuccess() {
    return success;
  }

  public void setSuccess(boolean success) {
    this.success = success;
  }

  public AgendoRequest getRequest() {
    return request;
  }

  public void setRequest(AgendoRequest request) {
    this.request = request;
  }

  public AgendoRequestWrapperOneRequest() {}

  public AgendoRequestWrapperOneRequest(boolean success, AgendoRequest request) {
    this.success = success;
    this.request = request;
  }
}
