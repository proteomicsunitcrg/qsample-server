package eu.crg.qsample.config;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/config")
public class ConfigController {

	@Value("${local-requests}")
	boolean localRequests;
	
	@Value("${qcloud2.disable}")
	boolean qcloud2Disabled;

	@Value("${nextflow-tower.disable}")
	boolean nextflowTowerDisabled;

	//@PreAuthorize("hasRole('INTERNAL')")
	@RequestMapping(value = "")

	public Map<String, Object> getConfig() {

		Map<String, Object> response = new HashMap<>();
		response.put("local-requests", localRequests);
		response.put("qcloud2.disable", qcloud2Disabled);
		response.put("nexflow-tower.disable", nextflowTowerDisabled);
		return response;

	}

}
