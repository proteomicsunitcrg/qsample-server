package eu.crg.qsample.restservice_nextflow;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;

import eu.crg.qsample.file.QCloud2File;
import eu.crg.qsample.request.RequestResponse;
import eu.crg.qsample.security.agendo.AgendoAuthResponse;

@Service
public class RestServiceNextflow{


    @Value("${nextflow-tower.url}")
    private String url;

    @Value("${nextflow-tower.token}")
    private String token;


    private final RestTemplate restTemplate;


    // List<HttpMessageConverter<?>> messageConverters = new ArrayList<HttpMessageConverter<?>>();

    // Add the Jackson Message converter
    // MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();


    public RestServiceNextflow(final RestTemplateBuilder restTemplateBuilder) {
        this.restTemplate = restTemplateBuilder.build();
    }

    public String getWorkflows() {
        try {
            final HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + token);
            final HttpEntity entity = new HttpEntity(headers);
            final ResponseEntity<String> response = restTemplate.exchange(url + "workflow", HttpMethod.GET, entity, String.class);
            return response.getBody();

        } catch (HttpStatusCodeException e) {
            return "error";  // TODO improve this handling
        }
    }

    public String mountBasicAuth(String user, String password) {
        return Base64.getEncoder().encodeToString((user + ":" + password).getBytes());
    }
}