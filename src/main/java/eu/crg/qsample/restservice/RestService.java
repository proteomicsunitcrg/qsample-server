package eu.crg.qsample.restservice;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.Date;
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
import org.springframework.web.client.RestTemplate;

import eu.crg.qsample.request.AgendoRequest;
import eu.crg.qsample.request.AgendoRequestWrapper;
import eu.crg.qsample.request.RequestResponse;
import eu.crg.qsample.security.agendo.AgendoAuthResponse;

@Service
public class RestService {

    @Value("${agendo.url}")
    private String url;

    @Value("${agendo.username}")
    private String agendoUser;

    @Value("${agendo.password}")
    private String agendoPass;

    @Value("${agendo.from}")
    private String agendoFrom;

    @Value("${agendo.facility}")
    private String facility;

    private final RestTemplate restTemplate;

    List<HttpMessageConverter<?>> messageConverters = new ArrayList<HttpMessageConverter<?>>();
    // Add the Jackson Message converter
    MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();

    String encodedAuth = Base64.getEncoder().encodeToString((agendoUser + ":" + agendoPass).getBytes());

    public RestService(final RestTemplateBuilder restTemplateBuilder) {
        this.restTemplate = restTemplateBuilder.build();
    }

    public String getAllRequests(String dateFrom, String dateTo) {
        // converter.setSupportedMediaTypes(Collections.singletonList(MediaType.ALL));
        // messageConverters.add(converter);
        // restTemplate.setMessageConverters(messageConverters);
        final HttpHeaders headers = new HttpHeaders();
        headers.set("From", agendoFrom);
        headers.set("Authorization", "Basic " + mountBasicAuth(agendoUser, agendoPass));

        final HttpEntity entity = new HttpEntity(headers);
        final ResponseEntity<String> response = restTemplate
                .exchange(url + "/requests/facility/"+facility+"/"+dateFrom+"/"+dateTo, HttpMethod.GET, entity, String.class);
        // System.out.println(response.getBody());
        // System.out.println(url + "/requests/facility/"+facility+"/"+dateFrom+"/"+dateTo);
        return response.getBody();
    }


    public String getAllRequestsExternal(Long userId) {
        // converter.setSupportedMediaTypes(Collections.singletonList(MediaType.ALL));
        // messageConverters.add(converter);
        // restTemplate.setMessageConverters(messageConverters);
        final HttpHeaders headers = new HttpHeaders();
        headers.set("From", agendoFrom);
        headers.set("Authorization", "Basic " + mountBasicAuth(agendoUser, agendoPass));

        final HttpEntity entity = new HttpEntity(headers);
        final ResponseEntity<String> response = restTemplate
                .exchange(url + "/requests/user/"+userId+"/2020-05-01/2021-06-30", HttpMethod.GET, entity, String.class);
        // System.out.println(response.getBody());
        return response.getBody();
    }

    public ResponseEntity<AgendoAuthResponse> loginAgendo(String username, String password) {
        // converter.setSupportedMediaTypes(Collections.singletonList(MediaType.ALL));
        // messageConverters.add(converter);
        // restTemplate.setMessageConverters(messageConverters);
        final HttpHeaders headers = new HttpHeaders();
        headers.set("From", "Y3Jn");
        headers.set("Authorization", "Basic " + mountBasicAuth(agendoUser, agendoPass));
        final HttpEntity entity = new HttpEntity(headers);
        // System.out.println("https://api.qcloud2.crg.eu/mirrorLogin?username={username}&password={password}");
        final ResponseEntity<AgendoAuthResponse> response = restTemplate.exchange("https://api.qcloud2.crg.eu/mirrorLogin?username={username}&password={password}", HttpMethod.GET, entity,
                AgendoAuthResponse.class, username, password);
        // System.out.println(response.getBody().getUser().getEmail());
        return response;
    }

    public String mountBasicAuth(String user, String password) {
        return Base64.getEncoder().encodeToString((user + ":" + password).getBytes());
    }

    public String getRequestById(Long id) {
        // converter.setSupportedMediaTypes(Collections.singletonList(MediaType.ALL));
        // messageConverters.add(converter);
        // restTemplate.setMessageConverters(messageConverters);
        final HttpHeaders headers = new HttpHeaders();
        headers.set("From", agendoFrom);
        headers.set("Authorization", "Basic " + mountBasicAuth(agendoUser, agendoPass));

        final HttpEntity entity = new HttpEntity(headers);
        final ResponseEntity<String> response = restTemplate
                .exchange(url + "/requests/" + id, HttpMethod.GET, entity, String.class);
        // System.out.println(response.getBody());
        return response.getBody();
    }
}
