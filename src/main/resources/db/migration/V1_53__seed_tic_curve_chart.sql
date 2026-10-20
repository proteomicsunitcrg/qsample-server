--
-- Seed the TIC curve chart into the request view chart mechanism
-- ("QSample chart settings").
--
-- chart_type = 'line' is rendered by the client dynamic-chart component as
-- an overlay of one XCalibur-style curve per sample of the request
-- (time in min vs relative abundance 0-100 normalized to the base peak of
-- each curve), fed by GET /api/file/tic/request/{requestCode}. The
-- data_source_key 'tic' is only a registry key; the line chart type is
-- resolved by the client and does not go through the plot/data-table
-- dispatch of the bar charts.
--
-- No per-application/wetlab config rows are seeded (same as V1_20):
-- applications without an explicit chart configuration show every visible
-- chart of the page, so the curve appears everywhere and admins can
-- disable/reorder it per application from the chart settings editor.
--
INSERT IGNORE INTO chart_definitions
(
  name,
  title,
  description,
  chart_type,
  chart_mode,
  library,
  data_source_key,
  is_active,
  constraint_flag,
  provider_type
)
VALUES
(
  'tic_series',
  'Total Ion Current (TIC curve)',
  'Full TIC time series per sample: one curve per file of the request, X time in min, Y relative abundance (0-100) normalized to the base peak of each curve',
  'line',
  'SIMPLE_BAR',
  'plotly',
  'tic',
  TRUE,
  NULL,
  'plot_api_key'
);

INSERT IGNORE INTO chart_page_assignments
(chart_id, page_name, display_order, is_visible)
SELECT id, 'request_details', 100, TRUE
FROM chart_definitions
WHERE name = 'tic_series';
