package eu.crg.qsample.qgenerator.application.instruments;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ApplicationInstrumentsId implements Serializable {

  @Column(name = "application_id")
  private Long applicationId;

  @Column(name = "instrument_id")
  private Long instrumentId;

  // Getters, setters, equals, and hashCode
  public Long getApplicationId() {
    return applicationId;
  }

  public void setApplicationId(Long applicationId) {
    this.applicationId = applicationId;
  }

  public Long getInstrumentId() {
    return instrumentId;
  }

  public void setInstrumentId(Long instrumentId) {
    this.instrumentId = instrumentId;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    ApplicationInstrumentsId that = (ApplicationInstrumentsId) o;
    return Objects.equals(applicationId, that.applicationId)
        && Objects.equals(instrumentId, that.instrumentId);
  }

  @Override
  public int hashCode() {
    return Objects.hash(applicationId, instrumentId);
  }
}
