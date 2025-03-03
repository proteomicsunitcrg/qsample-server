package eu.crg.qsample.file;

import java.io.IOException;
import java.net.ConnectException;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.aspectj.apache.bcel.classfile.Unknown;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
        return fileService.insertFile(file, wetLabApiKey);
    }


    @GetMapping("/getByRequestCode/{requestCode}")
    @PreAuthorize("hasRole('INTERNAL')")
    public List<RequestFile> findAllByRequestCode(@PathVariable String requestCode, @RequestParam(defaultValue = "filename") String order) {
        return fileService.findAllByRequestCode(requestCode, order);
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

    @GetMapping(value = "/getRequestFileByChecksum/{checksum}")
    @PreAuthorize("hasRole('INTERNAL')")
    public RequestFile getRequestFileByChecksum(@PathVariable String checksum) {
        return fileService.getRequestFileByChecksum(checksum);
    }

    @GetMapping(value = "/getRequestFilesDashboard")
    @PreAuthorize("hasRole('INTERNAL')")
    public List<RequestFile> getRequestFileDashboard(@DateTimeFormat(iso = ISO.DATE_TIME) Date startDate, @DateTimeFormat(iso = ISO.DATE_TIME) Date endDate,
            String filename, String code) {
        return fileService.getRequestFileDashboard(startDate, endDate, filename, code);
    }

    @GetMapping(value = "/getWetlabFilesDashboard")
    @PreAuthorize("hasRole('INTERNAL')")
    public List<WetLabFile> getWetlabFileDashboard(@DateTimeFormat(iso = ISO.DATE_TIME) Date startDate, @DateTimeFormat(iso = ISO.DATE_TIME) Date endDate,
            String filename, Long wetlabId) {
        return fileService.getWetlabFileDashboard(startDate, endDate, filename, wetlabId);
    }

    @GetMapping(value = "/workflow")
    @PreAuthorize("hasRole('INTERNAL')")
    public String getNextflowWorkflow() {
        return fileService.getNextflowWorkflow();
    }

    @GetMapping(value = "/isWorkflowEnabled")
    @PreAuthorize("hasRole('INTERNAL')")
    public boolean isWorkflowEnabled() {
        return fileService.isWorkflowEnabled();
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
        response.sendError(HttpStatus.UNAUTHORIZED.value(), "QCloud2 API or Nextflow tower unauthorized");
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