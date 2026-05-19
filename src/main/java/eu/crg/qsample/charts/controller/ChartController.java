package eu.crg.qsample.charts.controller;

import eu.crg.qsample.charts.dto.ChartConfigDTO;
import eu.crg.qsample.charts.dto.ChartDataPointDTO;
import eu.crg.qsample.charts.dto.ChartDefinitionDTO;
import eu.crg.qsample.charts.entity.ChartDefinition;
import eu.crg.qsample.charts.entity.ChartParameter;
import eu.crg.qsample.charts.repository.ChartDataRepository;
import eu.crg.qsample.charts.repository.ChartDefinitionRepository;
import eu.crg.qsample.charts.repository.ChartPageAssignmentRepository;
import org.springframework.web.bind.annotation.*;
import eu.crg.qsample.request.local.RequestLocal;
import eu.crg.qsample.request.local.RequestRepository;
import eu.crg.qsample.qgenerator.application.ApplicationConstraint;
import eu.crg.qsample.qgenerator.application.Application;
import eu.crg.qsample.qgenerator.application.ApplicationRepository;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/charts")
public class ChartController {

    private final ChartDefinitionRepository chartDefinitionRepository;
    private final ChartPageAssignmentRepository chartPageAssignmentRepository;
    private final ChartDataRepository chartDataRepository;
    private final RequestRepository requestRepository;
    private final ApplicationRepository applicationRepository;

    public ChartController(
            ChartDefinitionRepository chartDefinitionRepository,
            ChartPageAssignmentRepository chartPageAssignmentRepository,
            ChartDataRepository chartDataRepository,
            RequestRepository requestRepository,
            ApplicationRepository applicationRepository
    ) {
        this.chartDefinitionRepository = chartDefinitionRepository;
        this.chartPageAssignmentRepository = chartPageAssignmentRepository;
        this.chartDataRepository = chartDataRepository;
        this.requestRepository = requestRepository;
        this.applicationRepository = applicationRepository;
    }

    @GetMapping
    public List<ChartDefinitionDTO> getCharts() {
        return chartDefinitionRepository.findByActiveTrue()
                .stream()
                .map(this::toDefinitionDTO)
                .collect(Collectors.toList());
    }
    
    @GetMapping("/page/{pageName}")
    public List<ChartConfigDTO> getChartsByPage(@PathVariable String pageName) {
        return chartPageAssignmentRepository
                .findByPageNameAndVisibleTrueOrderByDisplayOrderAsc(pageName)
                .stream()
                .map(assignment -> assignment.getChart())
                .filter(chart -> Boolean.TRUE.equals(chart.getActive()))
                .map(this::toConfigDTO)
                .collect(Collectors.toList());
    }

    @GetMapping("/page/{pageName}/request/{requestCode}")
    public List<ChartConfigDTO> getChartsByPageAndRequest(
        @PathVariable String pageName,
        @PathVariable String requestCode) {

        RequestLocal request = requestRepository
                .findByRequestCode(requestCode)
                .orElse(null);

        if (request == null ||
            request.getApplication() == null ||
            request.getApplication().getApplicationConstraint() == null) {

            return getChartsByPage(pageName);
        }

        ApplicationConstraint constraint =
                request.getApplication().getApplicationConstraint();

        return chartPageAssignmentRepository
                .findByPageNameAndVisibleTrueOrderByDisplayOrderAsc(pageName)
                .stream()
                .map(assignment -> assignment.getChart())
                .filter(chart -> Boolean.TRUE.equals(chart.getActive()))
                .filter(chart -> isChartEnabled(chart, constraint))
                .map(this::toConfigDTO)
                .collect(Collectors.toList());
    }

