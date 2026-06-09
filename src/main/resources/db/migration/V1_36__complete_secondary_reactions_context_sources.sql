-- Complete Secondary reactions context source mappings using the context sources
-- currently present in production.

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
    'Amidation',
    'Isotopic peak error',
    'Didehydrobutyrine/Water loss',
    'Methyl',
    'Carbamidomethyl/Addition of G'
);
