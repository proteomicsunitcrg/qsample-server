INSERT INTO chart_parameters
(chart_id, param_key, param_value, param_type, description)
SELECT cd.id,
       'yAxisFormat',
       'scientific',
       'string',
       'Use scientific notation for the Y axis by default'
FROM chart_definitions cd
WHERE cd.name = 'sum_total_tic'
ON DUPLICATE KEY UPDATE
  param_value = VALUES(param_value),
  param_type = VALUES(param_type),
  description = VALUES(description);
