package eu.crg.qsample.request;

import java.util.List;

public class AgendoRequestWrapper {
  private boolean success;

  private long count;

  private List<AgendoRequest> request;

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

  public List<AgendoRequest> getRequest() {
    return request;
  }

  public void setRequest(List<AgendoRequest> request) {
    this.request = request;
  }

  public AgendoRequestWrapper() {}

  public AgendoRequestWrapper(boolean success, long count, List<AgendoRequest> request) {
    this.success = success;
    this.count = count;
    this.request = request;
  }
}

