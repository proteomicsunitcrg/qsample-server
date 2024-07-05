package eu.crg.qsample.restservice_qcloud2;

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
import org.springframework.web.client.RestTemplate;

import eu.crg.qsample.file.QCloud2File;
import eu.crg.qsample.request.RequestResponse;
import eu.crg.qsample.security.agendo.AgendoAuthResponse;

@Service
public class RestServiceQCloud2 {


    @Value("${qcloud2.url}")
    private String url;

    @Value("${qcloud2.username}")
    private String username;

    @Value("${qcloud2.password}")
    private String password;

    private final RestTemplate restTemplate;


    // List<HttpMessageConverter<?>> messageConverters = new ArrayList<HttpMessageConverter<?>>();

    // Add the Jackson Message converter
    // MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();


    public RestServiceQCloud2(final RestTemplateBuilder restTemplateBuilder) {
        this.restTemplate = restTemplateBuilder.build();
    }

    public List<QCloud2File> getFiles(String requestCode) {
        // System.out.println(url + "?requestCode=" + requestCode);
        final HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Basic " + mountBasicAuth(username, password));
        final HttpEntity entity = new HttpEntity(headers);
        ResponseEntity<List<QCloud2File>> res= restTemplate.exchange(url + "?requestCode=" + requestCode, HttpMethod.GET, entity, new ParameterizedTypeReference<List<QCloud2File>>() {});
        return res.getBody();
    }

    public String mountBasicAuth(String user, String password) {
        return Base64.getEncoder().encodeToString((user + ":" + password).getBytes());
    }
}
