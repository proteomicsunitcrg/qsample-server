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
  'sum_total_tic',
  'Sum of Total TIC',
  'Sum of Total TIC per sample',
  'bar',
  'plotly',
  'sum_total_tic',
  TRUE,
  'show_identified_peptides_plot',
  'context_source_group'
),
(
  'missed_cleavages',
  'Peptides grouped by number of missed cleavages',
  'Peptides grouped by number of missed cleavages',
  'bar',
  'plotly',
  'missed_cleavages',
  TRUE,
  'show_identified_peptides_plot',
  'context_source_group'
),
(
  'precursors_by_charge',
  'Precursors grouped by charge',
  'Precursors grouped by charge',
  'bar',
  'plotly',
  'precursors_by_charge',
  TRUE,
  'show_charges_plot',
  'context_source_group'
);

INSERT IGNORE INTO chart_page_assignments
(chart_id, page_name, display_order, is_visible)
SELECT id, 'request_details', 10, TRUE
FROM chart_definitions
WHERE name = 'sum_total_tic';

INSERT IGNORE INTO chart_page_assignments
(chart_id, page_name, display_order, is_visible)
SELECT id, 'request_details', 20, TRUE
FROM chart_definitions
WHERE name = 'missed_cleavages';

INSERT IGNORE INTO chart_page_assignments
(chart_id, page_name, display_order, is_visible)
SELECT id, 'request_details', 30, TRUE
FROM chart_definitions
WHERE name = 'precursors_by_charge';

INSERT IGNORE INTO chart_context_sources (chart_id, context_source_id)
SELECT cd.id, cs.id
FROM chart_definitions cd
JOIN context_source cs
WHERE cd.name = 'sum_total_tic'
AND cs.id IN (19);

INSERT IGNORE INTO chart_context_sources (chart_id, context_source_id)
SELECT cd.id, cs.id
FROM chart_definitions cd
JOIN context_source cs
WHERE cd.name = 'missed_cleavages'
AND cs.id IN (20, 21, 22, 23);

INSERT IGNORE INTO chart_context_sources (chart_id, context_source_id)
SELECT cd.id, cs.id
FROM chart_definitions cd
JOIN context_source cs
WHERE cd.name = 'precursors_by_charge'
AND cs.id IN (3, 4, 5);