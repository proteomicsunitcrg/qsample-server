package eu.crg.qsample.file;

import java.io.IOException;
import java.net.ConnectException;
import java.net.UnknownHostException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.aspectj.apache.bcel.classfile.Unknown;
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
import org.springframework.web.client.HttpClientErrorException;

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

    @GetMapping("/qcloud2/{requestCode}")
    @PreAuthorize("hasRole('INTERNAL')")
    public List<QCloud2File> getQCloud2Files(@PathVariable String requestCode) {
        return fileService.getQCloud2Files(requestCode);
    }

    @PostMapping(value = "/insertFromPipeline/{wetLabApiKey}")
    @PreAuthorize("hasRole('INTERNAL')")
    public File addFileSpecial(@RequestBody WetLabFile file, @PathVariable UUID wetLabApiKey) {
        System.out.println(file.getChecksum());
        System.out.println(wetLabApiKey);
        return fileService.insertFile(file, wetLabApiKey);
    }


    @GetMapping("/getByRequestCode/{requestCode}")
    @PreAuthorize("hasRole('INTERNAL')")
    public List<RequestFile> getAllByRequestCodeContains(@PathVariable String requestCode) {
        return fileService.getAllByRequestCodeContains(requestCode);
    }

    /**
     * Endpoint 4 pipeline (ONLY REQUESTS FILES)
     * @param file
     * @param requestCode
     * @return
     */
    @PostMapping(value = "/insertFromPipelineRequest/{requestCode}")
    @PreAuthorize("hasRole('INTERNAL')")
    public File addFileRequest(@RequestBody RequestFile file, @PathVariable String requestCode) {
        file.setRequestCode(requestCode);
        return fileService.insertFileRequest(file);
    }

    /**
     * Checks if the file exist in wetlab file and request file
     * Returns true if the file DOESNT exist and false otherwise
     * @param checksum to check
     * @return
     */
    @GetMapping(value = "/checkFileExists/{checksum}")
    @PreAuthorize("hasRole('INTERNAL')")
    public boolean checkFileExists(@PathVariable String checksum) {
        return fileService.checkFileExists(checksum);
    }

    @ExceptionHandler(DataRetrievalFailureException.class)
    void handleNonConnection(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.NOT_FOUND.value(), e.getMessage());
    }

    @ExceptionHandler(DataIntegrityViolationException.class)
    void handleBadRequests(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.CONFLICT.value(), e.getMessage());
    }

    @ExceptionHandler(ConnectException.class)
    void handleConnectException(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.SERVICE_UNAVAILABLE.value(), "QCloud2 API unrecheable");
    }

    @ExceptionHandler(HttpClientErrorException.NotFound.class)
    void handleNotFoundException(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.NOT_FOUND.value(), "Unknown QCloud2 API endpoint");
    }

    @ExceptionHandler(HttpClientErrorException.Unauthorized.class)
    void handleUnauthorizedException(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.UNAUTHORIZED.value(), "QCloud2 API unauthorized");
    }

    @ExceptionHandler(HttpClientErrorException.BadRequest.class)
    void handleBadRequestException(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.BAD_REQUEST.value(), "Bad request to QCloud2 API");
    }

    @ExceptionHandler(UnknownHostException.class)
    void handleUnknownHostException(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.BAD_REQUEST.value(), "Unknown host: " + e.getCause().getMessage());
    }


}