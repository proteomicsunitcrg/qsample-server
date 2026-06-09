INSERT IGNORE INTO chart_context_sources (chart_id, context_source_id)
SELECT
    cd.id,
    cs.id
FROM chart_definitions cd
JOIN context_source cs
WHERE cd.name = 'secondary_reactions'
AND cs.name IN (
    'Formylation',
    'Carbamyl',
    'Oxidation',
    'Ammonia loss',
    'Acetyl',
    'Deamidation',
    'Didehydrobutyrine/Water loss'
);
