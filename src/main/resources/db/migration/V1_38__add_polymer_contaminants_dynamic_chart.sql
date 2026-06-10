-- Add Polymer contaminants (%TIC) as a dynamic stacked chart.

INSERT IGNORE INTO chart_definitions
(
  name,
  title,
  description,
  chart_type,
  library,
  data_source_key,
  is_active,
  constraint_flag,
  provider_type
)
VALUES
(
  'polymer_contaminants',
  'Polymer contaminants (%TIC)',
  'Polymer contaminants (%TIC)',
  'bar',
  'plotly',
  'polymer_contaminants',
  TRUE,
  'show_identified_peptides_plot',
  'modification_stacked_by_type'
);

INSERT IGNORE INTO chart_page_assignments
(chart_id, page_name, display_order, is_visible)
SELECT id, 'request_details', 40, TRUE
FROM chart_definitions
WHERE name = 'polymer_contaminants';

INSERT IGNORE INTO application_chart_configs
(application_id, chart_id, is_enabled, order_index)
SELECT a.id, cd.id, TRUE, 6
FROM application a
JOIN chart_definitions cd
WHERE cd.name = 'polymer_contaminants';

-- Keep existing core chart order explicit.
UPDATE application_chart_configs acc
JOIN chart_definitions cd
    ON cd.id = acc.chart_id
SET
    acc.is_enabled = TRUE,
    acc.order_index = CASE cd.name
        WHEN 'identified_protein_groups' THEN 1
        WHEN 'identified_peptides' THEN 2
        WHEN 'sum_total_tic' THEN 3
        WHEN 'missed_cleavages' THEN 4
        WHEN 'precursors_by_charge' THEN 5
        WHEN 'polymer_contaminants' THEN 6
        ELSE acc.order_index
    END
WHERE cd.name IN (
    'identified_protein_groups',
    'identified_peptides',
    'sum_total_tic',
    'missed_cleavages',
    'precursors_by_charge',
    'polymer_contaminants'
);