    @GetMapping("/page/{pageName}/application/{applicationId}")
    public List<ChartConfigDTO> getChartsByPageAndApplication(
            @PathVariable String pageName,
            @PathVariable Long applicationId) {

        Application application = applicationRepository
                .findById(applicationId)
                .orElse(null);

        if (application == null ||
            application.getApplicationConstraint() == null) {

            return getChartsByPage(pageName);
        }

        ApplicationConstraint constraint =
                application.getApplicationConstraint();

        return chartPageAssignmentRepository
                .findByPageNameAndVisibleTrueOrderByDisplayOrderAsc(pageName)
                .stream()
                .map(assignment -> assignment.getChart())
                .filter(chart -> Boolean.TRUE.equals(chart.getActive()))
                .filter(chart -> isChartEnabled(chart, constraint))
                .map(this::toConfigDTO)
                .collect(Collectors.toList());
    }

    @GetMapping("/data/{dataSourceKey}/request/{requestCode}")
public List<ChartDataPointDTO> getChartDataByRequest(
        @PathVariable String dataSourceKey,
        @PathVariable String requestCode) {

    ChartDefinition chart = chartDefinitionRepository
            .findByDataSourceKey(dataSourceKey)
            .orElseThrow();

    List<ChartDataRepository.ChartDataPointProjection> points;

    if ("context_source_group".equals(chart.getProviderType())) {

        points = chartDataRepository
                .findChartDataByContextSourceGroup(
                        dataSourceKey,
                        requestCode
                );

    } else {

        points = chartDataRepository
                .findChartDataByPlotApiKeyAndRequestCode(
                        dataSourceKey,
                        requestCode
                );
    }

    return points.stream()
            .map(point -> new ChartDataPointDTO(
                    point.getLabel(),
                    point.getValue()
            ))
            .collect(Collectors.toList());
}

private boolean isChartEnabled(
        ChartDefinition chart,
        ApplicationConstraint constraint) {

    String flag = chart.getConstraintFlag();

    if (flag == null || flag.isEmpty()) {
        return true;
    }

    switch (flag) {

        case "show_identified_proteins_plot":
            return constraint.isShowIdentifiedProteinsPlot();

        case "show_identified_peptides_plot":
            return constraint.isShowIdentifiedPeptidesPlot();

        case "show_modifications_plot":
            return constraint.isShowModificationsPlot();

        case "show_file_info_plot":
            return constraint.isShowFileInfoPlot();

        case "show_charges_plot":
            return constraint.isShowChargesPlot();

        default:
            return true;
    }
}
  
    private ChartDefinitionDTO toDefinitionDTO(ChartDefinition chart) {
        return new ChartDefinitionDTO(
                chart.getId(),
                chart.getName(),
                chart.getTitle(),
                chart.getDescription(),
                chart.getChartType(),
                chart.getLibrary(),
                chart.getDataSourceKey(),
                chart.getActive()
        );
    }

    private ChartConfigDTO toConfigDTO(ChartDefinition chart) {
        return new ChartConfigDTO(
                chart.getId(),
                chart.getName(),
                chart.getTitle(),
                chart.getDescription(),
                chart.getChartType(),
                chart.getLibrary(),
                chart.getDataSourceKey(),
                chart.getActive(),
                buildParametersMap(chart)
        );
    }

    private Map<String, Object> buildParametersMap(ChartDefinition chart) {
        if (chart.getParameters() == null) {
            return Collections.emptyMap();
        }

        return chart.getParameters()
                .stream()
                .collect(Collectors.toMap(
                        ChartParameter::getParamKey,
                        this::convertParameterValue
                ));
    }

    private Object convertParameterValue(ChartParameter parameter) {
        String value = parameter.getParamValue();
        String type = parameter.getParamType();

        if (value == null) {
            return null;
        }

        if ("number".equalsIgnoreCase(type)) {
            try {
                return Double.valueOf(value);
            } catch (NumberFormatException e) {
                return value;
            }
        }

        if ("boolean".equalsIgnoreCase(type)) {
            return Boolean.valueOf(value);
        }

        return value;
    }
}
