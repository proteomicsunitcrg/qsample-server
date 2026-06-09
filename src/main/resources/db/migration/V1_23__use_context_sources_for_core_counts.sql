UPDATE chart_definitions
SET
  name = 'identified_protein_groups',
  data_source_key = 'identified_protein_groups',
  provider_type = 'context_source_group_by_file'
WHERE name = 'plot_1';

UPDATE chart_definitions
SET
  name = 'identified_peptides',
  data_source_key = 'identified_peptides',
  provider_type = 'context_source_group_by_file'
WHERE name = 'plot_3';

INSERT IGNORE INTO chart_context_sources (chart_id, context_source_id)
SELECT cd.id, cs.id
FROM chart_definitions cd
JOIN context_source cs
WHERE cd.name = 'identified_protein_groups'
  AND cs.id IN (1);

INSERT IGNORE INTO chart_context_sources (chart_id, context_source_id)
SELECT cd.id, cs.id
FROM chart_definitions cd
JOIN context_source cs
WHERE cd.name = 'identified_peptides'
  AND cs.id IN (2);