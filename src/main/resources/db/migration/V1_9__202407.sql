-- ALTER TABLE `user` ADD CONSTRAINT UK_username UNIQUE (username)
SET @dbname = DATABASE();
SET @tablename = "favorite_request_users";
SET @columnname1 = "favorite_request_id";
SET @columnname2 = "user_id";
SET @keyname = "UK_fav_user";
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE
      (table_name = @tablename)
      AND (table_schema = @dbname)
      AND (constraint_name = @keyname)
  ) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE ", @tablename, " ADD CONSTRAINT ", @keyname, " UNIQUE (", @columnname1, ", ", @columnname2, ");" )
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

