package eu.crg.qsample.file;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * Tracks the received/processing/processed/error lifecycle of a RequestFile
 * as reported live by the Atlas pipeline - unlike {@link RequestFile}, which
 * only gets a row once a file has been fully registered. One row per
 * checksum, updated in place as its status changes. Joined to `file` only by
 * checksum at the application layer (no FK), see qsample-server#192.
 */
@Entity
@Table(name = "request_file_status")
public class RequestFileStatus {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "request_file_status_seq")
    @SequenceGenerator(name = "request_file_status_seq", sequenceName = "request_file_status_seq", allocationSize = 1)
    private Long id;

    @Column(name = "checksum", length = 50, unique = true, nullable = false)
    private String checksum;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private ProcessingStatus status;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "received_date", columnDefinition = "DATETIME")
    private Date receivedDate;

    // Set once, by the pipeline itself right as it starts actually running
    // this file (not at receive time) - lets the UI show pure compute
    // duration, excluding any Slurm queue wait beforehand.
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "processing_started_date", columnDefinition = "DATETIME")
    private Date processingStartedDate;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "updated_date", columnDefinition = "DATETIME")
    private Date updatedDate;

    @Column(name = "database_name")
    private String databaseName;

    @Column(name = "database_status")
    private String databaseStatus;

    @Column(name = "size_mb")
    private Double sizeMb;

    @Lob
    @Column(name = "raw_summary")
    private String rawSummary;

    @Column(name = "process_name")
    private String processName;

    @Lob
    @Column(name = "error_reason")
    private String errorReason;

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

    public ProcessingStatus getStatus() {
        return status;
    }

    public void setStatus(ProcessingStatus status) {
        this.status = status;
    }

    public Date getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(Date receivedDate) {
        this.receivedDate = receivedDate;
    }

    public Date getProcessingStartedDate() {
        return processingStartedDate;
    }

    public void setProcessingStartedDate(Date processingStartedDate) {
        this.processingStartedDate = processingStartedDate;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getDatabaseName() {
        return databaseName;
    }

    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName;
    }

    public String getDatabaseStatus() {
        return databaseStatus;
    }

    public void setDatabaseStatus(String databaseStatus) {
        this.databaseStatus = databaseStatus;
    }

    public Double getSizeMb() {
        return sizeMb;
    }

    public void setSizeMb(Double sizeMb) {
        this.sizeMb = sizeMb;
    }

    public String getRawSummary() {
        return rawSummary;
    }

    public void setRawSummary(String rawSummary) {
        this.rawSummary = rawSummary;
    }

    public String getProcessName() {
        return processName;
    }

    public void setProcessName(String processName) {
        this.processName = processName;
    }

    public String getErrorReason() {
        return errorReason;
    }

    public void setErrorReason(String errorReason) {
        this.errorReason = errorReason;
    }

}
