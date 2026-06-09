-- Make dynamic request detail charts available to the ApplicationChartConfig system.
-- The final per-application visibility is controlled by application_chart_configs.

UPDATE chart_page_assignments cpa
JOIN chart_definitions cd
    ON cd.id = cpa.chart_id
SET cpa.is_visible = TRUE
WHERE cpa.page_name = 'request_details'
  AND cd.name IN (
      'identified_protein_groups',
      'identified_peptides',
      'percentage_propionyl',
      'percentage_pic',
      'modification_sites',
      'modified_peptides',
      'secondary_reactions',
      'sum_total_tic',
      'missed_cleavages',
      'precursors_by_charge'
  );