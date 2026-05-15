package eu.crg.qsample.charts.controller;

import eu.crg.qsample.charts.entity.ChartDefinition;
import eu.crg.qsample.charts.repository.ChartDefinitionRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/charts")
public class ChartController {

    private final ChartDefinitionRepository chartDefinitionRepository;

    public ChartController(ChartDefinitionRepository chartDefinitionRepository) {
        this.chartDefinitionRepository = chartDefinitionRepository;
    }

    @GetMapping
    public List<ChartDefinition> getCharts() {
        return chartDefinitionRepository.findByActiveTrue();
    }
}
