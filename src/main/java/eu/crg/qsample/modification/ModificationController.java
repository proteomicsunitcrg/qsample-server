package eu.crg.qsample.modification;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import eu.crg.qsample.exceptions.NotFoundException;
import eu.crg.qsample.file.FileService;

@RestController
@RequestMapping("/api/modification")
public class ModificationController {

    @Autowired
    FileService fileService;

    @Autowired
    ModificationService modificationService;

    @PostMapping("/pipeline")
    @PreAuthorize("hasRole('ADMIN')")
    public void insertModificationsFromPipeline(@RequestBody ModificationFromPipeline dataFromPipeline) {
        modificationService.insertModificationsFromPipeline(dataFromPipeline);
    }


    @ExceptionHandler(NotFoundException.class)
    void handleNotFoundException(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.NOT_FOUND.value(), "Nothing found with this parameters");
    }

    @ExceptionHandler(DataRetrievalFailureException.class)
    void handleDataRetrievalFailureException(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.NOT_FOUND.value(), "File not found");
    }

}
