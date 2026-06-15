package eu.crg.qsample.charts.repository;

import eu.crg.qsample.charts.entity.WetlabPlotConfig;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface WetlabPlotConfigRepository extends JpaRepository<WetlabPlotConfig, Long> {

    List<WetlabPlotConfig> findByWetlabIdOrderByOrderIndexAsc(Long wetlabId);
}
