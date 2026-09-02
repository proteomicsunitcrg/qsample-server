INSERT IGNORE INTO wetlab_plot (wet_lab_id, plot_id)
SELECT w.id, p.id FROM wetlab w, plot p
WHERE w.api_key = '98996213-f039-4d49-947e-791f360cf554' AND p.api_key = '5008da3a-dbcd-49c3-a008-db34c4b0bb39';

INSERT IGNORE INTO wetlab_plot (wet_lab_id, plot_id)
SELECT w.id, p.id FROM wetlab w, plot p
WHERE w.api_key = '98996213-f039-4d49-947e-791f360cf554' AND p.api_key = 'aa7c6f75-0442-4e66-a8fd-1e564831c6da';

INSERT INTO wetlab_plot_configs (wetlab_id, plot_id, is_enabled, order_index)
SELECT w.id, p.id, 1, 1 FROM wetlab w, plot p
WHERE w.api_key = '98996213-f039-4d49-947e-791f360cf554' AND p.api_key = '5008da3a-dbcd-49c3-a008-db34c4b0bb39';

INSERT INTO wetlab_plot_configs (wetlab_id, plot_id, is_enabled, order_index)
SELECT w.id, p.id, 1, 2 FROM wetlab w, plot p
WHERE w.api_key = '98996213-f039-4d49-947e-791f360cf554' AND p.api_key = 'aa7c6f75-0442-4e66-a8fd-1e564831c6da';

INSERT INTO wetlab_chart_configs (wetlab_id, chart_id, is_enabled, order_index)
SELECT w.id, c.id, 1, 1 FROM wetlab w, chart_definitions c
WHERE w.api_key = '98996213-f039-4d49-947e-791f360cf554' AND c.name = 'identified_protein_groups';

INSERT INTO wetlab_chart_configs (wetlab_id, chart_id, is_enabled, order_index)
SELECT w.id, c.id, 1, 2 FROM wetlab w, chart_definitions c
WHERE w.api_key = '98996213-f039-4d49-947e-791f360cf554' AND c.name = 'identified_peptides';
