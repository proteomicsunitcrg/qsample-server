package eu.crg.qsample.file;

import java.util.Date;
import java.util.List;

import eu.crg.qsample.data.NonConformityStatus;

public class QCloud2File extends File {

    private NonConformityStatus conformity;

    private List<String> conformityError;

    private String ls;

    private String lsApiKey;

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

    public QCloud2File(NonConformityStatus conformity, List<String> conformityError) {
        this.conformity = conformity;
        this.conformityError = conformityError;
    }

    public QCloud2File(Long id, String checksum, Date creation_date, String filename, NonConformityStatus conformity,
            List<String> conformityError) {
        super(id, checksum, creation_date, filename);
        this.conformity = conformity;
        this.conformityError = conformityError;
    }

    public List<String> getConformityError() {
        return conformityError;
    }

    public void setConformityError(List<String> conformityError) {
        this.conformityError = conformityError;
    }

    public String getLs() {
        return ls;
    }

    public void setLs(String ls) {
        this.ls = ls;
    }

    public QCloud2File(NonConformityStatus conformity, List<String> conformityError, String ls) {
        this.conformity = conformity;
        this.conformityError = conformityError;
        this.ls = ls;
    }

    public QCloud2File(Long id, String checksum, Date creation_date, String filename, NonConformityStatus conformity,
    List<String> conformityError, String ls) {
        super(id, checksum, creation_date, filename);
        this.conformity = conformity;
        this.conformityError = conformityError;
        this.ls = ls;
    }

    public String getLsApiKey() {
        return lsApiKey;
    }

    public void setLsApiKey(String lsApiKey) {
        this.lsApiKey = lsApiKey;
    }

    public QCloud2File(NonConformityStatus conformity, List<String> conformityError, String ls, String lsApiKey) {
        this.conformity = conformity;
        this.conformityError = conformityError;
        this.ls = ls;
        this.lsApiKey = lsApiKey;
    }

    public QCloud2File(Long id, String checksum, Date creation_date, String filename, NonConformityStatus conformity,
    List<String> conformityError, String ls, String lsApiKey) {
        super(id, checksum, creation_date, filename);
        this.conformity = conformity;
        this.conformityError = conformityError;
        this.ls = ls;
        this.lsApiKey = lsApiKey;
    }


}