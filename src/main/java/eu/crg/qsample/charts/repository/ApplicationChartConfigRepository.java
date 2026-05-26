package eu.crg.qsample.charts.repository;

import eu.crg.qsample.charts.entity.ApplicationChartConfig;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ApplicationChartConfigRepository extends JpaRepository<ApplicationChartConfig, Long> {

    List<ApplicationChartConfig> findByApplicationIdOrderByOrderIndexAsc(Long applicationId);

    List<ApplicationChartConfig> findByApplicationIdAndEnabledTrueOrderByOrderIndexAsc(Long applicationId);
}