package eu.crg.qsample.charts.repository;

import eu.crg.qsample.charts.entity.ChartDefinition;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ChartDefinitionRepository extends JpaRepository<ChartDefinition, Long> {
    Optional<ChartDefinition> findByName(String name);
    Optional<ChartDefinition> findByDataSourceKey(String dataSourceKey);
    List<ChartDefinition> findByActiveTrue();
}
