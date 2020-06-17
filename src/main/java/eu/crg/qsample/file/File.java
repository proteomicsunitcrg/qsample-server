package eu.crg.qsample.file;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "file")
public class File {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "file_seq")
    @SequenceGenerator(name = "file_seq", sequenceName = "file_seq", allocationSize = 1)
    private Long id;

    @Column(name = "checksum", length = 50)
    @NotNull
    private String checksum;

    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	@Column(name = "creation_date", columnDefinition = "DATETIME")
    private Date creationDate;

    @Column(name = "filename", length = 50)
    @NotNull
    private String filename;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getChecksum() {
        return checksum;
    }

    public void setChecksum(String checksum) {
        this.checksum = checksum;
    }

    public Date getCreation_date() {
        return creationDate;
    }

    public void setCreation_date(Date creation_date) {
        this.creationDate = creation_date;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public File() {
    }

    public File(Long id, String checksum, Date creation_date, String filename) {
        this.id = id;
        this.checksum = checksum;
        this.creationDate = creation_date;
        this.filename = filename;
    }



}