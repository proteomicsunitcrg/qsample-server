package eu.crg.qsample.charts.repository;

import eu.crg.qsample.charts.entity.ChartParameter;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ChartParameterRepository extends JpaRepository<ChartParameter, Long> {
    List<ChartParameter> findByChartId(Long chartId);
}
