package eu.crg.qsample.file;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Tracks every RequestFile the Atlas pipeline sees through its
 * received -> processing -> processed/error lifecycle, reported live via
 * /api/requestFileStatus. Complements {@link FileService}, which only ever
 * sees files once their QC metrics have actually been inserted.
 */
@Service
public class RequestFileStatusService {

    @Autowired
    private RequestFileStatusRepository requestFileStatusRepository;

    /**
     * Called by the Atlas pipeline (report_qsample_*.nf) as soon as it picks up
     * a matched raw file and launches processing for it. Idempotent: a retried
     * call for a checksum already past this point is returned unchanged.
     */
    public RequestFileStatus markReceived(String checksum) {
        RequestFileStatus rfs = requestFileStatusRepository.findByChecksum(checksum).orElseGet(() -> {
            RequestFileStatus fresh = new RequestFileStatus();
            fresh.setChecksum(checksum);
            return fresh;
        });
        if (rfs.getReceivedDate() != null) {
            return rfs;
        }
        Date now = new Date();
        rfs.setStatus(ProcessingStatus.PROCESSING);
        rfs.setReceivedDate(now);
        rfs.setUpdatedDate(now);
        return requestFileStatusRepository.save(rfs);
    }

    /**
     * Called by the pipeline itself right as it starts actually running this
     * file (not at receive time) - lets the UI show pure compute duration,
     * excluding any Slurm queue wait. Idempotent - only ever set once.
     */
    public RequestFileStatus markProcessingStarted(String checksum) {
        RequestFileStatus rfs = requestFileStatusRepository.findByChecksum(checksum).orElseGet(() -> {
            RequestFileStatus fresh = new RequestFileStatus();
            fresh.setChecksum(checksum);
            fresh.setStatus(ProcessingStatus.PROCESSING);
            fresh.setReceivedDate(new Date());
            return fresh;
        });
        if (rfs.getProcessingStartedDate() == null) {
            rfs.setProcessingStartedDate(new Date());
        }
        return requestFileStatusRepository.save(rfs);
    }

    /**
     * Called at the same point the pipeline inserts the file's final,
     * successful QC data. Creates the tracking row if a "received" call never
     * happened, so PROCESSED files are never silently absent from the UI.
     */
    public RequestFileStatus markProcessed(String checksum) {
        RequestFileStatus rfs = requestFileStatusRepository.findByChecksum(checksum).orElseGet(() -> {
            RequestFileStatus fresh = new RequestFileStatus();
            fresh.setChecksum(checksum);
            fresh.setReceivedDate(new Date());
            return fresh;
        });
        rfs.setStatus(ProcessingStatus.PROCESSED);
        rfs.setUpdatedDate(new Date());
        return requestFileStatusRepository.save(rfs);
    }

    /**
     * Called both by the pipeline's own onError hook (immediate, minimal info)
     * and later by atlas_checker.sh once it has classified the failure with
     * the same rawrr/database diagnostics it already builds for its Slack
     * alert. updatedDate is only stamped on the FIRST transition into ERROR,
     * so a later re-classification enriches the diagnostic fields without
     * inflating the duration shown in the UI.
     */
    public RequestFileStatus markError(RequestFileStatus errorInfo) {
        RequestFileStatus rfs = requestFileStatusRepository.findByChecksum(errorInfo.getChecksum()).orElseGet(() -> {
            RequestFileStatus fresh = new RequestFileStatus();
            fresh.setChecksum(errorInfo.getChecksum());
            fresh.setReceivedDate(new Date());
            return fresh;
        });
        boolean firstTimeError = rfs.getStatus() != ProcessingStatus.ERROR;
        rfs.setStatus(ProcessingStatus.ERROR);
        rfs.setDatabaseName(errorInfo.getDatabaseName());
        rfs.setDatabaseStatus(errorInfo.getDatabaseStatus());
        rfs.setSizeMb(errorInfo.getSizeMb());
        rfs.setRawSummary(errorInfo.getRawSummary());
        rfs.setProcessName(errorInfo.getProcessName());
        rfs.setErrorReason(errorInfo.getErrorReason());
        if (firstTimeError) {
            rfs.setUpdatedDate(new Date());
        }
        return requestFileStatusRepository.save(rfs);
    }

    public Optional<RequestFileStatus> getByChecksum(String checksum) {
        return requestFileStatusRepository.findByChecksum(checksum);
    }

    /** Bulk lookup keyed by checksum, for enriching a request's file list in one query. */
    public Map<String, RequestFileStatus> getByChecksums(List<String> checksums) {
        return requestFileStatusRepository.findByChecksumIn(checksums).stream()
                .collect(Collectors.toMap(RequestFileStatus::getChecksum, Function.identity()));
    }

}
