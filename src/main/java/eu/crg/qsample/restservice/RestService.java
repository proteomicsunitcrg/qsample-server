package eu.crg.qsample.restservice;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.List;

import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import eu.crg.qsample.request.RequestResponse;
import eu.crg.qsample.security.agendo.AgendoAuthResponse;

@Service
public class RestService {

    // TODO: Add this config to a config file

    private final String url = "https://api.agendo.science/";

    private final String agendoUser = "marc.serret@crg.eu";

    private final String agendoPass = "*Garu23Pucca69*";

    private final RestTemplate restTemplate;


    List<HttpMessageConverter<?>> messageConverters = new ArrayList<HttpMessageConverter<?>>();
        // Add the Jackson Message converter
    MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();

    String encodedAuth = Base64.getEncoder().encodeToString((agendoUser + ":" + agendoPass).getBytes());

    public RestService(final RestTemplateBuilder restTemplateBuilder) {
        this.restTemplate = restTemplateBuilder.build();
    }

    public ResponseEntity<String> getAllRequests() {

        final HttpHeaders headers = new HttpHeaders();
        headers.set("From", "marc.serret@crg.eu");
        headers.set("Authorization", "Bearer " + "OXQ2OGxzT1ZFdTNLOGdGblAxbEY5NDI6MjAyMC0wNS0xMSAyMjoyMzowMg==");

        final HttpEntity entity = new HttpEntity(headers);
        final ResponseEntity<String> response = restTemplate.exchange(url + "/requests/class/22/2018-01-01/2020-06-30",
                HttpMethod.GET, entity, String.class);
        return response;
    }

    public ResponseEntity<AgendoAuthResponse> loginAgendo(String user, String password) {
        converter.setSupportedMediaTypes(Collections.singletonList(MediaType.ALL));
        messageConverters.add(converter);
        restTemplate.setMessageConverters(messageConverters);
        final HttpHeaders headers = new HttpHeaders();
        headers.set("From", "Y3Jn");
        headers.set("Authorization", "Basic " + mountBasicAuth(user, password));
        final HttpEntity entity = new HttpEntity(headers);
        final ResponseEntity<AgendoAuthResponse> response = restTemplate.exchange(url + "/auth", HttpMethod.GET, entity,
                AgendoAuthResponse.class);
        System.out.println(response.getBody().getUser().getEmail());
        return response;
    }

    public String mountBasicAuth(String user, String password) {
        return Base64.getEncoder().encodeToString((user + ":" + password).getBytes());
    }
}