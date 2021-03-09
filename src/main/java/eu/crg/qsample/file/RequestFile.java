package eu.crg.qsample.file;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class RequestFile extends File implements Comparable<RequestFile>{

    private String requestCode;

    @Column(name = "request_code", length = 50)
    public String getRequestCode() {
        return requestCode;
    }

    public void setRequestCode(final String requestCode) {
        this.requestCode = requestCode;
    }

    public RequestFile(final Long id, final String checksum, final Date creation_date, final String filename, final String requestCode) {
        super(id, checksum, creation_date, filename);
        this.requestCode = requestCode;
    }

    public RequestFile(final String requestCode) {
        this.requestCode = requestCode;
    }

    public RequestFile() {

    }

    @Override
    public int compareTo(RequestFile o) {
        return (int)(this.getId() - o.getId());
    }


}