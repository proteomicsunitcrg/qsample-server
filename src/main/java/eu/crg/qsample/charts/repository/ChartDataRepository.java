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
            "  AVG(d.calculated_value) AS value, " +
            "  NULL AS checksum, " +
            "  NULL AS creationDate " +
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
        "  CAST(fi.peptide_modified AS DECIMAL(20,4)) AS value, " +
        "  f.checksum AS checksum, " +
        "  CAST(f.creation_date AS CHAR) AS creationDate " +
        "FROM file f " +
        "JOIN file_info fi " +
        "  ON fi.id = f.file_info_id " +
        "WHERE f.request_code = :requestCode " +
        "  AND f.dtype = 'RequestFile' " +
        "  AND fi.peptide_modified IS NOT NULL " +
        "ORDER BY " +
        "  CASE WHEN :order = 'filename' THEN f.filename END ASC, " +
        "  CASE WHEN :order = 'date' THEN f.creation_date END ASC",
        nativeQuery = true)
    List<ChartDataPointProjection> findModifiedPeptidesByRequestCode(
            @Param("requestCode") String requestCode,
            @Param("order") String order
    );

    @Query(value =
        "SELECT " +
        "  f.filename AS label, " +
        "  100 * MAX(CASE WHEN m.name = 'Sum. area Propionyl N-term' THEN mf.value END) / " +
        "  ( " +
        "    MAX(CASE WHEN m.name = 'Sum. area Propionyl N-term' THEN mf.value END) + " +
        "    MAX(CASE WHEN m.name = 'Sum. area not Propionyl N-term' THEN mf.value END) " +
        "  ) AS value, " +
        "  f.checksum AS checksum, " +
        "  CAST(f.creation_date AS CHAR) AS creationDate " +
        "FROM file f " +
        "JOIN modification_file mf " +
        "  ON mf.file_id = f.id " +
        "JOIN modification m " +
        "  ON m.id = mf.modification_id " +
        "WHERE f.request_code = :requestCode " +
        "  AND f.dtype = 'RequestFile' " +
        "  AND m.name IN ( " +
        "    'Sum. area Propionyl N-term', " +
        "    'Sum. area not Propionyl N-term' " +
        "  ) " +
        "GROUP BY f.id, f.filename, f.checksum, f.creation_date " +
        "HAVING value IS NOT NULL " +
        "ORDER BY " +
        "  CASE WHEN :order = 'filename' THEN f.filename END ASC, " +
        "  CASE WHEN :order = 'date' THEN f.creation_date END ASC",
        nativeQuery = true)
    List<ChartDataPointProjection> findPercentagePropionylByRequestCode(
            @Param("requestCode") String requestCode,
            @Param("order") String order
    );

    @Query(value =
        "SELECT " +
        "  f.filename AS label, " +
        "  100 * MAX(CASE WHEN m.name = 'Sum. area PIC precursors N-term' THEN mf.value END) / " +
        "  ( " +
        "    MAX(CASE WHEN m.name = 'Sum. area PIC precursors N-term' THEN mf.value END) + " +
        "    MAX(CASE WHEN m.name = 'Sum. area not PIC precursors N-term' THEN mf.value END) " +
        "  ) AS value, " +
        "  f.checksum AS checksum, " +
        "  CAST(f.creation_date AS CHAR) AS creationDate " +
        "FROM file f " +
        "JOIN modification_file mf " +
        "  ON mf.file_id = f.id " +
        "JOIN modification m " +
        "  ON m.id = mf.modification_id " +
        "WHERE f.request_code = :requestCode " +
        "  AND f.dtype = 'RequestFile' " +
        "  AND m.name IN ( " +
        "    'Sum. area PIC precursors N-term', " +
        "    'Sum. area not PIC precursors N-term' " +
        "  ) " +
        "GROUP BY f.id, f.filename, f.checksum, f.creation_date " +
        "HAVING value IS NOT NULL " +
        "ORDER BY " +
        "  CASE WHEN :order = 'filename' THEN f.filename END ASC, " +
        "  CASE WHEN :order = 'date' THEN f.creation_date END ASC",
        nativeQuery = true)
    List<ChartDataPointProjection> findPercentagePicByRequestCode(
            @Param("requestCode") String requestCode,
            @Param("order") String order
    );

        @Query(value =
                "SELECT " +
                "  f.filename AS label, " +
                "  'Modified peptides' AS series, " +
                "  CAST(fi.peptide_modified AS DECIMAL(20,4)) AS value, " +
                "  f.checksum AS checksum, " +
                "  CAST(f.creation_date AS CHAR) AS creationDate " +
                "FROM file f " +
                "JOIN file_info fi ON fi.id = f.file_info_id " +
                "WHERE f.request_code = :requestCode " +
                "  AND f.dtype = 'RequestFile' " +
                "  AND fi.peptide_modified IS NOT NULL " +
                "UNION ALL " +
                "SELECT " +
                "  f.filename AS label, " +
                "  'Unmodified peptides' AS series, " +
                "  CAST((fi.peptide_hits - fi.peptide_modified) AS DECIMAL(20,4)) AS value, " +
                "  f.checksum AS checksum, " +
                "  CAST(f.creation_date AS CHAR) AS creationDate " +
                "FROM file f " +
                "JOIN file_info fi ON fi.id = f.file_info_id " +
                "WHERE f.request_code = :requestCode " +
                "  AND f.dtype = 'RequestFile' " +
                "  AND fi.peptide_hits IS NOT NULL " +
                "  AND fi.peptide_modified IS NOT NULL " +
                "ORDER BY " +
                "  CASE WHEN :order = 'filename' THEN label END ASC, " +
                "  CASE WHEN :order = 'date' THEN creationDate END ASC, " +
                "  series ASC",
                nativeQuery = true)
        List<ChartSeriesDataPointProjection> findModifiedPeptidesStackedByRequestCode(
                @Param("requestCode") String requestCode,
                @Param("order") String order
        );

        @Query(value =
        "SELECT " +
        "  f.filename AS label, " +
        "  m.name AS series, " +
        "  mf.value AS value, " +
        "  f.checksum AS checksum, " +
        "  CAST(f.creation_date AS CHAR) AS creationDate " +
        "FROM file f " +
        "JOIN modification_file mf ON mf.file_id = f.id " +
        "JOIN modification m ON m.id = mf.modification_id " +
        "WHERE f.request_code = :requestCode " +
        "  AND f.dtype = 'RequestFile' " +
        "  AND m.name IN ( " +
        "    'Sum. area Propionyl N-term', " +
        "    'Sum. area not Propionyl N-term' " +
        "  ) " +
        "ORDER BY " +
        "  CASE WHEN :order = 'filename' THEN f.filename END ASC, " +
        "  CASE WHEN :order = 'date' THEN f.creation_date END ASC, " +
        "  CASE " +
        "    WHEN m.name = 'Sum. area Propionyl N-term' THEN 1 " +
        "    WHEN m.name = 'Sum. area not Propionyl N-term' THEN 2 " +
        "    ELSE 3 " +
        "  END ASC",
        nativeQuery = true)
    List<ChartSeriesDataPointProjection> findPercentagePropionylStackedByRequestCode(
            @Param("requestCode") String requestCode,
            @Param("order") String order
    );

        @Query(value =
        "SELECT " +
        "  f.filename AS label, " +
        "  m.name AS series, " +
        "  mf.value AS value, " +
        "  f.checksum AS checksum, " +
        "  CAST(f.creation_date AS CHAR) AS creationDate " +
        "FROM file f " +
        "JOIN modification_file mf ON mf.file_id = f.id " +
        "JOIN modification m ON m.id = mf.modification_id " +
        "WHERE f.request_code = :requestCode " +
        "  AND f.dtype = 'RequestFile' " +
        "  AND m.name IN ( " +
        "    'Sum. area PIC precursors N-term', " +
        "    'Sum. area not PIC precursors N-term' " +
        "  ) " +
        "ORDER BY " +
        "  CASE WHEN :order = 'filename' THEN f.filename END ASC, " +
        "  CASE WHEN :order = 'date' THEN f.creation_date END ASC, " +
        "  CASE " +
        "    WHEN m.name = 'Sum. area PIC precursors N-term' THEN 1 " +
        "    WHEN m.name = 'Sum. area not PIC precursors N-term' THEN 2 " +
        "    ELSE 3 " +
        "  END ASC",
        nativeQuery = true)
    List<ChartSeriesDataPointProjection> findPercentagePicStackedByRequestCode(
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
            "  CASE WHEN :order = 'date' THEN f.creation_date END ASC, " +
            "  CASE " +
            "    WHEN :dataSourceKey = 'missed_cleavages' AND cs.abbreviated = '2' THEN 1 " +
            "    WHEN :dataSourceKey = 'missed_cleavages' AND cs.abbreviated = '1' THEN 2 " +
            "    WHEN :dataSourceKey = 'missed_cleavages' AND cs.abbreviated = '0' THEN 3 " +
            "    WHEN :dataSourceKey = 'precursors_by_charge' AND cs.abbreviated = '+4' THEN 1 " +
            "    WHEN :dataSourceKey = 'precursors_by_charge' AND cs.abbreviated = '+3' THEN 2 " +
            "    WHEN :dataSourceKey = 'precursors_by_charge' AND cs.abbreviated = '+2' THEN 3 " +
            "    ELSE 99 " +
            "  END ASC, " +
            "  cs.abbreviated ASC",
            nativeQuery = true)
    List<ChartSeriesDataPointProjection> findStackedChartDataByContextSourceGroup(
            @Param("dataSourceKey") String dataSourceKey,
            @Param("requestCode") String requestCode,
            @Param("order") String order
    );

    @Query(value =
            "SELECT " +
            "  f.filename AS label, " +
            "  m.name AS series, " +
            "  mf.value AS value, " +
            "  f.checksum AS checksum, " +
            "  CAST(f.creation_date AS CHAR) AS creationDate " +
            "FROM file f " +
            "JOIN modification_file mf " +
            "  ON mf.file_id = f.id " +
            "JOIN modification m " +
            "  ON m.id = mf.modification_id " +
            "WHERE f.request_code = :requestCode " +
            "  AND f.dtype = 'RequestFile' " +
            "  AND m.type = :modificationType " +
            "ORDER BY " +
            "  CASE WHEN :order = 'filename' THEN f.filename END ASC, " +
            "  CASE WHEN :order = 'date' THEN f.creation_date END ASC, " +
            "  m.id DESC",
            nativeQuery = true)
    List<ChartSeriesDataPointProjection> findModificationStackedByTypeAndRequestCode(
            @Param("requestCode") String requestCode,
            @Param("modificationType") String modificationType,
            @Param("order") String order
    );

    @Query(value =
            "SELECT " +
            "  f.filename AS label, " +
            "  m.name AS series, " +
            "  mf.value AS value, " +
            "  f.checksum AS checksum, " +
            "  CAST(f.creation_date AS CHAR) AS creationDate " +
            "FROM file f " +
            "JOIN modification_file mf " +
            "  ON mf.file_id = f.id " +
            "JOIN modification m " +
            "  ON m.id = mf.modification_id " +
            "WHERE f.request_code = :requestCode " +
            "  AND f.dtype = 'RequestFile' " +
            "  AND m.type = 'total-numbers' " +
            "ORDER BY " +
            "  CASE WHEN :order = 'filename' THEN f.filename END ASC, " +
            "  CASE WHEN :order = 'date' THEN f.creation_date END ASC, " +
            "  m.name ASC",
            nativeQuery = true)
    List<ChartSeriesDataPointProjection> findModificationSitesByRequestCode(
            @Param("requestCode") String requestCode,
            @Param("order") String order
    );

}