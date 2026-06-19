ALTER TABLE chart_definitions
ADD COLUMN chart_mode VARCHAR(30) NOT NULL DEFAULT 'SIMPLE_BAR' AFTER chart_type;

-- Backfill charts currently treated as stacked
UPDATE chart_definitions
SET chart_mode = 'STACKED_BAR'
WHERE data_source_key IN (
  'secondary_reactions',
  'modification_sites',
  'modified_peptides',
  'percentage_propionyl',
  'percentage_pic',
  'missed_cleavages',
  'precursors_by_charge',
  'polymer_contaminants'
)
OR provider_type IN (
  'file_info_stacked_by_file',
  'modification_stacked_by_file'
);
