package eu.crg.qsample.file;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.Spring;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import org.junit.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import eu.crg.qsample.security.payload.requests.LoginRequest;
import eu.crg.qsample.security.payload.responses.JwtResponse;
import eu.crg.qsample.utils.UtilTest;


import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@AutoConfigureMockMvc
@ActiveProfiles("unittest")
public class FileIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;


    @Test
    public void insertFileFromPipeline() throws Exception {
        getAdminLoginToken();
        RequestFile rf = new RequestFile();
        rf.setChecksum("integrationTest1");
        rf.setFilename("integrationTest1");
        RequestBuilder rb = MockMvcRequestBuilders.post("/api/file/insertFromPipelineRequest/{requestCode}", "ZF434").content(objectMapper.writeValueAsString(rf)).header("Authorization", "Bearer " + getAdminLoginToken()).contentType("application/json");
        mockMvc.perform(rb).andExpect(status().isOk());
    }


    public String getAdminLoginToken() throws Exception{
        LoginRequest lr = new LoginRequest();
        lr.setUsername("admin@unittest.cat");
        lr.setPassword("unittest");
        RequestBuilder rb = MockMvcRequestBuilders.post("/api/auth/signin").content(objectMapper.writeValueAsString(lr))
        .contentType("application/json");
        String response = mockMvc.perform(rb).andReturn().getResponse().getContentAsString();
        Gson gson = new Gson();
        JwtResponse jsonResponse = gson.fromJson(response, JwtResponse.class);
        return jsonResponse.getAccessToken();
    }

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
