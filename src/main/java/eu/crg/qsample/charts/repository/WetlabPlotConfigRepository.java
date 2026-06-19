package eu.crg.qsample.charts.repository;

import eu.crg.qsample.charts.entity.WetlabPlotConfig;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface WetlabPlotConfigRepository extends JpaRepository<WetlabPlotConfig, Long> {

    List<WetlabPlotConfig> findByWetlabIdOrderByOrderIndexAsc(Long wetlabId);

    Optional<WetlabPlotConfig> findByWetlabIdAndPlotId(Long wetlabId, Long plotId);

    void deleteByWetlabIdAndPlotId(Long wetlabId, Long plotId);
}
