package eu.crg.qsample.file;

import java.util.Date;

import eu.crg.qsample.data.NonConformityStatus;

public class QCloud2File extends File {

    private NonConformityStatus conformity;

    private String conformityError;

    private String ls;

    public NonConformityStatus getConformity() {
        return conformity;
    }

    public void setConformity(NonConformityStatus conformity) {
        this.conformity = conformity;
    }

    public QCloud2File(Long id, String checksum, Date creation_date, String filename, NonConformityStatus conformity) {
        super(id, checksum, creation_date, filename);
        this.conformity = conformity;
    }

    public QCloud2File(NonConformityStatus conformity) {
        this.conformity = conformity;
    }

    public QCloud2File() {

    }

    public QCloud2File(NonConformityStatus conformity, String conformityError) {
        this.conformity = conformity;
        this.conformityError = conformityError;
    }

    public QCloud2File(Long id, String checksum, Date creation_date, String filename, NonConformityStatus conformity,
            String conformityError) {
        super(id, checksum, creation_date, filename);
        this.conformity = conformity;
        this.conformityError = conformityError;
    }

    public String getConformityError() {
        return conformityError;
    }

    public void setConformityError(String conformityError) {
        this.conformityError = conformityError;
    }

    public String getLs() {
        return ls;
    }

    public void setLs(String ls) {
        this.ls = ls;
    }

    public QCloud2File(NonConformityStatus conformity, String conformityError, String ls) {
        this.conformity = conformity;
        this.conformityError = conformityError;
        this.ls = ls;
    }

    public QCloud2File(Long id, String checksum, Date creation_date, String filename, NonConformityStatus conformity,
            String conformityError, String ls) {
        super(id, checksum, creation_date, filename);
        this.conformity = conformity;
        this.conformityError = conformityError;
        this.ls = ls;
    }


}