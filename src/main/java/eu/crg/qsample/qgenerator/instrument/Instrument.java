package eu.crg.qsample.qgenerator.instrument;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "instrument")
public class Instrument {

  @Id
  @Column(name = "id")
  @GeneratedValue(strategy = GenerationType.AUTO, generator = "instrument_seq")
  @SequenceGenerator(name = "instrument_seq", sequenceName = "instrument_seq", allocationSize = 1)
  private Long id;

  @Column(name = "name", length = 50)
  @NotNull
  private String name;

  @Column(name = "path", length = 255)
  private String path;

  @Column(name = "method", length = 255)
  private String method;

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

  public String getPath() {
    return path;
  }

  public void setPath(String path) {
    this.path = path;
  }

  public String getMethod() {
    return method;
  }

  public void setMethod(String method) {
    this.method = method;
  }

  public Instrument() {}

  public Instrument(Long id, @NotNull String name, String path, String method) {
    this.id = id;
    this.name = name;
    this.path = path;
    this.method = method;
  }
}
