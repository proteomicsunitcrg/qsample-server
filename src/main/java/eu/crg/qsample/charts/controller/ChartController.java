package eu.crg.qsample.charts.controller;

import eu.crg.qsample.charts.dto.ApplicationChartConfigDTO;
import eu.crg.qsample.charts.dto.ApplicationChartConfigSaveDTO;
import eu.crg.qsample.charts.dto.ChartConfigDTO;
import eu.crg.qsample.charts.dto.ChartDataPointDTO;
import eu.crg.qsample.charts.dto.ChartDefinitionDTO;
import eu.crg.qsample.charts.dto.ChartSeriesDataPointDTO;
import eu.crg.qsample.charts.entity.ApplicationChartConfig;
import eu.crg.qsample.charts.entity.ChartDefinition;
import eu.crg.qsample.charts.entity.ChartParameter;
import eu.crg.qsample.charts.repository.ApplicationChartConfigRepository;
import eu.crg.qsample.charts.repository.ChartDataRepository;
import eu.crg.qsample.charts.repository.ChartDefinitionRepository;
import eu.crg.qsample.charts.repository.ChartPageAssignmentRepository;
import eu.crg.qsample.qgenerator.application.Application;
import eu.crg.qsample.qgenerator.application.ApplicationConstraint;
import eu.crg.qsample.qgenerator.application.ApplicationRepository;
import eu.crg.qsample.request.local.RequestLocal;
import eu.crg.qsample.request.local.RequestRepository;
import org.springframework.web.bind.annotation.*;

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
    private final ApplicationChartConfigRepository applicationChartConfigRepository;

    public ChartController(
            ChartDefinitionRepository chartDefinitionRepository,
            ChartPageAssignmentRepository chartPageAssignmentRepository,
            ChartDataRepository chartDataRepository,
            RequestRepository requestRepository,
            ApplicationRepository applicationRepository,
            ApplicationChartConfigRepository applicationChartConfigRepository
    ) {
        this.chartDefinitionRepository = chartDefinitionRepository;
        this.chartPageAssignmentRepository = chartPageAssignmentRepository;
        this.chartDataRepository = chartDataRepository;
        this.requestRepository = requestRepository;
        this.applicationRepository = applicationRepository;
        this.applicationChartConfigRepository = applicationChartConfigRepository;
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

        if (request == null || request.getApplication() == null) {
            return getChartsByPage(pageName);
        }

        return getConfiguredChartsForApplication(
                pageName,
                request.getApplication().getId(),
                request.getApplication().getApplicationConstraint()
        );
    }

    @GetMapping("/page/{pageName}/application/{applicationId}")
    public List<ChartConfigDTO> getChartsByPageAndApplication(
            @PathVariable String pageName,
            @PathVariable Long applicationId) {

        Application application = applicationRepository
                .findById(applicationId)
                .orElse(null);

        if (application == null) {
            return getChartsByPage(pageName);
        }

        return getConfiguredChartsForApplication(
                pageName,
                applicationId,
                application.getApplicationConstraint()
        );
    }

    @GetMapping("/application-config/{applicationId}")
    public List<ApplicationChartConfigDTO> getApplicationChartConfig(
            @PathVariable Long applicationId) {

        return applicationChartConfigRepository
                .findByApplicationIdOrderByOrderIndexAsc(applicationId)
                .stream()
                .map(this::toApplicationChartConfigDTO)
                .collect(Collectors.toList());
    }

    @PostMapping("/application-config/{applicationId}/initialize")
    public List<ApplicationChartConfigDTO> initializeApplicationChartConfig(
            @PathVariable Long applicationId) {

        Application application = applicationRepository
                .findById(applicationId)
                .orElseThrow();

        List<ApplicationChartConfig> existingConfigs =
                applicationChartConfigRepository
                        .findByApplicationIdOrderByOrderIndexAsc(applicationId);

        if (!existingConfigs.isEmpty()) {
            return existingConfigs
                    .stream()
                    .map(this::toApplicationChartConfigDTO)
                    .collect(Collectors.toList());
        }

        List<ChartDefinition> activeCharts =
                chartDefinitionRepository.findByActiveTrue();

        List<ApplicationChartConfig> newConfigs =
                new java.util.ArrayList<>();

        for (int i = 0; i < activeCharts.size(); i++) {
            ChartDefinition chart = activeCharts.get(i);

            ApplicationChartConfig config = new ApplicationChartConfig();
            config.setApplication(application);
            config.setChart(chart);
            config.setEnabled(true);
            config.setOrderIndex(i + 1);

            newConfigs.add(config);
        }

        return applicationChartConfigRepository
                .saveAll(newConfigs)
                .stream()
                .map(this::toApplicationChartConfigDTO)
                .collect(Collectors.toList());
    }

    @PostMapping("/application-config/{applicationId}")
    public List<ApplicationChartConfigDTO> saveApplicationChartConfig(
            @PathVariable Long applicationId,
            @RequestBody List<ApplicationChartConfigSaveDTO> configDTOs) {

        Application application = applicationRepository
                .findById(applicationId)
                .orElseThrow();

        List<ApplicationChartConfig> existingConfigs =
                applicationChartConfigRepository
                        .findByApplicationIdOrderByOrderIndexAsc(applicationId);

        Map<Long, ApplicationChartConfig> existingByChartId =
                existingConfigs
                        .stream()
                        .collect(Collectors.toMap(
                                config -> config.getChart().getId(),
                                config -> config
                        ));

        List<ApplicationChartConfig> configsToSave =
                new java.util.ArrayList<>();

        for (ApplicationChartConfigSaveDTO dto : configDTOs) {
            ChartDefinition chart = chartDefinitionRepository
                    .findById(dto.getChartId())
                    .orElseThrow();

            ApplicationChartConfig config =
                    existingByChartId.get(dto.getChartId());

            if (config == null) {
                config = new ApplicationChartConfig();
                config.setApplication(application);
                config.setChart(chart);
            }

            config.setEnabled(Boolean.TRUE.equals(dto.getEnabled()));
            config.setOrderIndex(dto.getOrderIndex());

            configsToSave.add(config);
        }

        return applicationChartConfigRepository
                .saveAll(configsToSave)
                .stream()
                .sorted(java.util.Comparator.comparing(ApplicationChartConfig::getOrderIndex))
                .map(this::toApplicationChartConfigDTO)
                .collect(Collectors.toList());
    }

    @GetMapping("/data/{dataSourceKey}/request/{requestCode}")
    public List<ChartDataPointDTO> getChartDataByRequest(
            @PathVariable String dataSourceKey,
            @PathVariable String requestCode,
            @RequestParam(defaultValue = "filename") String order) {

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

        } else if ("context_source_group_by_file".equals(chart.getProviderType())) {

            points = chartDataRepository
                    .findChartDataByContextSourceGroupByFile(
                            dataSourceKey,
                            requestCode,
                            order
                    );

        } else {

            points = chartDataRepository
                    .findChartDataByPlotApiKeyAndRequestCode(
                            dataSourceKey,
                            requestCode,
                            order
                    );
        }

        return points.stream()
                .map(point -> new ChartDataPointDTO(
                        point.getLabel(),
                        point.getValue(),
                        point.getChecksum(),
                        point.getCreationDate()
                ))
                .collect(Collectors.toList());
    }

    @GetMapping("/stacked-data/{dataSourceKey}/request/{requestCode}")
    public List<ChartSeriesDataPointDTO> getStackedChartDataByRequest(
            @PathVariable String dataSourceKey,
            @PathVariable String requestCode,
            @RequestParam(defaultValue = "date") String order) {

        return chartDataRepository
                .findStackedChartDataByContextSourceGroup(
                        dataSourceKey,
                        requestCode,
                        order
                )
                .stream()
                .map(point -> new ChartSeriesDataPointDTO(
                        point.getLabel(),
                        point.getSeries(),
                        point.getValue(),
                        point.getChecksum(),
                        point.getCreationDate()
                ))
                .collect(Collectors.toList());
    }

    private List<ChartConfigDTO> getConfiguredChartsForApplication(
            String pageName,
            Long applicationId,
            ApplicationConstraint constraint) {

        List<ApplicationChartConfig> configs =
                applicationChartConfigRepository
                        .findByApplicationIdAndEnabledTrueOrderByOrderIndexAsc(applicationId);

        if (configs == null || configs.isEmpty()) {
            return getLegacyChartsByPageAndConstraint(pageName, constraint);
        }

        List<Long> pageChartIds =
                chartPageAssignmentRepository
                        .findByPageNameAndVisibleTrueOrderByDisplayOrderAsc(pageName)
                        .stream()
                        .map(assignment -> assignment.getChart().getId())
                        .collect(Collectors.toList());

        return configs
                .stream()
                .map(ApplicationChartConfig::getChart)
                .filter(chart -> Boolean.TRUE.equals(chart.getActive()))
                .filter(chart -> pageChartIds.contains(chart.getId()))
                .map(this::toConfigDTO)
                .collect(Collectors.toList());
    }

    private List<ChartConfigDTO> getLegacyChartsByPageAndConstraint(
            String pageName,
            ApplicationConstraint constraint) {

        if (constraint == null) {
            return getChartsByPage(pageName);
        }

        return chartPageAssignmentRepository
                .findByPageNameAndVisibleTrueOrderByDisplayOrderAsc(pageName)
                .stream()
                .map(assignment -> assignment.getChart())
                .filter(chart -> Boolean.TRUE.equals(chart.getActive()))
                .filter(chart -> isChartEnabled(chart, constraint))
                .map(this::toConfigDTO)
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

    private ApplicationChartConfigDTO toApplicationChartConfigDTO(
            ApplicationChartConfig config) {

        ChartDefinition chart = config.getChart();

        return new ApplicationChartConfigDTO(
                config.getId(),
                config.getApplication().getId(),
                chart.getId(),
                chart.getName(),
                chart.getTitle(),
                chart.getChartType(),
                chart.getDataSourceKey(),
                config.getEnabled(),
                config.getOrderIndex()
        );
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