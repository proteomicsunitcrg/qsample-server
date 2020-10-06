package eu.crg.qsample.auth;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import eu.crg.qsample.security.payload.requests.LoginRequest;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@AutoConfigureMockMvc
@ActiveProfiles("unittest")
public class AuthIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @Test
    public void loginTest() throws Exception {
        LoginRequest lr = new LoginRequest();
        lr.setUsername("admin@unittest.cat");
        lr.setPassword("unittest");
        RequestBuilder rb = MockMvcRequestBuilders.post("/api/auth/signin").content(objectMapper.writeValueAsString(lr))
                .contentType("application/json");
        mockMvc.perform(rb).andExpect(status().isOk());
    }

    @Test
    public void loginTestUnauthorized() throws Exception {
        LoginRequest lr = new LoginRequest();
        lr.setUsername("admin@unittest.cat");
        lr.setPassword("unittestGAGAGAGA");
        RequestBuilder rb = MockMvcRequestBuilders.post("/api/auth/signin").content(objectMapper.writeValueAsString(lr))
                .contentType("application/json");
        mockMvc.perform(rb).andExpect(status().isUnauthorized());
    }
}
