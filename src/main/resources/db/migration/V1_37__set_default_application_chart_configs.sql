-- Default dynamic chart configuration by pipeline/application rules.
--
-- Base rule:
--   All applications start with the core 5 charts:
--     1 identified_protein_groups
--     2 identified_peptides
--     3 sum_total_tic
--     4 missed_cleavages
--     5 precursors_by_charge
--
-- Extra rules:
--   FragPipe applications get secondary_reactions at position 6.
--   Histone applications get percentage_propionyl and percentage_pic at positions 6 and 7.
--   PTM/SILAC/TMT non-DIA, non-histone applications get modification charts at positions 6 and 7.

-- Reset all dynamic chart configs to disabled.
UPDATE application_chart_configs
SET
    is_enabled = FALSE,
    order_index = 999;

-- Enable core charts for all applications.
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
        ELSE 999
    END
WHERE cd.name IN (
    'identified_protein_groups',
    'identified_peptides',
    'sum_total_tic',
    'missed_cleavages',
    'precursors_by_charge'
);

-- FragPipe applications: enable secondary reactions.
UPDATE application_chart_configs acc
JOIN chart_definitions cd
    ON cd.id = acc.chart_id
SET
    acc.is_enabled = TRUE,
    acc.order_index = 6
WHERE cd.name = 'secondary_reactions'
  AND acc.application_id IN (
      1,  -- Identification of a protein in a gel band
      2,  -- Identification of an overexpressed protein
      3,  -- AP-MS - A. Pilot experiment
      4,  -- AP-MS - B. Measurement
      5,  -- Chromatin-bound proteome
      7,  -- Proteome label-free quantification
      9,  -- Proteome label-free quantification in mycoplasma
      21, -- PRM - A. Method development
      22, -- PRM - B. Measurement
      25, -- User tailored request
      30  -- Proteome label-free quantification (DDA)
  );

-- Histone applications: enable histone-specific charts.
UPDATE application_chart_configs acc
JOIN chart_definitions cd
    ON cd.id = acc.chart_id
SET
    acc.is_enabled = TRUE,
    acc.order_index = CASE cd.name
        WHEN 'percentage_propionyl' THEN 6
        WHEN 'percentage_pic' THEN 7
        ELSE acc.order_index
    END
WHERE cd.name IN ('percentage_propionyl', 'percentage_pic')
  AND acc.application_id IN (
      13, -- PTM histones - A. Pilot experiment
      14  -- PTM histones - B. Measurement
  );

-- PTM/SILAC/TMT non-DIA, non-histone applications: enable modification charts.
UPDATE application_chart_configs acc
JOIN chart_definitions cd
    ON cd.id = acc.chart_id
SET
    acc.is_enabled = TRUE,
    acc.order_index = CASE cd.name
        WHEN 'modification_sites' THEN 6
        WHEN 'modified_peptides' THEN 7
        ELSE acc.order_index
    END
WHERE cd.name IN ('modification_sites', 'modified_peptides')
  AND acc.application_id IN (
      11, -- PTM purified protein - A. Pilot experiment
      12, -- PTM purified protein - B. Measurement
      17, -- SILAC phosphoproteome
      18, -- SILAC proteome
      23, -- TMT proteome
      24, -- TMT ultra deep proteome
      29, -- TMT phosphoproteome
      32, -- Phosphoproteome label-free quantification
      37  -- Phosphoproteome label-free quantification (DDA)
  );
