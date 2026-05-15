package eu.crg.qsample.charts.repository;

import eu.crg.qsample.charts.entity.ChartPageAssignment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ChartPageAssignmentRepository extends JpaRepository<ChartPageAssignment, Long> {
    List<ChartPageAssignment> findByPageNameAndVisibleTrueOrderByDisplayOrder(String pageName);
}
