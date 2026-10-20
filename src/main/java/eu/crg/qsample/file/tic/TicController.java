package eu.crg.qsample.file.tic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import eu.crg.qsample.exceptions.NotFoundException;

@RestController
public class TicController {

    @Autowired
    private TicService ticService;

    /**
     * Pipeline upload of the full TIC series for a file (Atlas submit step,
     * same "gz1:" payload QCloud2 receives). The file row must already exist:
     * the pipeline registers it before uploading the series.
     *
     * Errors are answered with explicit ResponseEntities (a sendError on the
     * error dispatch misbehaves as 405/406 on this app, same bug family as
     * the QCloud2 406 fixed in 931668d).
     */
    @PutMapping("/api/file/tic/{checksum}")
    @PreAuthorize("hasRole('INTERNAL')")
    public ResponseEntity<String> storeTic(@PathVariable String checksum, @RequestBody Tic tic) {
        try {
            ticService.storeTicByChecksum(checksum, tic.getTic());
        } catch (NotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        } catch (TicPayloadException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
        return ResponseEntity.ok("TIC series stored");
    }

    /**
     * The stored (decoded) TIC series of a file as raw text:
     * [[rt_ms, msLevel, tic], ...]. Missing files/TICs answer a plain 404
     * (the ResponseEntity keeps the error off the sendError dispatch, which
     * misbehaves on this produces=text/plain mapping).
     */
    @GetMapping(value = "/api/file/tic/{checksum}", produces = "text/plain;charset=UTF-8")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<String> getTicByChecksum(@PathVariable String checksum) {
        String tic = ticService.findTicByChecksum(checksum);
        if (tic == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("TIC: No TIC stored for file");
        }
        return ResponseEntity.ok(tic);
    }

    /**
     * All TIC series of a request's files (request QC view), downsampled
     * (min/max per bucket, at most 2*maxPoints points per curve) for overlay
     * rendering.
     */
    @GetMapping("/api/file/tic/request/{requestCode}")
    @PreAuthorize("hasRole('USER')")
    public List<TicSeries> getTicSeriesByRequest(
            @PathVariable String requestCode,
            @RequestParam(defaultValue = "filename") String order,
            @RequestParam(defaultValue = "1000") int maxPoints) {
        return ticService.getSeriesForRequest(requestCode, maxPoints);
    }
}
