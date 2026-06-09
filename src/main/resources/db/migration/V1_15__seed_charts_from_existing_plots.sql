INSERT IGNORE INTO chart_definitions
(name, title, description, chart_type, library, data_source_key, is_active)
SELECT
  CONCAT('plot_', id),
  name,
  CONCAT('Dynamic chart for ', name),
  'bar',
  'plotly',
  api_key,
  TRUE
FROM plot
WHERE api_key IS NOT NULL;

INSERT IGNORE INTO chart_page_assignments
(chart_id, page_name, display_order, is_visible)
SELECT
  cd.id,
  'request_details',
  p.id,
  TRUE
FROM chart_definitions cd
JOIN plot p ON cd.data_source_key = p.api_key;
