package eu.crg.qsample.request;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "api/request")
public class RequestController {

    @Autowired
    RequestService requestService;

    @PreAuthorize("hasRole('INTERNAL')")
    @RequestMapping(value = "")
    public List<MiniRequest> getAll() {
        // return "WORKS!";
        return requestService.getAll();
    }

    @PreAuthorize("hasRole('INTERNAL')")
    @RequestMapping(value = "{id}")
    public AgendoRequest getRequestById(@PathVariable Long id) {
        System.out.println("ID REQUEST AGENDO: " + id);
        return requestService.getRequestById(id);
    }

    @PreAuthorize("hasRole('INTERNAL')")
    @RequestMapping(value = "getPlotName/{csId}/{paramId}")
    public String getPlotName(@PathVariable Long csId, @PathVariable Long paramId) {
        return requestService.getPlotName(csId, paramId);
    }
}