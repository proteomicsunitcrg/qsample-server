-- Default QSample chart visibility for all applications.
-- All charts remain configured, but only the core default charts are enabled.

UPDATE application_chart_configs
SET
    is_enabled = FALSE,
    order_index = 999;

UPDATE application_chart_configs acc
JOIN chart_definitions cd
    ON acc.chart_id = cd.id
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