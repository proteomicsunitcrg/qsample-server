package eu.crg.qsample.wetlab;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotBlank;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/wetlab")
public class WetLabController {

    @Autowired
    WetLabService wetLabService;

    @GetMapping("/getAllWetlabsType")
    @PreAuthorize("hasRole('INTERNAL')")
    public List<WetLab> getAllWetlabs() {
        return wetLabService.getAllWetLabs();
    }

    @GetMapping("/{apiKey}")
    @PreAuthorize("hasRole('INTERNAL')")
    public WetLab getByApiKey(@PathVariable UUID apiKey) {
        System.out.println(apiKey);
        System.out.println("me cago en todo");
        return wetLabService.getByApiKey(apiKey);
    }

    @ExceptionHandler(DataRetrievalFailureException.class)
	void handleNotFound(HttpServletResponse response, Exception e) throws IOException {
		response.sendError(HttpStatus.NOT_FOUND.value(), e.getMessage());
	}

}