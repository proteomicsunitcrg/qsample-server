-- ALTER table `user` add column `groupp` varchar(255) default NULL;
SET @dbname = DATABASE();
SET @tablename = "wet_lab_seq";
SET @tablenamenew = "wetlab_seq";
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE
      (table_name = @tablename)
      AND (table_schema = @dbname)
  ) > 0,
  CONCAT("RENAME TABLE ", @tablename, " TO ", @tablenamenew, " ;"),
  "SELECT 1"
));
PREPARE renameIfExists FROM @preparedStatement;
EXECUTE renameIfExists;
DEALLOCATE PREPARE renameIfExists;
