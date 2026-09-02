INSERT INTO wetlab (id, api_key, name, category_id)
SELECT MAX(id) + 1, '98996213-f039-4d49-947e-791f360cf554', 'Preomics digestion QC', 1
FROM wetlab;

UPDATE wetlab_seq SET next_val = (SELECT MAX(id) + 1 FROM wetlab);
