package eu.crg.qsample.restservice_neon;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.List;

import com.google.gson.JsonObject;

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
public class RestServiceNeon {


    @Value("${neon-stats.url}")
    private String url;

    private final RestTemplate restTemplate;


    // List<HttpMessageConverter<?>> messageConverters = new ArrayList<HttpMessageConverter<?>>();

    // Add the Jackson Message converter
    // MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();


    public RestServiceNeon(final RestTemplateBuilder restTemplateBuilder) {
        this.restTemplate = restTemplateBuilder.build();
    }

    public byte[] getFiles(DendogramBody dendogramBody) {
        JsonObject json = new JsonObject();
        json.addProperty("labels", dendogramBody.getLabels().toString());
        json.addProperty("values", dendogramBody.getValues().toString());
        json.addProperty("theme", dendogramBody.getTheme());
        HttpEntity entity = new HttpEntity(json);
        byte[] responseEntity = restTemplate.postForObject(url + "dendogram", dendogramBody, byte[].class);
        return responseEntity;
    }

    public String mountBasicAuth(String user, String password) {
        return Base64.getEncoder().encodeToString((user + ":" + password).getBytes());
    }
}