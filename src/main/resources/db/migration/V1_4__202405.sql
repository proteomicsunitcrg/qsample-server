update `context_source` set abbreviated="Total number of phospho sites", name="Total number of phospho sites" where id=24;
insert ignore into `context_source` (id, abbreviated, api_key, charge, mz, name, trace_color_id) values (25,"Total number of phospho peptides","e01c53fd-7f11-4513-8e0b-2be6bcee11be",NULL,NULL,"Total number of phospho peptides",1);
update `plot` set name='Number of modification sites' where id=6;
insert ignore into `plot` (id, api_key, param_id, name) values( 7, '66bdbd2e-cd14-4895-b960-468f33a6e379', 1, "Number of modified peptides");
insert ignore into `plot_context_source` (plot_id, context_source_id) values(7,25);

-- ALTER TABLE `wetlab_plot` ADD CONSTRAINT wetlab_plot_key PRIMARY KEY (wet_lab_id,plot_id);
SET @dbname = DATABASE();
SET @tablename = "wetlab_plot";
SET @columnname1 = "wet_lab_id";
SET @columnname2 = "plot_id";
SET @keyname = "wetlab_plot_key";
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


insert ignore into `wetlab_plot` (wet_lab_id,plot_id) values(4,7);
INSERT ignore INTO `file` (dtype, id, checksum, creation_date, filename, wet_lab_type, request_code, file_info_id, replicate, week, year) values ("RequestFile", 3352, "37e94055f16898f503b6203c0f25fcb0", DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY), "2021LT001_TMT_TEST.raw", NULL, "2021LT001", 606, NULL, NULL, NULL);
INSERT ignore INTO `file` (dtype, id, checksum, creation_date, filename, wet_lab_type, request_code, file_info_id, replicate, week, year) values("WetLabFile", 3353, "72dbef3bf2a9b20ec3fe3b80621d673f", DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY), "20220329_QCPL_W23_R1_test.raw", 4, NULL, NULL, 1, 23, 2022);
INSERT ignore INTO `data` VALUES (1,3352,1,375,'OK',375,24894,NULL),(1,3353,1,1188,'OK',1188,24905,NULL),(2,3352,1,543,'OK',543,24895,NULL),(2,3353,1,2199,'OK',2199,24906,NULL),(3,3352,1,459,'OK',459,24896,NULL),(4,3352,1,81,'OK',81,24897,NULL),(5,3352,1,3,'OK',3,24898,NULL),(7,3352,1,2471540000000,'OK',2471540000000,24899,NULL),(19,3352,1,23394900000000,'OK',23394900000000,24900,NULL),(20,3352,1,496,'OK',496,24901,NULL),(21,3352,1,32,'OK',32,24902,NULL),(22,3352,1,12,'OK',12,24903,NULL),(23,3352,1,3,'OK',3,24904,NULL),(24,3353,1,2567,'OK',2567,24907,NULL),(25,3353,1,2035,'OK',2035,24908,NULL);
