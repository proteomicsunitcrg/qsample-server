-- Seed missing Secondary reactions chart definition.
-- Some restored databases may have the chart context source but not the chart definition.

INSERT INTO chart_definitions (
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
SELECT
    'secondary_reactions',
    'Secondary reactions',
    'Percentage of PSMs assigned to secondary reactions',
    'bar',
    'plotly',
    'secondary_reactions',
    TRUE,
    NULL,
    'stacked_context_source'
WHERE NOT EXISTS (
    SELECT 1
    FROM chart_definitions
    WHERE name = 'secondary_reactions'
);

INSERT INTO chart_page_assignments (
    chart_id,
    page_name,
    display_order,
    is_visible
)
SELECT
    cd.id,
    'request_details',
    8,
    TRUE
FROM chart_definitions cd
WHERE cd.name = 'secondary_reactions'
  AND NOT EXISTS (
      SELECT 1
      FROM chart_page_assignments cpa
      WHERE cpa.chart_id = cd.id
        AND cpa.page_name = 'request_details'
  );

INSERT INTO application_chart_configs (
    application_id,
    chart_id,
    is_enabled,
    order_index
)
SELECT
    a.id,
    cd.id,
    FALSE,
    999
FROM application a
JOIN chart_definitions cd
    ON cd.name = 'secondary_reactions'
WHERE NOT EXISTS (
    SELECT 1
    FROM application_chart_configs acc
    WHERE acc.application_id = a.id
      AND acc.chart_id = cd.id
);
