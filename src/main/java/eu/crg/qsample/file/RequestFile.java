package eu.crg.qsample.file;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonFormat;

import eu.crg.qsample.file.fileinfo.FileInfo;
import eu.crg.qsample.modification.ModificationFile;

@Entity
public class RequestFile extends File implements Comparable<RequestFile>{

    private String requestCode;

    @Column(name = "request_code", length = 50)
    public String getRequestCode() {
        return requestCode;
    }

    @OneToMany(mappedBy = "file")
    private Set<ModificationFile> modificationRelation = new HashSet<ModificationFile>();

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    private FileInfo fileInfo;

    public FileInfo getFileInfo() {
        return fileInfo;
    }

    public RequestFile(String requestCode, Set<ModificationFile> modification, FileInfo fileInfo) {
        this.requestCode = requestCode;
        this.modificationRelation = modification;
        this.fileInfo = fileInfo;
    }

    public RequestFile(Long id, String checksum, Date creation_date, String filename, String requestCode,
            Set<ModificationFile> modification, FileInfo fileInfo) {
        super(id, checksum, creation_date, filename);
        this.requestCode = requestCode;
        this.modificationRelation = modification;
        this.fileInfo = fileInfo;
    }

    public void setFileInfo(FileInfo fileInfo) {
        this.fileInfo = fileInfo;
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

    public RequestFile(String requestCode, Set<ModificationFile> modification) {
        this.requestCode = requestCode;
        this.modificationRelation = modification;
    }

    public RequestFile(Long id, String checksum, Date creation_date, String filename, String requestCode,
            Set<ModificationFile> modification) {
        super(id, checksum, creation_date, filename);
        this.requestCode = requestCode;
        this.modificationRelation = modification;
    }

    public Set<ModificationFile> getModificationRelation() {
        return modificationRelation;
    }

    public void setModification(Set<ModificationFile> modification) {
        this.modificationRelation = modification;
    }

    @Override
    public int compareTo(RequestFile o) {
        return (int)(this.getId() - o.getId());
    }


}