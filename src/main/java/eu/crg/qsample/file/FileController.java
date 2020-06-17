package eu.crg.qsample.file;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import eu.crg.qsample.wetlab.WetLabFile;
import eu.crg.qsample.wetlab.WetLabService;

@RestController
@RequestMapping("/api/file")
public class FileController {

    @Autowired
    FileService fileService;

    @Autowired
    WetLabService wetLabService;

    @GetMapping("/dummy")
    // @PreAuthorize("hasRole('ADMIN')")
    public File insertDummyFileData() {
        return fileService.insertDummyFileData();
    }

    @GetMapping("/wetLabFiles/{apiKey}")
    @PreAuthorize("hasRole('INTERNAL')")
    public List<WetLabFile> getWetLabFilesByApiKey(@PathVariable UUID apiKey) {
        return wetLabService.getWetLabFilesByApiKey(apiKey);
    }

    @PostMapping(value = "/insertFromPipeline/{wetLabApiKey}")
    @PreAuthorize("hasRole('INTERNAL')")
    public File addFileSpecial(@RequestBody WetLabFile file, @PathVariable UUID wetLabApiKey) {
        System.out.println(file.getChecksum());
        System.out.println(wetLabApiKey);
        return fileService.insertFile(file, wetLabApiKey);
    }

    @ExceptionHandler(DataRetrievalFailureException.class)
    void handleNonConnection(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.NOT_FOUND.value(), e.getMessage());
    }

    @ExceptionHandler(DataIntegrityViolationException.class)
    void handleBadRequests(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.CONFLICT.value(), e.getMessage());
    }

}