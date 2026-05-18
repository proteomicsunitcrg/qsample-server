ALTER TABLE chart_definitions
ADD COLUMN constraint_flag VARCHAR(255) NULL;

UPDATE chart_definitions
SET constraint_flag = 'show_identified_proteins_plot'
WHERE title = 'Number of protein groups';

UPDATE chart_definitions
SET constraint_flag = 'show_identified_peptides_plot'
WHERE title = 'Number of peptides';

UPDATE chart_definitions
SET constraint_flag = 'show_modifications_plot'
WHERE title IN (
  'Percentage Propionyl',
  'Percentage PIC',
  'Number of modification sites',
  'Number of modified peptides'
);
