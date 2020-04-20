package eu.crg.qsample.testendpoint;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/test")
public class TestEndpointController {
    @GetMapping("/all")
	public String allAccess() {
		return "Public Content.";
	}
	
	@GetMapping("/user")
	@PreAuthorize("hasRole('INTERNAL') or hasRole('MANAGER') or hasRole('ADMIN')")
	public String userAccess() {
		return "INTERNAL CONTENT ALL.";
	}

	@GetMapping("/mod")
	@PreAuthorize("hasRole('MANAGER')")
	public String moderatorAccess() {
		return "MANAGER CONTENT.";
	}

	@GetMapping("/admin")
	@PreAuthorize("hasRole('ADMIN')")
	public String adminAccess() {
		return "Admin CONTENT.";
    }
    
    @GetMapping("/external")
	@PreAuthorize("hasRole('EXTERNAL')")
	public String externalAccess() {
		return "EXTERNAL CONTENT.";
	}
}