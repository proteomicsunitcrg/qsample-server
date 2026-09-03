package eu.crg.qsample.request;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.requestTo;
import static org.springframework.test.web.client.response.MockRestResponseCreators.withSuccess;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.test.web.client.MockRestServiceServer;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.server.ResponseStatusException;

import eu.crg.qsample.restservice.RestService;

/**
 * Reproduces #169: Agendo can answer HTTP 200 with a body that has no usable
 * "request" array (e.g. {"success":false,"count":0}), which used to make
 * AgendoRequestWrapper.getRequest() return null and blow up with an NPE on
 * iteration. Stands in for #161's "dummy Agendo endpoint" by intercepting the
 * RestTemplate instead of standing up a real server.
 *
 * Also guards the follow-up finding: silently returning an empty list for a
 * broken Agendo response made the UI show "Agendo online" / "no requests
 * found" instead of a real error, so a success:false response must now
 * surface as a distinguishable error rather than an empty result.
 */
@ExtendWith(SpringExtension.class)
@SpringBootTest
@ActiveProfiles("unittest")
@TestPropertySource(properties = "local-requests=false")
public class AgendoMalformedResponseUnitTest {

    @Autowired
    RequestService requestService;

    @Autowired
    RestService restService;

    private MockRestServiceServer mockServer() {
        RestTemplate restTemplate = (RestTemplate) ReflectionTestUtils.getField(restService, "restTemplate");
        return MockRestServiceServer.createServer(restTemplate);
    }

    private Date date(String yyyyMmDd) {
        return assertDoesNotThrow(() -> new SimpleDateFormat("yyyy-MM-dd").parse(yyyyMmDd));
    }

    @Test
    public void getAllSurfacesAnErrorWhenAgendoRespondsUnsuccessful() {
        mockServer()
                .expect(requestTo(containsString("/requests/facility/")))
                .andExpect(method(HttpMethod.GET))
                .andRespond(withSuccess("{\"success\":false,\"count\":0}", MediaType.APPLICATION_JSON));

        ResponseStatusException ex = assertThrows(ResponseStatusException.class,
                () -> requestService.getAll(true, date("2026-01-01"), date("2026-01-31")));

        assertEquals(HttpStatus.SERVICE_UNAVAILABLE, ex.getStatus());
        // (each test uses a distinct date range: RestService.getAllRequests caches by
        // "facility:dateFrom:dateTo", and a shared range would let one test's mocked
        // response leak into the other via that cache instead of hitting the mock server)
    }

    @Test
    public void getAllReturnsEmptyListWhenAgendoGenuinelyHasNoRequests() {
        mockServer()
                .expect(requestTo(containsString("/requests/facility/")))
                .andExpect(method(HttpMethod.GET))
                .andRespond(withSuccess("{\"success\":true,\"count\":0,\"request\":[]}", MediaType.APPLICATION_JSON));

        List<MiniRequest> result = assertDoesNotThrow(
                () -> requestService.getAll(true, date("2026-02-01"), date("2026-02-28")));

        assertTrue(result.isEmpty());
    }

    @Test
    public void getRequestByIdSurfacesAnErrorWhenAgendoRespondsUnsuccessful() {
        mockServer()
                .expect(requestTo(containsString("/requests/42")))
                .andExpect(method(HttpMethod.GET))
                .andRespond(withSuccess("{\"success\":false}", MediaType.APPLICATION_JSON));

        ResponseStatusException ex = assertThrows(ResponseStatusException.class,
                () -> requestService.getRequestById(42L));

        assertEquals(HttpStatus.SERVICE_UNAVAILABLE, ex.getStatus());
    }
}
