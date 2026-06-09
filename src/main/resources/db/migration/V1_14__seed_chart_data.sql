INSERT INTO chart_definitions
(name, title, description, chart_type, library, data_source_key, is_active)
VALUES
(
  'request_status_chart',
  'Request Status',
  'Request status distribution',
  'bar',
  'plotly',
  'request_status',
  TRUE
);

INSERT INTO chart_parameters
(chart_id, param_key, param_value, param_type, description)
VALUES
(
  (SELECT id FROM chart_definitions WHERE name = 'request_status_chart'),
  'height',
  '400',
  'number',
  'Chart height'
);

INSERT INTO chart_page_assignments
(chart_id, page_name, display_order, is_visible)
VALUES
(
  (SELECT id FROM chart_definitions WHERE name = 'request_status_chart'),
  'request_details',
  1,
  TRUE
);
