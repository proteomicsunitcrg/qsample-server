-- ALTER TABLE `user` ADD CONSTRAINT UK_username UNIQUE (username)
SET @dbname = DATABASE();
SET @tablename = "user";
SET @columnname = "username";
SET @keyname = "UK_username";
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE
      (table_name = @tablename)
      AND (table_schema = @dbname)
      AND (constraint_name = @keyname)
  ) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE ", @tablename, " ADD CONSTRAINT ", @keyname, " UNIQUE (", @columnname, ")"; )
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

