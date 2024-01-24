package eu.crg.qsample.modification;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import eu.crg.qsample.file.RequestFile;

@Entity
@Table(name = "modification_file")
public class ModificationFile {

    private Long id;
    private Modification modification;
    private RequestFile file;

    //additional
    private Double value;

    @Id
    @GeneratedValue
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @ManyToOne(cascade = CascadeType.ALL)
    public Modification getModification() {
        return modification;
    }

    public void setModification(Modification modification) {
        this.modification = modification;
    }

    @JsonIgnore
    @ManyToOne(cascade = CascadeType.ALL)
    public RequestFile getFile() {
        return file;
    }

    public void setFile(RequestFile file) {
        this.file = file;
    }

    @Column(name = "value")
    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    public ModificationFile(Long id, Modification modification, RequestFile file, Double value) {
        this.id = id;
        this.modification = modification;
        this.file = file;
        this.value = value;
    }

    public ModificationFile() {
    }


}
