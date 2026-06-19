package eu.crg.qsample.charts;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.Arrays;
import java.util.UUID;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.web.servlet.request.RequestPostProcessor;
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors;

import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.context_source.ContextSourceRepository;
import eu.crg.qsample.data.model.DataFromPipeline;
import eu.crg.qsample.data.model.DataValues;
import eu.crg.qsample.data.model.ParameterData;
import eu.crg.qsample.file.RequestFile;
import eu.crg.qsample.file.RequestFileRepository;
import eu.crg.qsample.param.Param;
import eu.crg.qsample.param.ParamRepository;

@ExtendWith(SpringExtension.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@AutoConfigureMockMvc
@ActiveProfiles("unittest")
public class SequenceCoverageIntegrationTest {

    private static final String PARAM_NAME = "Total Numbers";
    private static final String CONTEXT_NAME = "Sequence coverage proof";
    private static final String REQUEST_CODE = "2026E2E001";
    private static final String REQUEST_CHECKSUM = "2026e2e001-checksum";
    private static final String REQUEST_FILENAME = "2026E2E001_sample.raw";
    private static final String CONTEXT_API_KEY = "c71c7a88-1f06-4b2b-9c2a-5d4d6adf1102";

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private ParamRepository paramRepository;

    @Autowired
    private ContextSourceRepository contextSourceRepository;

    @Autowired
    private RequestFileRepository requestFileRepository;

    private Param totalNumbersParam;
    private ContextSource sequenceCoverageContext;
    private RequestFile requestFile;

    @BeforeEach
    public void setUp() throws Exception {
        cleanupArtifacts();

        totalNumbersParam = findOrCreateTotalNumbersParam();
        sequenceCoverageContext = findOrCreateContextSource();
        requestFile = createRequestFileViaApi();
        createPipelineDataViaApi(totalNumbersParam, sequenceCoverageContext, requestFile);
    }

    @AfterEach
    public void tearDown() {
        cleanupArtifacts();
    }

    @Test
    public void sequenceCoveragePipelineIngestionViaApiInsertsRequestData() throws Exception {
        RequestBuilder dataRequest = get(
            "/api/data/tracesRequest/{paramId}/{requestCode}",
            totalNumbersParam.getId(),
            REQUEST_CODE)
            .param("csIds", String.valueOf(sequenceCoverageContext.getId()))
            .param("order", "filename")
            .with(adminUser());

        String dataResponse = mockMvc.perform(dataRequest)
                .andExpect(status().isOk())
                .andReturn()
                .getResponse()
                .getContentAsString();

        JsonNode traces = objectMapper.readTree(dataResponse);
        assertEquals(1, traces.size());
        assertEquals(CONTEXT_NAME, traces.get(0).get("abbreviated").asText());
        JsonNode points = traces.get(0).get("plotTracePoints");
        assertEquals(1, points.size());
        assertEquals(REQUEST_FILENAME, points.get(0).get("file").get("filename").asText());
        assertEquals(83.5d, points.get(0).get("value").asDouble(), 0.0001d);

        Integer rows = jdbcTemplate.queryForObject(
            "SELECT COUNT(*) FROM data d JOIN file f ON d.file_id = f.id WHERE f.checksum = ? AND f.request_code = ?",
            Integer.class,
            REQUEST_CHECKSUM,
            REQUEST_CODE
        );
        assertEquals(1, rows.intValue());
    }

    private Param findOrCreateTotalNumbersParam() {
        return paramRepository.findAll()
                .stream()
                .filter(param -> PARAM_NAME.equals(param.getName()))
                .findFirst()
                .orElseGet(() -> {
                    Param param = new Param();
                    param.setName(PARAM_NAME);
                    param.setApiKey(UUID.fromString("c71c7a88-1f06-4b2b-9c2a-5d4d6adf1100"));
                    return paramRepository.save(param);
                });
    }

    private ContextSource findOrCreateContextSource() {
        return contextSourceRepository.findOneByApiKey(UUID.fromString(CONTEXT_API_KEY))
                .orElseGet(() -> {
                    ContextSource contextSource = new ContextSource();
                    contextSource.setAbbreviated(CONTEXT_NAME);
                    contextSource.setName(CONTEXT_NAME);
                    contextSource.setApiKey(UUID.fromString(CONTEXT_API_KEY));
                    return contextSourceRepository.save(contextSource);
                });
    }

    private RequestFile createRequestFileViaApi() throws Exception {
        RequestFile file = new RequestFile();
        file.setChecksum(REQUEST_CHECKSUM);
        file.setFilename(REQUEST_FILENAME);

        RequestBuilder request = post("/api/file/insertFromPipelineRequest/{requestCode}", REQUEST_CODE)
                .content(objectMapper.writeValueAsString(file))
                .contentType(MediaType.APPLICATION_JSON)
                .with(internalUser());

        mockMvc.perform(request)
                .andExpect(status().isOk());

        return requestFileRepository.findOneByChecksum(REQUEST_CHECKSUM)
                .orElseThrow(IllegalStateException::new);
    }

    private void createPipelineDataViaApi(Param param, ContextSource contextSource, RequestFile file) throws Exception {
        DataValues dataValues = new DataValues(contextSource.getId(), 83.5f, 83.5f, 0f);
        ParameterData parameterData = new ParameterData(param.getId(), Arrays.asList(dataValues));
        DataFromPipeline payload = new DataFromPipeline(file.getChecksum(), Arrays.asList(parameterData));

        RequestBuilder request = post("/api/data/pipelineRequest")
                .content(objectMapper.writeValueAsString(payload))
                .contentType(MediaType.APPLICATION_JSON)
                .with(adminUser());

        mockMvc.perform(request)
                .andExpect(status().isOk());
    }

    private void cleanupArtifacts() {
        cleanupAllSequenceCoverageCharts();
        cleanupAllSequenceCoveragePlots();
        cleanupAllSequenceCoverageApplications();
        cleanupTestData();
    }

    private void cleanupAllSequenceCoverageCharts() {
        // Get all chart IDs that match sequence_coverage pattern
        String getChartIds = "SELECT id FROM chart_definitions WHERE name LIKE 'sequence_coverage%'";
        
        // Delete from dependent tables first
        jdbcTemplate.update("DELETE FROM chart_page_assignments WHERE chart_id IN (" + getChartIds + ")");
        jdbcTemplate.update("DELETE FROM application_chart_configs WHERE chart_id IN (" + getChartIds + ")");
        
        // Finally delete the charts themselves
        jdbcTemplate.update("DELETE FROM chart_definitions WHERE name LIKE 'sequence_coverage%'");
    }

    private void cleanupAllSequenceCoveragePlots() {
        // Get all plot IDs that match the sequence coverage pattern (starts with c71c7a88-1f06-4b2b-9c2a-5d4d6adf110)
        String getPlotIds = "SELECT id FROM plot WHERE api_key LIKE 'c71c7a88-1f06-4b2b-9c2a-5d4d6adf110%'";
        
        // Delete plot context source mappings first
        jdbcTemplate.update("DELETE FROM plot_context_source WHERE plot_id IN (" + getPlotIds + ")");
        
        // Then delete the plots themselves
        jdbcTemplate.update("DELETE FROM plot WHERE api_key LIKE 'c71c7a88-1f06-4b2b-9c2a-5d4d6adf110%'");
    }

    private void cleanupAllSequenceCoverageApplications() {
        // Delete all applications named "Sequence coverage%"
        jdbcTemplate.update("DELETE FROM application WHERE name LIKE 'Sequence coverage%'");
    }

    private void cleanupTestData() {
        // Clean test data from current test execution
        jdbcTemplate.update("DELETE FROM data WHERE file_id IN (SELECT id FROM file WHERE request_code = ?)", REQUEST_CODE);
        jdbcTemplate.update("DELETE FROM file WHERE checksum = ?", REQUEST_CHECKSUM);
        jdbcTemplate.update("DELETE FROM context_source WHERE api_key = ?", CONTEXT_API_KEY);
    }

    private RequestPostProcessor adminUser() {
        return SecurityMockMvcRequestPostProcessors.user("integration-admin")
                .roles("ADMIN", "INTERNAL", "USER");
    }

    private RequestPostProcessor internalUser() {
        return SecurityMockMvcRequestPostProcessors.user("integration-internal")
                .roles("INTERNAL");
    }
}
