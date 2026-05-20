package eu.crg.qsample.charts.repository;

import eu.crg.qsample.charts.entity.ChartDefinition;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ChartDataRepository extends Repository<ChartDefinition, Long> {

    interface ChartDataPointProjection {
        String getLabel();
        Double getValue();
        String getChecksum();
        String getCreationDate();
    }

    interface ChartSeriesDataPointProjection {
        String getLabel();
        String getSeries();
        String getChecksum();
        String getCreationDate();
        Double getValue();
    }

    @Query(value =
        "SELECT " +
        "  f.filename AS label, " +
        "  d.calculated_value AS value, " +
        "  f.checksum AS checksum, " +
        "  CAST(f.creation_date AS CHAR) AS creationDate " +
        "FROM plot p " +
        "JOIN plot_context_source pcs ON pcs.plot_id = p.id " +
        "JOIN data d " +
        "  ON d.param_id = p.param_id " +
        " AND d.context_source_id = pcs.context_source_id " +
        "JOIN file f ON f.id = d.file_id " +
        "WHERE p.api_key = :plotApiKey " +
        "  AND f.request_code = :requestCode " +
        "  AND f.dtype = 'RequestFile' " +
        "ORDER BY " +
        "  CASE WHEN :order = 'filename' THEN f.filename END ASC, " +
        "  CASE WHEN :order = 'date' THEN f.creation_date END ASC",
        nativeQuery = true)
    List<ChartDataPointProjection> findChartDataByPlotApiKeyAndRequestCode(
            @Param("plotApiKey") String plotApiKey,
            @Param("requestCode") String requestCode,
            @Param("order") String order
    );

    @Query(value =
            "SELECT " +
            "  cs.name AS label, " +
            "  AVG(d.calculated_value) AS value " +
            "FROM chart_definitions cd " +
            "JOIN chart_context_sources ccs " +
            "  ON ccs.chart_id = cd.id " +
            "JOIN context_source cs " +
            "  ON cs.id = ccs.context_source_id " +
            "JOIN data d " +
            "  ON d.context_source_id = cs.id " +
            "JOIN file f " +
            "  ON f.id = d.file_id " +
            "WHERE cd.data_source_key = :dataSourceKey " +
            "  AND f.request_code = :requestCode " +
            "  AND f.dtype = 'RequestFile' " +
            "GROUP BY cs.name " +
            "ORDER BY value DESC",
            nativeQuery = true)
    List<ChartDataPointProjection> findChartDataByContextSourceGroup(
            @Param("dataSourceKey") String dataSourceKey,
            @Param("requestCode") String requestCode
    );

    @Query(value =
        "SELECT " +
        "  f.filename AS label, " +
        "  SUM(d.calculated_value) AS value, " +
        "  f.checksum AS checksum, " +
        "  CAST(f.creation_date AS CHAR) AS creationDate " +
        "FROM chart_definitions cd " +
        "JOIN chart_context_sources ccs " +
        "  ON ccs.chart_id = cd.id " +
        "JOIN context_source cs " +
        "  ON cs.id = ccs.context_source_id " +
        "JOIN data d " +
        "  ON d.context_source_id = cs.id " +
        "JOIN file f " +
        "  ON f.id = d.file_id " +
        "WHERE cd.data_source_key = :dataSourceKey " +
        "  AND f.request_code = :requestCode " +
        "  AND f.dtype = 'RequestFile' " +
        "GROUP BY f.filename, f.creation_date, f.checksum " +
        "ORDER BY " +
        "  CASE WHEN :order = 'filename' THEN f.filename END ASC, " +
        "  CASE WHEN :order = 'date' THEN f.creation_date END ASC",
        nativeQuery = true)
    List<ChartDataPointProjection> findChartDataByContextSourceGroupByFile(
            @Param("dataSourceKey") String dataSourceKey,
            @Param("requestCode") String requestCode,
            @Param("order") String order
    );

    @Query(value =
            "SELECT " +
            "  f.filename AS label, " +
            "  cs.abbreviated AS series, " +
            "  d.calculated_value AS value, " +
            "  f.checksum AS checksum, " +
            "  CAST(f.creation_date AS CHAR) AS creationDate " +
            "FROM chart_definitions cd " +
            "JOIN chart_context_sources ccs " +
            "  ON ccs.chart_id = cd.id " +
            "JOIN context_source cs " +
            "  ON cs.id = ccs.context_source_id " +
            "JOIN data d " +
            "  ON d.context_source_id = cs.id " +
            "JOIN file f " +
            "  ON f.id = d.file_id " +
            "WHERE cd.data_source_key = :dataSourceKey " +
            "  AND f.request_code = :requestCode " +
            "  AND f.dtype = 'RequestFile' " +
            "ORDER BY " +
            "  CASE WHEN :order = 'filename' THEN f.filename END ASC, " +
            "  CASE WHEN :order = 'date' THEN f.creation_date END ASC",
            nativeQuery = true)
    List<ChartSeriesDataPointProjection> findStackedChartDataByContextSourceGroup(
            @Param("dataSourceKey") String dataSourceKey,
            @Param("requestCode") String requestCode,
            @Param("order") String order
    );

}