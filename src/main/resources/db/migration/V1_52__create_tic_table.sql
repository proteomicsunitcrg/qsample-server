--
-- Full Total Ion Current time series per file (one point per spectrum,
-- extracted by Atlas bin/extract_tic_series.awk from the mzML):
-- [[rt_ms, msLevel, tic], ...] stored as compact JSON text.
--
-- Mirrors the QCloud2 tic table (V13__tic_file.sql). The pipeline uploads
-- the compressed form ("gz1:" + base64(gzip(JSON))); the server validates
-- and stores the DECODED JSON text, so the column is directly inspectable
-- and the per-request chart endpoint can parse it without per-read gzip.
--
CREATE TABLE `tic` (
  `file_id` bigint(20) NOT NULL,
  `tic` mediumtext,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`file_id`),
  CONSTRAINT `FK_tic_file` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
