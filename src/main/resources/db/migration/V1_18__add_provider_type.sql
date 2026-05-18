ALTER TABLE chart_definitions
ADD COLUMN provider_type VARCHAR(100) DEFAULT 'plot_api_key';

UPDATE chart_definitions
SET provider_type = 'plot_api_key'
WHERE provider_type IS NULL;

UPDATE chart_definitions
SET provider_type = 'context_source_group'
WHERE data_source_key = 'secondary_reactions';
