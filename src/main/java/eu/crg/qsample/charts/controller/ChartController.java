package eu.crg.qsample.charts.controller;

import eu.crg.qsample.charts.dto.ChartConfigDTO;
import eu.crg.qsample.charts.dto.ChartDefinitionDTO;
import eu.crg.qsample.charts.entity.ChartDefinition;
import eu.crg.qsample.charts.entity.ChartParameter;
import eu.crg.qsample.charts.repository.ChartDefinitionRepository;
import eu.crg.qsample.charts.repository.ChartPageAssignmentRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/charts")
public class ChartController {

    private final ChartDefinitionRepository chartDefinitionRepository;
    private final ChartPageAssignmentRepository chartPageAssignmentRepository;

    public ChartController(
            ChartDefinitionRepository chartDefinitionRepository,
            ChartPageAssignmentRepository chartPageAssignmentRepository
    ) {
        this.chartDefinitionRepository = chartDefinitionRepository;
        this.chartPageAssignmentRepository = chartPageAssignmentRepository;
    }

    @GetMapping
    public List<ChartDefinitionDTO> getCharts() {

        List<ChartDefinition> charts = chartDefinitionRepository.findByActiveTrue();

        return charts.stream()
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
            return java.util.Collections.emptyMap();
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