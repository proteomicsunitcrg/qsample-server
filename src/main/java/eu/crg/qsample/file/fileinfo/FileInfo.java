package eu.crg.qsample.file.fileinfo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class FileInfo {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "file_info_seq")
    @SequenceGenerator(name = "file_info_seq", sequenceName = "file_info_seq", allocationSize = 1)
    private Long id;

    @Column
    private Long peptideHits;


    @Column
    private Long peptideModified;

    public Long getPeptideHits() {
        return peptideHits;
    }

    public void setPeptideHits(Long peptideHits) {
        this.peptideHits = peptideHits;
    }

    public Long getPeptideModified() {
        return peptideModified;
    }

    public void setPeptideModified(Long peptideModified) {
        this.peptideModified = peptideModified;
    }

    public FileInfo() {
    }

    public FileInfo(Long id, Long peptideHits, Long peptideModified) {
        this.id = id;
        this.peptideHits = peptideHits;
        this.peptideModified = peptideModified;
    }



}
