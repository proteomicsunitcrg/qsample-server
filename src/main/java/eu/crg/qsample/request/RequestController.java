package eu.crg.qsample.request;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
}