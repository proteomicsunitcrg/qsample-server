package eu.crg.qsample.request;

import java.util.List;

public class AgendoRequestSample {

  private long sampleId;
  private String code;
  private long requestHistory;
  private List<AgendoRequestSampleValue> values;

  // Getters and Setters
  public long getSampleId() {
    return sampleId;
  }

  public void setSampleId(long sampleId) {
    this.sampleId = sampleId;
  }

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public long getRequestHistory() {
    return requestHistory;
  }

  public void setRequestHistory(long requestHistory) {
    this.requestHistory = requestHistory;
  }

  public List<AgendoRequestSampleValue> getValues() {
    return values;
  }

  public void setValues(List<AgendoRequestSampleValue> values) {
    this.values = values;
  }
}
