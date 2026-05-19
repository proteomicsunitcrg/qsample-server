UPDATE chart_definitions
SET provider_type = 'context_source_group_by_file'
WHERE name IN (
  'sum_total_tic',
  'missed_cleavages',
  'precursors_by_charge'
);