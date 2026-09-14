package eu.crg.qsample.file;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

/**
 * Tracks every RequestFile the Atlas pipeline sees (received/processing/processed/error),
 * unlike {@link FileController} which only ever surfaces files once their QC data has
 * actually been inserted. Write endpoints are consumed by report_qsample_*.nf (received,
 * processingStarted, processed) and atlas_checker.sh (error) - all authenticate the same
 * way as every other pipeline-facing endpoint here (hasRole('INTERNAL')). Read endpoints
 * are consumed by qsample-client to render the processing icon in the "Request plots" panel.
 */
@RestController
@RequestMapping("/api/requestFileStatus")
public class RequestFileStatusController {

    @Autowired
    RequestFileStatusService requestFileStatusService;

    @Autowired
    FileService fileService;

    @PostMapping("/received/{checksum}")
    @PreAuthorize("hasRole('INTERNAL')")
    public RequestFileStatus markReceived(@PathVariable String checksum) {
        return requestFileStatusService.markReceived(checksum);
    }

    @PostMapping("/processingStarted/{checksum}")
    @PreAuthorize("hasRole('INTERNAL')")
    public RequestFileStatus markProcessingStarted(@PathVariable String checksum) {
        return requestFileStatusService.markProcessingStarted(checksum);
    }

    @PostMapping("/processed/{checksum}")
    @PreAuthorize("hasRole('INTERNAL')")
    public RequestFileStatus markProcessed(@PathVariable String checksum) {
        return requestFileStatusService.markProcessed(checksum);
    }

    @PostMapping("/error/{checksum}")
    @PreAuthorize("hasRole('INTERNAL')")
    public RequestFileStatus markError(@RequestBody RequestFileStatus errorInfo, @PathVariable String checksum) {
        errorInfo.setChecksum(checksum);
        return requestFileStatusService.markError(errorInfo);
    }

    @GetMapping("/checksum/{checksum}")
    @PreAuthorize("hasRole('INTERNAL')")
    public RequestFileStatus getByChecksum(@PathVariable String checksum) {
        return requestFileStatusService.getByChecksum(checksum)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND,
                        "No processing status tracked yet for checksum " + checksum));
    }

    @GetMapping("/byRequestCode/{requestCode}")
    @PreAuthorize("hasRole('INTERNAL')")
    public Map<String, RequestFileStatus> getByRequestCode(@PathVariable String requestCode) {
        List<RequestFile> files = fileService.findAllByRequestCode(requestCode, "filename");
        if (files == null || files.isEmpty()) {
            return Collections.emptyMap();
        }
        List<String> checksums = files.stream().map(RequestFile::getChecksum).collect(Collectors.toList());
        return requestFileStatusService.getByChecksums(checksums);
    }

}
