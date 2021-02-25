package eu.crg.qsample.quantification;

import java.io.IOException;

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
import eu.crg.qsample.quantification.model.QuantificationFromPipeline;

@RestController
@RequestMapping("/api/quantification")
public class QuantificationController {

    @Autowired
    QuantificationService quantificationService;

    @PostMapping(value="/pipeline")
    @PreAuthorize("hasRole('ADMIN')")
    public boolean insertQuantificationFromPipeline(@RequestBody QuantificationFromPipeline quantPipeline) {
        System.out.println(quantPipeline.getFile().getChecksum());
        System.out.println(quantPipeline.getQuant().get(0).getAccession());
        quantificationService.insertQuantificationFromPipeline(quantPipeline);
        return true;
    }



    @ExceptionHandler(NotFoundException.class)
    void handleNotFoundException(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.NOT_FOUND.value(), "Nothing found with this parameters");
    }

    @ExceptionHandler(DataRetrievalFailureException.class)
    void handleRetrievalFailure(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.NOT_FOUND.value(), "Nothing found with this file checksum");
    }


}
