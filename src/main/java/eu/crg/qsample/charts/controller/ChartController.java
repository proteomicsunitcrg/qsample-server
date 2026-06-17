package eu.crg.qsample.charts.controller;

import eu.crg.qsample.charts.dto.ApplicationChartConfigDTO;
import eu.crg.qsample.charts.dto.ApplicationChartConfigSaveDTO;
import eu.crg.qsample.charts.dto.ChartConfigDTO;
import eu.crg.qsample.charts.dto.ChartDataPointDTO;
import eu.crg.qsample.charts.dto.ChartDataSourceDTO;
import eu.crg.qsample.charts.dto.ChartDataSourceOptionsDTO;
import eu.crg.qsample.charts.dto.ChartDataSourceSaveDTO;
import eu.crg.qsample.charts.dto.ChartDefinitionDetailDTO;
import eu.crg.qsample.charts.dto.ChartDefinitionDTO;
import eu.crg.qsample.charts.dto.ChartDefinitionSaveDTO;
import eu.crg.qsample.charts.dto.ChartParameterDTO;
import eu.crg.qsample.charts.dto.ChartParameterSaveDTO;
import eu.crg.qsample.charts.dto.ChartSeriesDataPointDTO;
import eu.crg.qsample.charts.dto.WetlabPlotConfigDTO;
import eu.crg.qsample.charts.dto.WetlabPlotConfigSaveDTO;
import eu.crg.qsample.charts.entity.ApplicationChartConfig;
import eu.crg.qsample.charts.entity.ChartPageAssignment;
import eu.crg.qsample.charts.entity.ChartDefinition;
import eu.crg.qsample.charts.entity.ChartParameter;
import eu.crg.qsample.charts.entity.WetlabPlotConfig;
import eu.crg.qsample.charts.repository.ApplicationChartConfigRepository;
import eu.crg.qsample.charts.repository.ChartDataRepository;
import eu.crg.qsample.charts.repository.ChartDefinitionRepository;
import eu.crg.qsample.charts.repository.ChartPageAssignmentRepository;
import eu.crg.qsample.charts.repository.WetlabPlotConfigRepository;
import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.context_source.ContextSourceRepository;
import eu.crg.qsample.param.Param;
import eu.crg.qsample.param.ParamRepository;
import eu.crg.qsample.plot.Plot;
import eu.crg.qsample.plot.PlotRepository;
import eu.crg.qsample.qgenerator.application.Application;
import eu.crg.qsample.qgenerator.application.ApplicationConstraint;
import eu.crg.qsample.qgenerator.application.ApplicationRepository;
import eu.crg.qsample.request.local.RequestLocal;
import eu.crg.qsample.request.local.RequestRepository;
import eu.crg.qsample.wetlab.WetLab;
import eu.crg.qsample.wetlab.WetLabRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
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
    private final WetLabRepository wetLabRepository;
    private final PlotRepository plotRepository;
    private final ParamRepository paramRepository;
    private final ContextSourceRepository contextSourceRepository;
    private final WetlabPlotConfigRepository wetlabPlotConfigRepository;
        private final EntityManager entityManager;

    public ChartController(
            ChartDefinitionRepository chartDefinitionRepository,
            ChartPageAssignmentRepository chartPageAssignmentRepository,
            ChartDataRepository chartDataRepository,
            RequestRepository requestRepository,
            ApplicationRepository applicationRepository,
            ApplicationChartConfigRepository applicationChartConfigRepository,
            WetLabRepository wetLabRepository,
            PlotRepository plotRepository,
            ParamRepository paramRepository,
            ContextSourceRepository contextSourceRepository,
            WetlabPlotConfigRepository wetlabPlotConfigRepository,
            EntityManager entityManager
    ) {
        this.chartDefinitionRepository = chartDefinitionRepository;
        this.chartPageAssignmentRepository = chartPageAssignmentRepository;
        this.chartDataRepository = chartDataRepository;
        this.requestRepository = requestRepository;
        this.applicationRepository = applicationRepository;
        this.applicationChartConfigRepository = applicationChartConfigRepository;
        this.wetLabRepository = wetLabRepository;
        this.plotRepository = plotRepository;
        this.paramRepository = paramRepository;
        this.contextSourceRepository = contextSourceRepository;
        this.wetlabPlotConfigRepository = wetlabPlotConfigRepository;
                this.entityManager = entityManager;
    }

    @GetMapping
    public List<ChartDefinitionDTO> getCharts() {
        return chartDefinitionRepository.findByActiveTrue()
                .stream()
                .map(this::toDefinitionDTO)
                .collect(Collectors.toList());
    }

        @GetMapping("/{chartId}")
        public ChartDefinitionDetailDTO getChart(@PathVariable Long chartId) {
                ChartDefinition chart = chartDefinitionRepository
                                .findById(chartId)
                                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Chart not found"));

                return toDefinitionDetailDTO(chart);
        }

    @PostMapping
    @Transactional
    public ResponseEntity<ChartDefinitionDTO> createChart(
            @RequestBody ChartDefinitionSaveDTO chartDTO) {

        validateChartDefinition(chartDTO);

        chartDefinitionRepository.findByName(chartDTO.getName())
                .ifPresent(chart -> {
                    throw new ResponseStatusException(
                            HttpStatus.CONFLICT,
                            "Chart name already exists"
                    );
                });

        ChartDefinition chart = new ChartDefinition();
        chart.setName(chartDTO.getName().trim());
        chart.setTitle(chartDTO.getTitle().trim());
        chart.setDescription(trimToNull(chartDTO.getDescription()));
        chart.setChartType(chartDTO.getChartType().trim());
        chart.setLibrary(defaultIfBlank(chartDTO.getLibrary(), "plotly"));
        chart.setDataSourceKey(chartDTO.getDataSourceKey().trim());
        chart.setActive(chartDTO.getActive() == null || chartDTO.getActive());
        chart.setChartMode(resolveChartMode(chartDTO.getChartMode(), chart));
        chart.setProviderType(resolveProviderType(chartDTO.getProviderType(), chart.getChartMode(), chart));
        chart.setConstraintFlag(trimToNull(chartDTO.getConstraintFlag()));
        chart.setParameters(buildParameters(chartDTO.getParameters(), chart));

        ChartDefinition savedChart = chartDefinitionRepository.save(chart);
        createDefaultPageAssignment(savedChart, "request_details");

        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(toDefinitionDTO(savedChart));
    }

    @PutMapping("/{chartId}")
    public ChartDefinitionDetailDTO updateChart(
            @PathVariable Long chartId,
            @RequestBody ChartDefinitionSaveDTO chartDTO) {

        validateChartDefinition(chartDTO);

        ChartDefinition chart = chartDefinitionRepository
                .findById(chartId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Chart not found"));

        chartDefinitionRepository.findByName(chartDTO.getName().trim())
                .filter(existingChart -> !existingChart.getId().equals(chartId))
                .ifPresent(existingChart -> {
                    throw new ResponseStatusException(
                            HttpStatus.CONFLICT,
                            "Chart name already exists"
                    );
                });

        chart.setName(chartDTO.getName().trim());
        chart.setTitle(chartDTO.getTitle().trim());
        chart.setDescription(trimToNull(chartDTO.getDescription()));
        chart.setChartType(chartDTO.getChartType().trim());
        chart.setLibrary(defaultIfBlank(chartDTO.getLibrary(), "plotly"));
        chart.setDataSourceKey(chartDTO.getDataSourceKey().trim());
        chart.setActive(chartDTO.getActive() == null || chartDTO.getActive());
        chart.setConstraintFlag(trimToNull(chartDTO.getConstraintFlag()));
        chart.setChartMode(resolveChartMode(chartDTO.getChartMode(), chart));
        chart.setProviderType(resolveProviderType(chartDTO.getProviderType(), chart.getChartMode(), chart));
        replaceParameters(chart, chartDTO.getParameters());

        ChartDefinition savedChart = chartDefinitionRepository.save(chart);

        return toDefinitionDetailDTO(savedChart);
    }

    @DeleteMapping("/{chartId}")
    @Transactional
    public ResponseEntity<Void> deleteChart(@PathVariable Long chartId) {
        ChartDefinition chart = chartDefinitionRepository
                .findById(chartId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Chart not found"));

        applicationChartConfigRepository.deleteByChartId(chartId);
        entityManager.createNativeQuery("DELETE FROM chart_context_sources WHERE chart_id = :chartId")
                .setParameter("chartId", chartId)
                .executeUpdate();
        chartDefinitionRepository.delete(chart);

        return ResponseEntity.noContent().build();
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

    @GetMapping("/data-sources")
    @Transactional
    public List<ChartDataSourceDTO> getDataSources() {
        List<Plot> plots = new ArrayList<>();
        plotRepository.findAll().forEach(plots::add);

        return plots
                .stream()
                .sorted(Comparator.comparing(plot -> defaultIfBlank(plot.getName(), "")))
                .map(this::toDataSourceDTO)
                .collect(Collectors.toList());
    }

    @GetMapping("/data-source-options")
    public ChartDataSourceOptionsDTO getDataSourceOptions() {
        List<Param> params = paramRepository.findAll()
                .stream()
                .sorted(Comparator.comparing(Param::getName))
                .collect(Collectors.toList());

        List<ContextSource> contextSources = new ArrayList<>();
        contextSourceRepository.findAll().forEach(contextSources::add);

        return new ChartDataSourceOptionsDTO(
                params
                        .stream()
                        .map(param -> new ChartDataSourceOptionsDTO.OptionDTO(
                                param.getId(),
                                param.getName()
                        ))
                        .collect(Collectors.toList()),
                contextSources
                        .stream()
                        .sorted(Comparator.comparing(ContextSource::getName))
                        .map(this::toContextSourceDTO)
                        .collect(Collectors.toList())
        );
    }

    @PostMapping("/data-sources")
    @Transactional
    public ResponseEntity<ChartDataSourceDTO> createDataSource(
            @RequestBody ChartDataSourceSaveDTO dataSourceDTO) {

        validateDataSource(dataSourceDTO);

        Param param = paramRepository
                .findById(dataSourceDTO.getParamId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "Param not found"));

        List<ContextSource> contextSources = findContextSources(dataSourceDTO.getContextSourceIds());

        Plot existingPlot = findExistingPlot(
                dataSourceDTO.getName().trim(),
                param.getId(),
                contextSources
        );

        if (existingPlot != null) {
            return ResponseEntity.ok(toDataSourceDTO(existingPlot));
        }

        Plot plot = new Plot();
        plot.setName(dataSourceDTO.getName().trim());
        plot.setApiKey(UUID.randomUUID());
        plot.setParam(param);
        plot.setContextSource(contextSources);

        Plot savedPlot = plotRepository.save(plot);

        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(toDataSourceDTO(savedPlot));
    }


    @GetMapping("/data-sources/{dataSourceId}")
    @Transactional
    public ChartDataSourceDTO getDataSource(
            @PathVariable Long dataSourceId) {

        Plot plot = plotRepository
                .findById(dataSourceId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Data source not found"));

        return toDataSourceDTO(plot);
    }

    @PutMapping("/data-sources/{dataSourceId}")
    @Transactional
    public ChartDataSourceDTO updateDataSource(
            @PathVariable Long dataSourceId,
            @RequestBody ChartDataSourceSaveDTO dataSourceDTO) {

        validateDataSource(dataSourceDTO);

        Plot plot = plotRepository
                .findById(dataSourceId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Data source not found"));

        Param param = paramRepository
                .findById(dataSourceDTO.getParamId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "Param not found"));

        List<ContextSource> contextSources = findContextSources(dataSourceDTO.getContextSourceIds());

        Plot existingPlot = findExistingPlot(
                dataSourceDTO.getName().trim(),
                param.getId(),
                contextSources
        );

        if (existingPlot != null && !existingPlot.getId().equals(plot.getId())) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Data source already exists");
        }

        plot.setName(dataSourceDTO.getName().trim());
        plot.setParam(param);
        plot.setContextSource(contextSources);

        return toDataSourceDTO(plotRepository.save(plot));
    }

    @DeleteMapping("/data-sources/{dataSourceId}")
    @Transactional
    public ResponseEntity<Void> deleteDataSource(
            @PathVariable Long dataSourceId) {

        Plot plot = plotRepository
                .findById(dataSourceId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Data source not found"));

        String dataSourceKey = plot.getApiKey().toString();

        List<ChartDefinition> chartsUsingDataSource =
                chartDefinitionRepository.findAllByDataSourceKey(dataSourceKey);

        if (!chartsUsingDataSource.isEmpty()) {
            String chartTitles = chartsUsingDataSource
                    .stream()
                    .map(chart -> {
                        List<ApplicationChartConfig> applicationConfigs =
                                applicationChartConfigRepository.findByChartId(chart.getId());

                        String applicationNames = applicationConfigs
                                .stream()
                                .map(config -> config.getApplication().getName())
                                .distinct()
                                .collect(Collectors.joining(", "));

                        long applicationCount = applicationConfigs
                                .stream()
                                .map(config -> config.getApplication().getName())
                                .distinct()
                                .count();

                        String applicationPreview = applicationConfigs
                                .stream()
                                .map(config -> config.getApplication().getName())
                                .distinct()
                                .limit(3)
                                .collect(Collectors.joining(", "));

                        String applicationInfo = applicationCount == 0
                                ? "not assigned to any application"
                                : "used in " + applicationCount + " application(s), including: "
                                        + applicationPreview
                                        + (applicationCount > 3 ? ", ..." : "");

                        return chart.getTitle() + " [" + chart.getName() + ", " + applicationInfo + "]";
                    })
                    .distinct()
                    .collect(Collectors.joining(", "));

            throw new ResponseStatusException(
                    HttpStatus.CONFLICT,
                    "Cannot delete data source. It is used by " + chartsUsingDataSource.size()
                            + " dynamic chart(s): " + chartTitles
            );
        }

        List<String> wetlabNames = entityManager
                .createNativeQuery(
                        "SELECT w.name " +
                                "FROM wetlab_plot wp " +
                                "JOIN wetlab w ON w.id = wp.wet_lab_id " +
                                "WHERE wp.plot_id = :plotId " +
                                "ORDER BY w.name"
                )
                .setParameter("plotId", plot.getId())
                .getResultList();

        long wetlabCount = wetlabNames
                .stream()
                .distinct()
                .count();

        if (wetlabCount > 0) {
            String wetlabPreview = wetlabNames
                    .stream()
                    .distinct()
                    .limit(5)
                    .collect(Collectors.joining(", "));

            throw new ResponseStatusException(
                    HttpStatus.CONFLICT,
                    "Cannot delete data source. It is used by " + wetlabCount
                            + " wetlab(s), including: " + wetlabPreview
                            + (wetlabCount > 5 ? ", ..." : "")
            );
        }

        plotRepository.delete(plot);

        return ResponseEntity.noContent().build();
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

            ensurePageAssignment(chart, "request_details");

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

    @GetMapping("/wetlab-config/{wetlabId}")
    public List<WetlabPlotConfigDTO> getWetlabPlotConfig(
            @PathVariable Long wetlabId) {

        return wetlabPlotConfigRepository
                .findByWetlabIdOrderByOrderIndexAsc(wetlabId)
                .stream()
                .map(this::toWetlabPlotConfigDTO)
                .collect(Collectors.toList());
    }

    @PostMapping("/wetlab-config/{wetlabId}/initialize")
    public List<WetlabPlotConfigDTO> initializeWetlabPlotConfig(
            @PathVariable Long wetlabId) {

        WetLab wetlab = wetLabRepository
                .findById(wetlabId)
                .orElseThrow();

        List<WetlabPlotConfig> existingConfigs =
                wetlabPlotConfigRepository
                        .findByWetlabIdOrderByOrderIndexAsc(wetlabId);

        if (!existingConfigs.isEmpty()) {
            return existingConfigs
                    .stream()
                    .map(this::toWetlabPlotConfigDTO)
                    .collect(Collectors.toList());
        }

        List<WetlabPlotConfig> newConfigs =
                new java.util.ArrayList<>();

        List<Plot> plots = wetlab.getPlot();

        if (plots != null) {
            for (int i = 0; i < plots.size(); i++) {
                WetlabPlotConfig config = new WetlabPlotConfig();
                config.setWetlab(wetlab);
                config.setPlot(plots.get(i));
                config.setEnabled(true);
                config.setOrderIndex(i + 1);

                newConfigs.add(config);
            }
        }

        return wetlabPlotConfigRepository
                .saveAll(newConfigs)
                .stream()
                .map(this::toWetlabPlotConfigDTO)
                .collect(Collectors.toList());
    }

    @PostMapping("/wetlab-config/{wetlabId}")
    public List<WetlabPlotConfigDTO> saveWetlabPlotConfig(
            @PathVariable Long wetlabId,
            @RequestBody List<WetlabPlotConfigSaveDTO> configDTOs) {

        WetLab wetlab = wetLabRepository
                .findById(wetlabId)
                .orElseThrow();

        List<WetlabPlotConfig> existingConfigs =
                wetlabPlotConfigRepository
                        .findByWetlabIdOrderByOrderIndexAsc(wetlabId);

        Map<Long, WetlabPlotConfig> existingByPlotId =
                existingConfigs
                        .stream()
                        .collect(Collectors.toMap(
                                config -> config.getPlot().getId(),
                                config -> config
                        ));

        List<WetlabPlotConfig> configsToSave =
                new java.util.ArrayList<>();

        for (WetlabPlotConfigSaveDTO dto : configDTOs) {
            Plot plot = plotRepository
                    .findById(dto.getPlotId())
                    .orElseThrow();

            WetlabPlotConfig config =
                    existingByPlotId.get(dto.getPlotId());

            if (config == null) {
                config = new WetlabPlotConfig();
                config.setWetlab(wetlab);
                config.setPlot(plot);
            }

            config.setEnabled(Boolean.TRUE.equals(dto.getEnabled()));
            config.setOrderIndex(dto.getOrderIndex());

            configsToSave.add(config);
        }

        return wetlabPlotConfigRepository
                .saveAll(configsToSave)
                .stream()
                .sorted(java.util.Comparator.comparing(WetlabPlotConfig::getOrderIndex))
                .map(this::toWetlabPlotConfigDTO)
                .collect(Collectors.toList());
    }

    @PostMapping("/wetlabs/{wetlabId}/data-sources")
    @Transactional
    public ResponseEntity<WetlabPlotConfigDTO> createWetlabDataSource(
            @PathVariable Long wetlabId,
            @RequestBody ChartDataSourceSaveDTO dataSourceDTO) {

        validateDataSource(dataSourceDTO);

        WetLab wetlab = wetLabRepository
                .findById(wetlabId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Wetlab not found"));

        Param param = paramRepository
                .findById(dataSourceDTO.getParamId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "Param not found"));

        List<ContextSource> contextSources = findContextSources(dataSourceDTO.getContextSourceIds());

        Plot existingPlot = findExistingPlot(
                dataSourceDTO.getName().trim(),
                param.getId(),
                contextSources
        );

        boolean created = false;
        Plot plot = existingPlot;

        if (plot == null) {
            plot = new Plot();
            plot.setName(dataSourceDTO.getName().trim());
            plot.setApiKey(UUID.randomUUID());
            plot.setParam(param);
            plot.setContextSource(contextSources);
            plot = plotRepository.save(plot);
            created = true;
        }

        entityManager
                .createNativeQuery(
                        "INSERT IGNORE INTO wetlab_plot (wet_lab_id, plot_id) " +
                                "VALUES (:wetlabId, :plotId)"
                )
                .setParameter("wetlabId", wetlabId)
                .setParameter("plotId", plot.getId())
                .executeUpdate();

        final Plot linkedPlot = plot;

        WetlabPlotConfig config = wetlabPlotConfigRepository
                .findByWetlabIdAndPlotId(wetlabId, linkedPlot.getId())
                .orElseGet(() -> {
                    WetlabPlotConfig newConfig = new WetlabPlotConfig();
                    newConfig.setWetlab(wetlab);
                    newConfig.setPlot(linkedPlot);

                    Integer nextOrderIndex = wetlabPlotConfigRepository
                            .findByWetlabIdOrderByOrderIndexAsc(wetlabId)
                            .stream()
                            .map(WetlabPlotConfig::getOrderIndex)
                            .filter(orderIndex -> orderIndex != null)
                            .max(Integer::compareTo)
                            .orElse(0) + 1;

                    newConfig.setOrderIndex(nextOrderIndex);
                    return newConfig;
                });

        config.setEnabled(true);

        WetlabPlotConfig savedConfig = wetlabPlotConfigRepository.save(config);

        return ResponseEntity
                .status(created ? HttpStatus.CREATED : HttpStatus.OK)
                .body(toWetlabPlotConfigDTO(savedConfig));
    }

    @PostMapping("/wetlabs/{wetlabId}/data-sources/{plotId}")
    @Transactional
    public WetlabPlotConfigDTO linkWetlabDataSource(
            @PathVariable Long wetlabId,
            @PathVariable Long plotId) {

        WetLab wetlab = wetLabRepository
                .findById(wetlabId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Wetlab not found"));

        Plot plot = plotRepository
                .findById(plotId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Data source not found"));

        entityManager
                .createNativeQuery(
                        "INSERT IGNORE INTO wetlab_plot (wet_lab_id, plot_id) " +
                                "VALUES (:wetlabId, :plotId)"
                )
                .setParameter("wetlabId", wetlabId)
                .setParameter("plotId", plotId)
                .executeUpdate();

        WetlabPlotConfig config = wetlabPlotConfigRepository
                .findByWetlabIdAndPlotId(wetlabId, plotId)
                .orElseGet(() -> {
                    WetlabPlotConfig newConfig = new WetlabPlotConfig();
                    newConfig.setWetlab(wetlab);
                    newConfig.setPlot(plot);

                    Integer nextOrderIndex = wetlabPlotConfigRepository
                            .findByWetlabIdOrderByOrderIndexAsc(wetlabId)
                            .stream()
                            .map(WetlabPlotConfig::getOrderIndex)
                            .filter(orderIndex -> orderIndex != null)
                            .max(Integer::compareTo)
                            .orElse(0) + 1;

                    newConfig.setOrderIndex(nextOrderIndex);
                    return newConfig;
                });

        config.setEnabled(true);

        return toWetlabPlotConfigDTO(wetlabPlotConfigRepository.save(config));
    }

    @PutMapping("/wetlabs/{wetlabId}/data-sources/{plotId}")
    @Transactional
    public ResponseEntity<WetlabPlotConfigDTO> updateWetlabDataSource(
            @PathVariable Long wetlabId,
            @PathVariable Long plotId,
            @RequestBody ChartDataSourceSaveDTO dataSourceDTO) {

        validateDataSource(dataSourceDTO);

        WetLab wetlab = wetLabRepository
                .findById(wetlabId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Wetlab not found"));

        plotRepository
                .findById(plotId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Data source not found"));

        WetlabPlotConfig previousConfig = wetlabPlotConfigRepository
                .findByWetlabIdAndPlotId(wetlabId, plotId)
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND,
                        "Data source is not linked to this wetlab"
                ));

        Param param = paramRepository
                .findById(dataSourceDTO.getParamId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "Param not found"));

        List<ContextSource> contextSources = findContextSources(dataSourceDTO.getContextSourceIds());

        Plot targetPlot = findExistingPlot(
                dataSourceDTO.getName().trim(),
                param.getId(),
                contextSources
        );

        boolean created = false;

        if (targetPlot == null) {
            targetPlot = new Plot();
            targetPlot.setName(dataSourceDTO.getName().trim());
            targetPlot.setApiKey(UUID.randomUUID());
            targetPlot.setParam(param);
            targetPlot.setContextSource(contextSources);
            targetPlot = plotRepository.save(targetPlot);
            created = true;
        }

        Integer previousOrderIndex = previousConfig.getOrderIndex();
        Boolean previousEnabled = previousConfig.getEnabled();

        if (!targetPlot.getId().equals(plotId)) {
            wetlabPlotConfigRepository.deleteByWetlabIdAndPlotId(wetlabId, plotId);

            entityManager
                    .createNativeQuery(
                            "DELETE FROM wetlab_plot " +
                                    "WHERE wet_lab_id = :wetlabId " +
                                    "AND plot_id = :plotId"
                    )
                    .setParameter("wetlabId", wetlabId)
                    .setParameter("plotId", plotId)
                    .executeUpdate();

            entityManager
                    .createNativeQuery(
                            "INSERT IGNORE INTO wetlab_plot (wet_lab_id, plot_id) " +
                                    "VALUES (:wetlabId, :plotId)"
                    )
                    .setParameter("wetlabId", wetlabId)
                    .setParameter("plotId", targetPlot.getId())
                    .executeUpdate();
        }

        final Plot finalTargetPlot = targetPlot;

        WetlabPlotConfig targetConfig = wetlabPlotConfigRepository
                .findByWetlabIdAndPlotId(wetlabId, finalTargetPlot.getId())
                .orElseGet(() -> {
                    WetlabPlotConfig newConfig = new WetlabPlotConfig();
                    newConfig.setWetlab(wetlab);
                    newConfig.setPlot(finalTargetPlot);
                    return newConfig;
                });

        targetConfig.setEnabled(previousEnabled == null || previousEnabled);
        targetConfig.setOrderIndex(previousOrderIndex == null ? 0 : previousOrderIndex);

        WetlabPlotConfig savedConfig = wetlabPlotConfigRepository.save(targetConfig);

        return ResponseEntity
                .status(created ? HttpStatus.CREATED : HttpStatus.OK)
                .body(toWetlabPlotConfigDTO(savedConfig));
    }

    @DeleteMapping("/wetlabs/{wetlabId}/data-sources/{plotId}")
    @Transactional
    public ResponseEntity<Void> unlinkWetlabDataSource(
            @PathVariable Long wetlabId,
            @PathVariable Long plotId) {

        wetLabRepository
                .findById(wetlabId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Wetlab not found"));

        plotRepository
                .findById(plotId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Data source not found"));

        wetlabPlotConfigRepository.deleteByWetlabIdAndPlotId(wetlabId, plotId);

        entityManager
                .createNativeQuery(
                        "DELETE FROM wetlab_plot " +
                                "WHERE wet_lab_id = :wetlabId " +
                                "AND plot_id = :plotId"
                )
                .setParameter("wetlabId", wetlabId)
                .setParameter("plotId", plotId)
                .executeUpdate();

        return ResponseEntity.noContent().build();
    }

    @GetMapping("/data/{dataSourceKey}/request/{requestCode}")
    public List<ChartDataPointDTO> getChartDataByRequest(
            @PathVariable String dataSourceKey,
            @PathVariable String requestCode,
            @RequestParam(defaultValue = "filename") String order) {

        ChartDefinition chart = chartDefinitionRepository
                .findByDataSourceKey(dataSourceKey)
                .orElseThrow();

        return getChartDataByRequest(chart, requestCode, order);
    }

    @GetMapping("/data/chart/{chartId}/request/{requestCode}")
    public List<ChartDataPointDTO> getChartDataByChartAndRequest(
            @PathVariable Long chartId,
            @PathVariable String requestCode,
            @RequestParam(defaultValue = "filename") String order) {

        ChartDefinition chart = chartDefinitionRepository
                .findById(chartId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Chart not found"));

        return getChartDataByRequest(chart, requestCode, order);
    }

    private List<ChartDataPointDTO> getChartDataByRequest(
            ChartDefinition chart,
            String requestCode,
            String order) {

        String dataSourceKey = chart.getDataSourceKey();
        String providerType = normalizeProviderType(chart.getProviderType());

        List<ChartDataRepository.ChartDataPointProjection> points;

        if ("context_source_group".equals(providerType)) {

            points = chartDataRepository
                    .findChartDataByContextSourceGroup(
                            dataSourceKey,
                            requestCode
                    );

        } else if ("context_source_group_by_file".equals(providerType)) {

            points = chartDataRepository
                    .findChartDataByContextSourceGroupByFile(
                            dataSourceKey,
                            requestCode,
                            order
                    );

                } else if (("file_info_column".equals(providerType)
                || "file_info_stacked_by_file".equals(providerType))
                && "modified_peptides".equals(dataSourceKey)) {

            points = chartDataRepository
                    .findModifiedPeptidesByRequestCode(
                            requestCode,
                            order
                    );

        } else if (("modification_ratio_by_file".equals(providerType)
                || "modification_stacked_by_file".equals(providerType))
                && "percentage_propionyl".equals(dataSourceKey)) {

            points = chartDataRepository
                    .findPercentagePropionylByRequestCode(
                            requestCode,
                            order
                    );

        } else if (("modification_ratio_by_file".equals(providerType)
                || "modification_stacked_by_file".equals(providerType))
                && "percentage_pic".equals(dataSourceKey)) {

            points = chartDataRepository
                    .findPercentagePicByRequestCode(
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

        ChartDefinition chart = chartDefinitionRepository
                .findByDataSourceKey(dataSourceKey)
                .orElseThrow();

        return getStackedChartDataByRequest(chart, requestCode, order);
    }

    @GetMapping("/stacked-data/chart/{chartId}/request/{requestCode}")
    public List<ChartSeriesDataPointDTO> getStackedChartDataByChartAndRequest(
            @PathVariable Long chartId,
            @PathVariable String requestCode,
            @RequestParam(defaultValue = "date") String order) {

        ChartDefinition chart = chartDefinitionRepository
                .findById(chartId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Chart not found"));

        return getStackedChartDataByRequest(chart, requestCode, order);
    }

    private List<ChartSeriesDataPointDTO> getStackedChartDataByRequest(
            ChartDefinition chart,
            String requestCode,
            String order) {

        String dataSourceKey = chart.getDataSourceKey();
        String providerType = normalizeProviderType(chart.getProviderType());

        List<ChartDataRepository.ChartSeriesDataPointProjection> points;

                if ("modification_sites".equals(dataSourceKey)) {
                points = chartDataRepository
                        .findModificationSitesByRequestCode(
                                requestCode,
                                order
                        );

        } else if ("modified_peptides".equals(dataSourceKey)
                && "file_info_stacked_by_file".equals(providerType)) {
                points = chartDataRepository
                        .findModifiedPeptidesStackedByRequestCode(
                                requestCode,
                                order
                        );

        } else if ("percentage_propionyl".equals(dataSourceKey)
                && "modification_stacked_by_file".equals(providerType)) {
                points = chartDataRepository
                        .findPercentagePropionylStackedByRequestCode(
                                requestCode,
                                order
                        );

        } else if ("percentage_pic".equals(dataSourceKey)
                && "modification_stacked_by_file".equals(providerType)) {
                points = chartDataRepository
                        .findPercentagePicStackedByRequestCode(
                                requestCode,
                                order
                        );

        } else if ("polymer_contaminants".equals(dataSourceKey)
                && "modification_stacked_by_type".equals(providerType)) {
                points = chartDataRepository
                        .findModificationStackedByTypeAndRequestCode(
                                requestCode,
                                "polymer-contaminants",
                                order
                        );

        } else {
                points = chartDataRepository
                        .findStackedChartDataByPlotApiKeyAndRequestCode(
                                dataSourceKey,
                                requestCode,
                                order
                        );

                if (points.isEmpty()) {
                        points = chartDataRepository
                                .findStackedChartDataByContextSourceGroup(
                                        dataSourceKey,
                                        requestCode,
                                        order
                                );
                }
        }

        return points
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

    private void createDefaultPageAssignment(ChartDefinition chart, String pageName) {
                ensurePageAssignment(chart, pageName);
        }

        private void ensurePageAssignment(ChartDefinition chart, String pageName) {
                boolean alreadyAssigned = chartPageAssignmentRepository
                                .findByPageNameAndVisibleTrueOrderByDisplayOrderAsc(pageName)
                                .stream()
                                .anyMatch(assignment -> assignment.getChart().getId().equals(chart.getId()));

                if (alreadyAssigned) {
                        return;
                }

        int nextDisplayOrder = chartPageAssignmentRepository
                .findByPageNameAndVisibleTrueOrderByDisplayOrderAsc(pageName)
                .stream()
                .map(ChartPageAssignment::getDisplayOrder)
                .filter(order -> order != null)
                .max(Integer::compareTo)
                .orElse(0) + 1;

        ChartPageAssignment assignment = new ChartPageAssignment();
        assignment.setChart(chart);
        assignment.setPageName(pageName);
        assignment.setDisplayOrder(nextDisplayOrder);
        assignment.setVisible(true);

        chartPageAssignmentRepository.save(assignment);
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

    private WetlabPlotConfigDTO toWetlabPlotConfigDTO(
            WetlabPlotConfig config) {

        Plot plot = config.getPlot();

        return new WetlabPlotConfigDTO(
                config.getId(),
                config.getWetlab().getId(),
                plot.getId(),
                plot.getName(),
                config.getEnabled(),
                config.getOrderIndex()
        );
    }

    private ChartDataSourceDTO toDataSourceDTO(Plot plot) {
        Param param = plot.getParam();

        List<ChartDataSourceDTO.ContextSourceDTO> contextSources =
                plot.getContextSource() == null
                        ? Collections.emptyList()
                        : plot.getContextSource()
                                .stream()
                                .sorted(Comparator.comparing(ContextSource::getName))
                                .map(this::toContextSourceDTO)
                                .collect(Collectors.toList());

        return new ChartDataSourceDTO(
                plot.getId(),
                plot.getName(),
                plot.getApiKey() == null ? null : plot.getApiKey().toString(),
                param == null ? null : param.getId(),
                param == null ? null : param.getName(),
                contextSources
        );
    }

    private ChartDataSourceDTO.ContextSourceDTO toContextSourceDTO(ContextSource contextSource) {
        return new ChartDataSourceDTO.ContextSourceDTO(
                contextSource.getId(),
                contextSource.getName(),
                contextSource.getAbbreviated()
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

        private ChartDefinitionDetailDTO toDefinitionDetailDTO(ChartDefinition chart) {
                return new ChartDefinitionDetailDTO(
                                chart.getId(),
                                chart.getName(),
                                chart.getTitle(),
                                chart.getDescription(),
                                chart.getChartType(),
                                resolveChartMode(null, chart),
                                chart.getLibrary(),
                                chart.getDataSourceKey(),
                                chart.getActive(),
                                toParameterDTOs(chart.getParameters())
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
                resolveChartMode(null, chart),
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

        private List<ChartParameterDTO> toParameterDTOs(List<ChartParameter> parameters) {
                if (parameters == null || parameters.isEmpty()) {
                        return Collections.emptyList();
                }

                return parameters.stream()
                                .map(parameter -> new ChartParameterDTO(
                                                parameter.getParamKey(),
                                                parameter.getParamValue(),
                                                parameter.getParamType(),
                                                parameter.getDescription()
                                ))
                                .collect(Collectors.toList());
        }

        private List<ChartParameter> buildParameters(
                        List<ChartParameterSaveDTO> parameterDTOs,
                        ChartDefinition chart) {

                if (parameterDTOs == null || parameterDTOs.isEmpty()) {
                        return Collections.emptyList();
                }

                Set<String> keys = new HashSet<>();

                return parameterDTOs.stream()
                                .map(parameterDTO -> toChartParameter(parameterDTO, chart, keys))
                                .collect(Collectors.toList());
        }

        private void replaceParameters(
                        ChartDefinition chart,
                        List<ChartParameterSaveDTO> parameterDTOs) {

                List<ChartParameter> updatedParameters = buildParameters(parameterDTOs, chart);

                if (chart.getParameters() == null) {
                        chart.setParameters(updatedParameters);
                        return;
                }

                Map<String, ChartParameter> existingParameters = chart.getParameters()
                                .stream()
                                .collect(Collectors.toMap(
                                                ChartParameter::getParamKey,
                                                parameter -> parameter
                                ));

                Set<String> updatedKeys = updatedParameters.stream()
                                .map(ChartParameter::getParamKey)
                                .collect(Collectors.toSet());

                chart.getParameters().removeIf(parameter -> !updatedKeys.contains(parameter.getParamKey()));

                for (ChartParameter updatedParameter : updatedParameters) {
                        ChartParameter existingParameter = existingParameters.get(updatedParameter.getParamKey());

                        if (existingParameter == null) {
                                chart.getParameters().add(updatedParameter);
                                continue;
                        }

                        existingParameter.setParamValue(updatedParameter.getParamValue());
                        existingParameter.setParamType(updatedParameter.getParamType());
                        existingParameter.setDescription(updatedParameter.getDescription());
                }
        }

        private ChartParameter toChartParameter(
                        ChartParameterSaveDTO parameterDTO,
                        ChartDefinition chart,
                        Set<String> keys) {

                String key = requireValue(parameterDTO.getKey(), "Parameter key is required");
                String normalizedKey = key.trim();

                if (!keys.add(normalizedKey)) {
                        throw new ResponseStatusException(
                                        HttpStatus.BAD_REQUEST,
                                        "Duplicate chart parameter key: " + normalizedKey
                        );
                }

                ChartParameter parameter = new ChartParameter();
                parameter.setChart(chart);
                parameter.setParamKey(normalizedKey);
                parameter.setParamValue(trimToNull(parameterDTO.getValue()));
                parameter.setParamType(defaultIfBlank(parameterDTO.getType(), "string"));
                parameter.setDescription(trimToNull(parameterDTO.getDescription()));

                return parameter;
        }

        private void validateDataSource(ChartDataSourceSaveDTO dataSourceDTO) {
                if (dataSourceDTO == null) {
                        throw new ResponseStatusException(
                                        HttpStatus.BAD_REQUEST,
                                        "Data source payload is required"
                        );
                }

                requireValue(dataSourceDTO.getName(), "Data source name is required");

                if (dataSourceDTO.getParamId() == null) {
                        throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Param is required");
                }

                if (dataSourceDTO.getContextSourceIds() == null
                                || dataSourceDTO.getContextSourceIds().isEmpty()) {
                        throw new ResponseStatusException(
                                        HttpStatus.BAD_REQUEST,
                                        "At least one context source is required"
                        );
                }
        }

        private List<ContextSource> findContextSources(List<Long> contextSourceIds) {
                Set<Long> requestedIds = new HashSet<>(contextSourceIds);
                List<ContextSource> contextSources = new ArrayList<>();

                contextSourceRepository
                                .findAllById(requestedIds)
                                .forEach(contextSources::add);

                if (contextSources.size() != requestedIds.size()) {
                        throw new ResponseStatusException(
                                        HttpStatus.BAD_REQUEST,
                                        "One or more context sources were not found"
                        );
                }

                return contextSources
                                .stream()
                                .sorted(Comparator.comparing(ContextSource::getName))
                                .collect(Collectors.toList());
        }

        private Plot findExistingPlot(
                        String name,
                        Long paramId,
                        List<ContextSource> contextSources) {

                for (Plot plot : plotRepository.findAll()) {
                        Param plotParam = plot.getParam();

                        if (plotParam == null || !paramId.equals(plotParam.getId())) {
                                continue;
                        }

                        if (!name.equalsIgnoreCase(defaultIfBlank(plot.getName(), ""))) {
                                continue;
                        }

                        if (hasSameContextSources(plot.getContextSource(), contextSources)) {
                                return plot;
                        }
                }

                return null;
        }

        private boolean hasSameContextSources(
                        List<ContextSource> existingContextSources,
                        List<ContextSource> requestedContextSources) {

                if (existingContextSources == null) {
                        return requestedContextSources == null || requestedContextSources.isEmpty();
                }

                List<Long> existingIds = existingContextSources
                                .stream()
                                .map(ContextSource::getId)
                                .sorted()
                                .collect(Collectors.toList());

                List<Long> requestedIds = requestedContextSources
                                .stream()
                                .map(ContextSource::getId)
                                .sorted()
                                .collect(Collectors.toList());

                return existingIds.equals(requestedIds);
        }

        private void validateChartDefinition(ChartDefinitionSaveDTO chartDTO) {
                if (chartDTO == null) {
                        throw new ResponseStatusException(
                                        HttpStatus.BAD_REQUEST,
                                        "Chart payload is required"
                        );
                }

                requireValue(chartDTO.getName(), "Chart name is required");
                requireValue(chartDTO.getTitle(), "Chart title is required");
                requireValue(chartDTO.getChartType(), "Chart type is required");
                requireValue(chartDTO.getDataSourceKey(), "Chart data source key is required");
        }

        private String requireValue(String value, String message) {
                if (value == null || value.trim().isEmpty()) {
                        throw new ResponseStatusException(HttpStatus.BAD_REQUEST, message);
                }

                return value;
        }

        private String defaultIfBlank(String value, String fallback) {
                String trimmed = trimToNull(value);
                return trimmed == null ? fallback : trimmed;
        }

        private String trimToNull(String value) {
                if (value == null) {
                        return null;
                }

                String trimmed = value.trim();
                return trimmed.isEmpty() ? null : trimmed;
        }

        private String normalizeProviderType(String providerType) {
                String normalized = defaultIfBlank(providerType, "plot_api_key");

                switch (normalized) {
                        case "file_info_stacked_by_file":
                                return "file_info_stacked_by_file";
                        case "file_info_column":
                                return "file_info_column";
                        case "modification_stacked_by_file":
                                return "modification_stacked_by_file";
                        case "modification_ratio_by_file":
                                return "modification_ratio_by_file";
                        case "modification_stacked_by_type":
                                return "modification_stacked_by_type";
                        case "stacked_context_source":
                                return "stacked_context_source";
                        case "context_source_group":
                                return "context_source_group";
                        case "context_source_group_by_file":
                                return "context_source_group_by_file";
                        default:
                                return normalized;
                }
        }

        private String resolveProviderType(String requestedProviderType, String chartMode, ChartDefinition chart) {
                String normalizedProviderType = normalizeRequestedProviderType(requestedProviderType);
                if (normalizedProviderType != null) {
                        return normalizedProviderType;
                }

                String existingProviderType = normalizeRequestedProviderType(chart.getProviderType());
                if (existingProviderType != null) {
                        return existingProviderType;
                }

                if ("STACKED_BAR".equals(normalizeChartMode(chartMode))) {
                        return "stacked_context_source";
                }

                return "plot_api_key";
        }

        private String normalizeRequestedProviderType(String providerType) {
                String trimmedProviderType = trimToNull(providerType);
                if (trimmedProviderType == null) {
                        return null;
                }

                return normalizeProviderType(trimmedProviderType);
        }

        private String resolveChartMode(String requestedChartMode, ChartDefinition chart) {
                String normalizedChartMode = normalizeChartMode(requestedChartMode);
                if (normalizedChartMode != null) {
                        return normalizedChartMode;
                }

                String existingChartMode = normalizeChartMode(chart.getChartMode());
                if (existingChartMode != null) {
                        return existingChartMode;
                }

                String providerType = normalizeProviderType(chart.getProviderType());

                if ("file_info_stacked_by_file".equals(providerType)
                                || "modification_stacked_by_file".equals(providerType)
                                || "modification_stacked_by_type".equals(providerType)
                                || "stacked_context_source".equals(providerType)) {
                        return "STACKED_BAR";
                }

                return "SIMPLE_BAR";
        }

        private String normalizeChartMode(String chartMode) {
                String normalized = trimToNull(chartMode);
                if (normalized == null) {
                        return null;
                }

                switch (normalized.trim().toUpperCase()) {
                        case "SIMPLE_BAR":
                        case "BAR":
                        case "SIMPLE":
                                return "SIMPLE_BAR";
                        case "STACKED_BAR":
                        case "STACKED":
                                return "STACKED_BAR";
                        default:
                                throw new ResponseStatusException(
                                                HttpStatus.BAD_REQUEST,
                                                "Unsupported chart mode: " + chartMode
                                );
                }
        }
}
