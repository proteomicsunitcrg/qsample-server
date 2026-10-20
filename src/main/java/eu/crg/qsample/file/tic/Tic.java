package eu.crg.qsample.file.tic;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;

import eu.crg.qsample.file.File;

@Entity
public class Tic {

    @Id
    private Long id;

    @OneToOne
    @JoinColumn(name = "file_id")
    @MapsId
    private File file;

    @Column(name = "tic", columnDefinition = "mediumtext")
    private String tic;

    public Tic() {
    }

    public Tic(File file, String tic) {
        this.file = file;
        this.tic = tic;
    }

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

    public String getTic() {
        return tic;
    }

    public void setTic(String tic) {
        this.tic = tic;
    }
}
