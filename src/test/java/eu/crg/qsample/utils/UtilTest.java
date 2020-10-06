package eu.crg.qsample.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.stereotype.Service;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import eu.crg.qsample.security.payload.requests.LoginRequest;
import eu.crg.qsample.security.payload.responses.JwtResponse;

// @Service
@AutoConfigureMockMvc
public class UtilTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    public Date generateDate(String daterino) {
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date startDate = null;
    try {
            startDate = formatter.parse(daterino);
            return startDate;
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
            // TODO Auto-generated catch block
        }
    }



}
