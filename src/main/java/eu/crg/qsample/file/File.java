package eu.crg.qsample.file;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.validator.constraints.UniqueElements;

@Entity
@Table(name = "file")
public class File {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "file_seq")
    @SequenceGenerator(name = "file_seq", sequenceName = "file_seq", allocationSize = 1)
    private Long id;

    @Column(name = "checksum", length = 50, unique = true)
    @NotNull
    private String checksum;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	  @Column(name = "creation_date", columnDefinition = "DATETIME")
    private Date creationDate;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @CreationTimestamp
    @Column(name = "insert_date", columnDefinition = "DATETIME", updatable = false)
    private Date insertDate;

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

    @JsonAlias({ "creation_date" })
    @JsonProperty("creation_date")
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @JsonAlias({ "insert_date" })
    @JsonProperty("insert_date")
    public Date getInsertDate() {
        return insertDate;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public File() {
    }

    public File(Long id, String checksum, Date creationDate, String filename) {
        this.id = id;
        this.checksum = checksum;
        this.creationDate = creationDate;
        this.filename = filename;
    }



}
