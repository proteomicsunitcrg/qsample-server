INSERT INTO application_chart_configs (
    application_id,
    chart_id,
    is_enabled,
    order_index
)
SELECT
    a.id AS application_id,
    cd.id AS chart_id,
    TRUE AS is_enabled,
    COALESCE(cpa.display_order, cd.id) AS order_index
FROM application a
CROSS JOIN chart_definitions cd
LEFT JOIN chart_page_assignments cpa
    ON cpa.chart_id = cd.id
    AND cpa.page_name = 'request_details'
WHERE cd.is_active = TRUE
  AND NOT EXISTS (
      SELECT 1
      FROM application_chart_configs acc
      WHERE acc.application_id = a.id
        AND acc.chart_id = cd.id
  );