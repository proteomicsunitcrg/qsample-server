--
-- Split off from database_name: a short OK/not-OK flag so the UI can show
-- "(OK)" or point to the Reason block, instead of cramming the long database
-- diagnostic text (e.g. "PRESENT BUT NOT INDEXED ON MASCOT - ...") next to
-- the database name itself. That detail text now goes into error_reason.
--
ALTER TABLE `request_file_status` ADD COLUMN `database_status` VARCHAR(20) DEFAULT NULL AFTER `database_name`;
