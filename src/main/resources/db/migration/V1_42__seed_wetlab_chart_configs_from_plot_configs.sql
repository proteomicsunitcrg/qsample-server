INSERT INTO chart_definitions (
    name,
    title,
    description,
    chart_type,
    chart_mode,
    library,
    data_source_key,
    is_active
)
SELECT
    plot_seed.generated_chart_name AS name,
    plot_seed.plot_name AS title,
    '' AS description,
    'bar' AS chart_type,
    'SIMPLE_BAR' AS chart_mode,
    'plotly' AS library,
    plot_seed.api_key AS data_source_key,
    1 AS is_active
FROM (
    SELECT
        p.id AS plot_id,
        p.name AS plot_name,
        p.api_key,
        LOWER(REPLACE(REPLACE(REPLACE(p.name, ' ', '_'), '-', '_'), '/', '_')) AS generated_chart_name
    FROM wetlab_plot_configs wpc
    JOIN plot p
        ON p.id = wpc.plot_id
    WHERE p.name <> 'Wetlab test data source edited'
    GROUP BY p.id, p.name, p.api_key
) plot_seed
LEFT JOIN chart_definitions existing_by_key
    ON existing_by_key.data_source_key = plot_seed.api_key
LEFT JOIN chart_definitions existing_by_name
    ON existing_by_name.name = plot_seed.generated_chart_name
LEFT JOIN chart_definitions existing_by_title
    ON existing_by_title.title = plot_seed.plot_name
WHERE existing_by_key.id IS NULL
  AND existing_by_name.id IS NULL
  AND existing_by_title.id IS NULL;

INSERT IGNORE INTO wetlab_chart_configs (
    wetlab_id,
    chart_id,
    is_enabled,
    order_index
)
SELECT
    wpc.wetlab_id,
    COALESCE(chart_by_key.id, chart_by_name.id, chart_by_title.id) AS chart_id,
    wpc.is_enabled,
    wpc.order_index
FROM wetlab_plot_configs wpc
JOIN plot p
    ON p.id = wpc.plot_id
LEFT JOIN chart_definitions chart_by_key
    ON chart_by_key.data_source_key = p.api_key
LEFT JOIN chart_definitions chart_by_name
    ON chart_by_name.name = LOWER(REPLACE(REPLACE(REPLACE(p.name, ' ', '_'), '-', '_'), '/', '_'))
LEFT JOIN chart_definitions chart_by_title
    ON chart_by_title.title = p.name
WHERE p.name <> 'Wetlab test data source edited'
  AND COALESCE(chart_by_key.id, chart_by_name.id, chart_by_title.id) IS NOT NULL;
