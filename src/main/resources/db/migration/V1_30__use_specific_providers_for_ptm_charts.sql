UPDATE chart_definitions
SET data_source_key = 'modified_peptides',
    provider_type = 'file_info_column'
WHERE name = 'modified_peptides';

UPDATE chart_definitions
SET data_source_key = 'percentage_propionyl',
    provider_type = 'modification_ratio_by_file'
WHERE name = 'percentage_propionyl';

UPDATE chart_definitions
SET data_source_key = 'percentage_pic',
    provider_type = 'modification_ratio_by_file'
WHERE name = 'percentage_pic';