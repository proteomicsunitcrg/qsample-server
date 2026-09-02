DELETE FROM wetlab_chart_configs WHERE chart_id = (SELECT id FROM chart_definitions WHERE name = 'esteticamenti');
DELETE FROM chart_page_assignments WHERE chart_id = (SELECT id FROM chart_definitions WHERE name = 'esteticamenti');
DELETE FROM chart_parameters WHERE chart_id = (SELECT id FROM chart_definitions WHERE name = 'esteticamenti');
DELETE FROM chart_definitions WHERE name = 'esteticamenti';
