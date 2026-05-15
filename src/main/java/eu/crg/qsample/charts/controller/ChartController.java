package eu.crg.qsample.charts.controller;

import eu.crg.qsample.charts.dto.ChartDefinitionDTO;
import eu.crg.qsample.charts.entity.ChartDefinition;
import eu.crg.qsample.charts.repository.ChartDefinitionRepository;
import eu.crg.qsample.charts.repository.ChartPageAssignmentRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;
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
                .map(chart -> new ChartDefinitionDTO(
                        chart.getId(),
                        chart.getName(),
                        chart.getTitle(),
                        chart.getDescription(),
                        chart.getChartType(),
                        chart.getLibrary(),
                        chart.getDataSourceKey(),
                        chart.getActive()
                ))
                .collect(Collectors.toList());
    }

    @GetMapping("/page/{pageName}")
    public List<ChartDefinitionDTO> getChartsByPage(@PathVariable String pageName) {

        return chartPageAssignmentRepository
                .findByPageNameAndVisibleTrueOrderByDisplayOrderAsc(pageName)
                .stream()
                .map(assignment -> assignment.getChart())
                .filter(chart -> Boolean.TRUE.equals(chart.getActive()))
                .map(chart -> new ChartDefinitionDTO(
                        chart.getId(),
                        chart.getName(),
                        chart.getTitle(),
                        chart.getDescription(),
                        chart.getChartType(),
                        chart.getLibrary(),
                        chart.getDataSourceKey(),
                        chart.getActive()
                ))
                .collect(Collectors.toList());
    }
}
