-- Seed missing context source mappings for Secondary reactions.
-- This is needed for restored databases where the chart definition was missing
-- when V1_19 originally ran.

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
