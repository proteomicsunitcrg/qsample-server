UPDATE application_chart_configs polymer_config
JOIN chart_definitions polymer_chart
  ON polymer_chart.id = polymer_config.chart_id
JOIN (
  SELECT
    ac.application_id,
    MAX(ac.order_index) + 1 AS next_order_index
  FROM application_chart_configs ac
  JOIN chart_definitions cd
    ON cd.id = ac.chart_id
  WHERE ac.is_enabled = 1
    AND ac.order_index < 999
    AND cd.name <> 'polymer_contaminants'
  GROUP BY ac.application_id
) next_order
  ON next_order.application_id = polymer_config.application_id
SET polymer_config.order_index = next_order.next_order_index
WHERE polymer_chart.name = 'polymer_contaminants'
  AND polymer_config.is_enabled = 1
  AND polymer_config.order_index < 999;
