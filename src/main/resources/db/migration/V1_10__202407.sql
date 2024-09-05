CREATE TABLE IF NOT EXISTS `modification_file_seq` (
  `next_val` bigint DEFAULT NULL
);

SELECT @last_id := MAX(id) FROM modification_file;

INSERT INTO modification_file_seq (next_val)
SELECT @last_id + 1
WHERE NOT EXISTS (SELECT 1 FROM modification_file_seq);
