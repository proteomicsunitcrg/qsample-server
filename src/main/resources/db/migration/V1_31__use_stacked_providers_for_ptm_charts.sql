UPDATE chart_definitions
SET data_source_key = 'modified_peptides',
    provider_type = 'file_info_stacked_by_file'
WHERE name = 'modified_peptides';

UPDATE chart_definitions
SET data_source_key = 'percentage_propionyl',
    provider_type = 'modification_stacked_by_file',
    title = 'N-term Propionyl'
WHERE name = 'percentage_propionyl';

UPDATE chart_definitions
SET data_source_key = 'percentage_pic',
    provider_type = 'modification_stacked_by_file',
    title = 'N-term PIC'
WHERE name = 'percentage_pic';