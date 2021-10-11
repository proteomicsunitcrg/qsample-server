package eu.crg.qsample.quantification;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import eu.crg.qsample.file.File;

@Entity
@Table(name = "quantification")
public class Quantification {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "quantification_seq")
    @SequenceGenerator(name = "quantification_seq", sequenceName = "quantification_seq", allocationSize = 1)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "fileId", insertable = true, updatable = false)
    private File file;

    private String accession;

    private String description;

    private double abundance;

    private boolean contaminant;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getAccession() {
        return accession;
    }

    public void setAccession(String accession) {
        this.accession = accession;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getAbundance() {
        return abundance;
    }

    public void setAbundance(double abundance) {
        this.abundance = abundance;
    }

    public boolean isContaminant() {
        return contaminant;
    }

    public void setContaminant(boolean contaminant) {
        this.contaminant = contaminant;
    }

    public Quantification() {
    }

    public Quantification(Long id, File file, String accession, String description, double abundance,
            boolean contaminant) {
        this.id = id;
        this.file = file;
        this.accession = accession;
        this.description = description;
        this.abundance = abundance;
        this.contaminant = contaminant;
    }

    @Override
    public String toString() {
        return "Quantification [abundance=" + abundance + ", accession=" + accession + ", contaminant=" + contaminant
                + ", description=" + description + ", file=" + file + ", id=" + id + "]";
    }


}
