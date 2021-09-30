package eu.crg.qsample.request;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import eu.crg.qsample.exceptions.NotFoundException;
import eu.crg.qsample.request.local.RequestLocal;

@RestController
@RequestMapping(value = "api/request")
public class RequestController {

    @Autowired
    RequestService requestService;

    @PreAuthorize("hasRole('INTERNAL')")
    @RequestMapping(value = "")
    public List<MiniRequest> getAll(@RequestParam boolean showAll,
            @RequestParam(name = "start_date") @DateTimeFormat(iso = ISO.DATE_TIME) Date startDate,
            @RequestParam(name = "end_date") @DateTimeFormat(iso = ISO.DATE_TIME) Date endDate) {
        return requestService.getAll(showAll, startDate, endDate);
    }

    @PreAuthorize("hasRole('EXTERNAL')")
    @RequestMapping(value = "external")
    public List<MiniRequest> getAllExternal() {
        return requestService.getAllExternal();
    }

    @PreAuthorize("hasRole('USER')")
    @RequestMapping(value = "{id}")
    public AgendoRequest getRequestById(@PathVariable Long id) {
        return requestService.getRequestById(id);
    }

    @PreAuthorize("hasRole('USER')")
    @RequestMapping(value = "getLocalById/{id}")
    public RequestLocal getLocalRequestById(@PathVariable Long id) {
        return requestService.getLocalRequestById(id);
    }

    @PreAuthorize("hasRole('MANAGER')")
    @PostMapping(value = "saveLocal")
    public RequestLocal saveLocal(@RequestBody RequestLocal localRequest) {
        return requestService.saveLocal(localRequest);
    }

    @PreAuthorize("hasRole('MANAGER')")
    @DeleteMapping(value = "deleteLocal/{id}")
    public boolean deleteLocal(@PathVariable(name = "id") Long localRequestId) {
        return requestService.deleteLocal(localRequestId);
    }

    @PreAuthorize("hasRole('USER')")
    @RequestMapping(value = "getPlotName/{csId}/{paramId}")
    public String getPlotName(@PathVariable Long csId, @PathVariable Long paramId) {
        return requestService.getPlotName(csId, paramId);
    }

    @PreAuthorize("hasRole('INTERNAL')")
    @RequestMapping(value = "isQCloud2FilesEnabled")
    public boolean isQCloud2FilesEnabled() {
        return requestService.isQCloud2FilesEnabled();
    }

    @ExceptionHandler(NotFoundException.class)
    void handleNotFoundException(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.NOT_FOUND.value(), "Nothing found with this parameters");
    }
}