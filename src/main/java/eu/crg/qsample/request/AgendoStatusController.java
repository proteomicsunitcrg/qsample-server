package eu.crg.qsample.request;

import eu.crg.qsample.restservice.RestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.Map;

@RestController
public class AgendoStatusController {

    @Autowired
    RestService restService;

    @PreAuthorize("hasRole('INTERNAL')")
    @GetMapping("/api/agendo/status")
    public Map<String, Boolean> getAgendoStatus() {
        return Collections.singletonMap("online", restService.isAgendoOnline());
    }
}