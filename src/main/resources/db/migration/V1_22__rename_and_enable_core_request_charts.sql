UPDATE chart_definitions
SET name = 'identified_protein_groups'
WHERE name = 'plot_1';

UPDATE chart_definitions
SET name = 'identified_peptides'
WHERE name = 'plot_3';

UPDATE chart_definitions
SET name = 'percentage_propionyl'
WHERE name = 'plot_4';

UPDATE chart_definitions
SET name = 'percentage_pic'
WHERE name = 'plot_5';

UPDATE chart_definitions
SET name = 'modification_sites'
WHERE name = 'plot_6';

UPDATE chart_definitions
SET name = 'modified_peptides'
WHERE name = 'plot_7';

UPDATE chart_page_assignments cpa
JOIN chart_definitions cd ON cd.id = cpa.chart_id
SET cpa.is_visible = FALSE
WHERE cd.name IN (
  'request_status_chart',
  'percentage_propionyl',
  'percentage_pic',
  'modification_sites',
  'modified_peptides'
);

UPDATE chart_page_assignments cpa
JOIN chart_definitions cd ON cd.id = cpa.chart_id
SET cpa.is_visible = TRUE
WHERE cd.name IN (
  'identified_protein_groups',
  'identified_peptides',
  'sum_total_tic',
  'missed_cleavages',
  'precursors_by_charge',
  'secondary_reactions'
);