package eu.crg.qsample.quantification;

import java.io.IOException;
import java.net.ConnectException;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.math3.linear.EigenDecomposition;
import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.bind.annotation.RequestParam;

import eu.crg.qsample.exceptions.ConsensusException;
import eu.crg.qsample.exceptions.NotFoundException;
import eu.crg.qsample.file.RequestFile;
import eu.crg.qsample.quantification.model.QuantificationFromPipeline;

@RestController
@RequestMapping("/api/quantification")
public class QuantificationController {

    @Autowired
    QuantificationService quantificationService;

    @PostMapping(value="/pipeline")
    @PreAuthorize("hasRole('ADMIN')")
    public boolean insertQuantificationFromPipeline(@RequestBody QuantificationFromPipeline quantPipeline) {
        quantificationService.insertQuantificationFromPipeline(quantPipeline);
        return true;
    }

    @GetMapping(value = "/getByChecksum/{checksum}")
    @PreAuthorize("hasRole('INTERNAL')")
    public List<Quantification> getByChechsumAndContaminant(@PathVariable String checksum, @RequestParam boolean contaminant) {
        return quantificationService.getByChechsumAndContaminant(checksum, contaminant);
    }

    // @GetMapping(value = "/heatMap/{requestcode}")
    // @PreAuthorize("hasRole('INTERNAL')")
    // public List<List<Double>> heatMapTest(@PathVariable(name = "requestcode") String requestCode, @RequestParam(name = "checksums[]") List <String> checksums) {
    //     return quantificationService.heatmap(requestCode, checksums);
    // }

    @GetMapping(value = "/heatMap/{requestcode}")
    @PreAuthorize("hasRole('INTERNAL')")
    public HeatmapData heatMap(@PathVariable(name = "requestcode") String requestCode, @RequestParam(name = "checksums[]") List <String> checksums, @RequestParam int consensus, @RequestParam String order) {
        return quantificationService.heatmap2(requestCode, checksums, consensus, order);
    }

    @GetMapping(value = "/PCA/{requestcode}")
    @PreAuthorize("hasRole('INTERNAL')")
    public List<List<Double>> getPCA(@PathVariable(name = "requestcode") String requestCode, @RequestParam(name = "checksums[]") List <String> checksums) {
        System.out.println(checksums.size());
        return quantificationService.pca(requestCode, checksums);
    }

    @GetMapping(value = "/dendogram/{requestcode}")
    @PreAuthorize("hasRole('INTERNAL')")
    public byte[] getDendogram(@PathVariable(name = "requestcode") String requestCode, @RequestParam(name = "checksums[]") List <String> checksums, @RequestParam String theme) {
        return quantificationService.dendogram(requestCode, checksums, theme);
    }




    @ExceptionHandler(NotFoundException.class)
    void handleNotFoundException(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.NOT_FOUND.value(), "Nothing found with this parameters");
    }

    @ExceptionHandler(DataRetrievalFailureException.class)
    void handleRetrievalFailure(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.NOT_FOUND.value(), "Nothing found with this file checksum");
    }


    @ExceptionHandler(ConsensusException.class)
    void handleConsensusException(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.NO_CONTENT.value(), "Consensus 1 or 0");
    }

    @ExceptionHandler(HttpServerErrorException.InternalServerError.class)
    void handleNeonServerErrorException(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.CONFLICT.value(), "Neon API error, contact the admins (Marc) to check the case");
    }

    @ExceptionHandler(ConnectException.class)
    void handleNeonServerConnectException(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.NOT_FOUND.value(), "Neon API endpoint down, contact the admins (Marc) to check the case");
    }



}
