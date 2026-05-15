package eu.crg.qsample.charts.controller;

import eu.crg.qsample.charts.dto.ChartDefinitionDTO;
import eu.crg.qsample.charts.entity.ChartDefinition;
import eu.crg.qsample.charts.repository.ChartDefinitionRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/charts")
public class ChartController {

    private final ChartDefinitionRepository chartDefinitionRepository;

    public ChartController(ChartDefinitionRepository chartDefinitionRepository) {
        this.chartDefinitionRepository = chartDefinitionRepository;
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
}
