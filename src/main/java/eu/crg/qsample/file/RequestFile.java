package eu.crg.qsample.file;

import java.util.Date;

import javax.persistence.Entity;

@Entity
public class RequestFile extends File {

    private String requestCode;

    public String getRequestCode() {
        return requestCode;
    }

    public void setRequestCode(String requestCode) {
        this.requestCode = requestCode;
    }

    public RequestFile(Long id, String checksum, Date creation_date, String filename, String requestCode) {
        super(id, checksum, creation_date, filename);
        this.requestCode = requestCode;
    }

    public RequestFile(String requestCode) {
        this.requestCode = requestCode;
    }

    public RequestFile() {

    }


}