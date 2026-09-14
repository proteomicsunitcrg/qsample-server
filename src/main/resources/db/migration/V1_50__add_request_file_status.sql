--
-- Tracks the received/processing/processed/error lifecycle of a RequestFile
-- as reported live by the Atlas pipeline (qsample-server#192), mirroring
-- qcloud2-server's pipeline_file table. Decoupled from `file` (joined only
-- by checksum at the application layer, no FK) since a status row can be
-- created before the corresponding `file` row exists.
--

CREATE TABLE `request_file_status` (
  `id` bigint(20) NOT NULL,
  `checksum` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `received_date` datetime DEFAULT NULL,
  `processing_started_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `database_name` varchar(255) DEFAULT NULL,
  `size_mb` double DEFAULT NULL,
  `raw_summary` longtext,
  `process_name` varchar(255) DEFAULT NULL,
  `error_reason` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_request_file_status_checksum` (`checksum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `request_file_status_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `request_file_status_seq` VALUES (1);
