package eu.crg.qsample.charts.repository;

import eu.crg.qsample.charts.entity.WetlabChartConfig;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface WetlabChartConfigRepository extends JpaRepository<WetlabChartConfig, Long> {

    List<WetlabChartConfig> findByWetlabIdOrderByOrderIndexAsc(Long wetlabId);

    List<WetlabChartConfig> findByWetlabIdAndEnabledTrueOrderByOrderIndexAsc(Long wetlabId);

    List<WetlabChartConfig> findByChartId(Long chartId);

    void deleteByChartId(Long chartId);
}
