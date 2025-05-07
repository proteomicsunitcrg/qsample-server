package eu.crg.qsample.qgenerator.qctype;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "qctype")
public class QCtype {

  @Id
  @Column(name = "id")
  @GeneratedValue(strategy = GenerationType.AUTO, generator = "qctype_seq")
  @SequenceGenerator(name = "qctype_seq", sequenceName = "qctype_seq", allocationSize = 1)
  private Long id;

  @Column(name = "name", length = 255)
  @NotNull
  private String name;

  @Column(name = "position", length = 20)
  private String position;

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

  public String getPosition() {
    return position;
  }

  public void setPosition(String position) {
    this.position = position;
  }

  public QCtype() {}

  public QCtype(Long id, @NotNull String name, String position) {
    this.id = id;
    this.name = name;
	this.position = position;
  }
}
