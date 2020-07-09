package eu.crg.qsample.file;

import java.util.Date;

import eu.crg.qsample.data.NonConformityStatus;

public class QCloud2File extends File {

    private NonConformityStatus conformity;

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


}