package eu.crg.qsample.data;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpClientErrorException;

import eu.crg.qsample.data.model.DataFromPipeline;
import eu.crg.qsample.exceptions.NotFoundException;

@RestController
@RequestMapping("/api/data")
public class DataController {

    @Autowired
    DataService dataService;

    @GetMapping("/traces/{startDate}/{endDate}/{plotId}/{wetLabApiKey}")
    @PreAuthorize("hasRole('INTERNAL')")
    public List<PlotTrace> getTrace(@PathVariable @DateTimeFormat(iso = ISO.DATE_TIME) java.util.Date startDate,
            @PathVariable @DateTimeFormat(iso = ISO.DATE_TIME) java.util.Date endDate, @PathVariable Long plotId,
            @PathVariable UUID wetLabApiKey) {
        return dataService.getTraceData(startDate, endDate, plotId, wetLabApiKey);
    }

    @GetMapping("/tracesRequest/{csId}/{paramId}/{requestCode}")
    @PreAuthorize("hasRole('USER')")
    public List<PlotTrace> getTraceRequest(@PathVariable Long csId, @PathVariable Long paramId, @PathVariable String requestCode, @RequestParam(defaultValue = "filename") String order) {
        return dataService.getTraceDataRequest(csId, paramId, requestCode, order);
    }

    @RequestMapping(value = "/pipeline", method = RequestMethod.POST)
    @PreAuthorize("hasRole('ADMIN')")
    public void insertDataFromPipeline(@RequestBody DataFromPipeline dataFromPipeline) {
        dataService.insertDataFromPipeline(dataFromPipeline);
    }

    /**
     * Method to insert data only from requests(NOT WETLAB DATA)
     */
    @RequestMapping(value = "/pipelineRequest", method = RequestMethod.POST)
    @PreAuthorize("hasRole('ADMIN')")
    public void insertDataFromPipelineRequest(@RequestBody DataFromPipeline dataFromPipeline) {
        dataService.insertDataFromPipelineRequest(dataFromPipeline);
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
