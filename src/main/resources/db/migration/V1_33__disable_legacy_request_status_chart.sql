-- Hide legacy Request Status chart from dynamic application chart configuration.
-- It was originally seeded before the application chart config system and should
-- not appear as an assignable request detail chart.

UPDATE chart_definitions
SET is_active = FALSE
WHERE name = 'request_status_chart';

DELETE acc
FROM application_chart_configs acc
JOIN chart_definitions cd
    ON cd.id = acc.chart_id
WHERE cd.name = 'request_status_chart';
