package eu.crg.qsample.restservice_qcloud2;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import eu.crg.qsample.data.NonConformityStatus;

public class ResponseFile implements Serializable{

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private Long id;
    private String filename;
    private String checksum;
    private Date creation_date;
    private NonConformityStatus conformity;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getChecksum() {
        return checksum;
    }

    public void setChecksum(String checksum) {
        this.checksum = checksum;
    }


    public Date getCreation_date() {
        return creation_date;
    }

    @DateTimeFormat(iso = ISO.DATE_TIME)
    public void setCreation_date(Date creation_date) {
        this.creation_date = creation_date;
    }

    public NonConformityStatus getConformity() {
        return conformity;
    }

    public void setConformity(NonConformityStatus conformity) {
        this.conformity = conformity;
    }

    public ResponseFile(Long id, String filename, String checksum, Date creation_date, NonConformityStatus conformity) {
        this.id = id;
        this.filename = filename;
        this.checksum = checksum;
        this.creation_date = creation_date;
        this.conformity = conformity;
    }

    public ResponseFile() {
    }


}