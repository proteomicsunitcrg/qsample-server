-- ALTER TABLE `context_source` ADD CONSTRAINT UK_name UNIQUE (name)
SET @dbname = DATABASE();
SET @tablename = "context_source";
SET @columnname = "name";
SET @keyname = "UK_name";
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE
      (table_name = @tablename)
      AND (table_schema = @dbname)
      AND (constraint_name = @keyname)
  ) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE ", @tablename, " ADD CONSTRAINT ", @keyname, " UNIQUE (", @columnname, ");" )
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;


SELECT @lcsid := MAX(id) FROM context_source;

insert ignore into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (@lcsid + 1,"Formylation","c02a6343-7f67-4624-bfb4-46bbf42841cb",NULL,NULL,"Formylation",1);
insert ignore into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (@lcsid + 2,"Carbamyl","84dfec61-02b1-4e02-bab0-b70d7bc61d5c",NULL,NULL,"Carbamyl",1);
insert ignore into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (@lcsid + 3,"Oxidation","1efc7682-3065-43c7-820e-2f72062308b8",NULL,NULL,"Oxidation",1);
insert ignore into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (@lcsid + 4,"Ammonia loss","e567294f-89ca-44e8-82f2-7f3efccfc0a5",NULL,NULL,"Ammonia loss",1);
insert ignore into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (@lcsid + 5,"Acetyl","23edd582-90b0-40cf-ac18-2e82e2e69020",NULL,NULL,"Acetyl",1);
insert ignore into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (@lcsid + 6,"Deamidation","c60eda81-fa2d-4fb8-8e64-ed6a35b9c8b1",NULL,NULL,"Deamidation",1);
insert ignore into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (@lcsid + 7,"Amidation","4c65ea89-0572-4d2f-b942-d9e39ee89f44",NULL,NULL,"Amidation",1);
insert ignore into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (@lcsid + 8,"Isotopic peak error","f5162bac-eeb7-40b8-90cd-d99e39850bf2",NULL,NULL,"Isotopic peak error",1);
insert ignore into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (@lcsid + 9,"Didehydrobutyrine/Water loss","7060666b-a06d-44dd-9d6c-47d11c0758df",NULL,NULL,"Didehydrobutyrine/Water loss",1);
insert ignore into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (@lcsid + 10,"Methyl","3f25cf4f-0306-4897-a839-2b8fd15f7365",NULL,NULL,"Methyl",1);
insert ignore into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (@lcsid + 11,"Carbamidomethyl/Addition of G","2ad85cf9-debb-4ffb-b99d-ab22536b6053",NULL,NULL,"Carbamidomethyl/Addition of G",1);

SELECT @nlcsid := MAX(id) FROM context_source;
TRUNCATE table context_source_seq;
INSERT INTO context_source_seq (next_val) values ( @nlcsid + 1 );


SELECT @mid := MAX(id) FROM modification;

insert ignore into modification (id, name, type) values (@mid + 1, "Formylation", "sec_react");
insert ignore into modification (id, name, type) values (@mid + 2, "Carbamyl", "sec_react");
insert ignore into modification (id, name, type) values (@mid + 3, "Oxidation", "sec_react");
insert ignore into modification (id, name, type) values (@mid + 4, "Ammonia loss", "sec_react");
insert ignore into modification (id, name, type) values (@mid + 5, "Acetyl", "sec_react");
insert ignore into modification (id, name, type) values (@mid + 6, "Deamidation", "sec_react");
insert ignore into modification (id, name, type) values (@mid + 7, "Amidation", "sec_react");
insert ignore into modification (id, name, type) values (@mid + 8, "Isotopic peak error", "sec_react");
insert ignore into modification (id, name, type) values (@mid + 9, "Didehydrobutyrine/Water loss", "sec_react");
insert ignore into modification (id, name, type) values (@mid + 10, "Methyl", "sec_react");
insert ignore into modification (id, name, type) values (@mid + 11, "Carbamidomethyl/Addition of G", "sec_react");

SELECT @nmid := MAX(id) FROM modification;
TRUNCATE table modification_seq;
INSERT INTO modification_seq (next_val) values ( @nmid + 1 );

SELECT @mfid := MAX(id) FROM modification_file;

insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 1, 0.656, 3359, @mid + 1);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 2, 0.167, 4836, @mid + 1);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 3, 0.049, 4837, @mid + 1);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 4, 0.108, 4838, @mid + 1);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 5, 1.133, 4836, @mid + 2);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 6, 1.063, 4837, @mid + 2);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 7, 1.54, 4838, @mid + 2);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 8, 8.882, 3359, @mid + 3);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 9, 0.04, 4836, @mid + 3);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 10, 0.039, 4837, @mid + 3);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 11, 0.065, 4838, @mid + 3);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 12, 1.18, 3359, @mid + 4);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 13, 0.18, 4836, @mid + 4);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 14, 0.219, 4837, @mid + 4);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 15, 0.371, 4838, @mid + 4);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 16, 0.047, 4836, @mid + 5);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 17, 0.036, 4837, @mid + 5);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 18, 0.051, 4838, @mid + 5);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 19, 3.147, 3359, @mid + 6);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 20, 0.167, 4836, @mid + 6);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 21, 0.111, 4837, @mid + 6);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 22, 0.239, 4838, @mid + 6);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 23, 1.508, 3359, @mid + 7);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 24, 0.593, 4836, @mid + 7);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 25, 0.71, 4837, @mid + 7);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 26, 0.796, 4838, @mid + 7);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 27, 3.835, 3359, @mid + 8);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 28, 2.422, 4836, @mid + 8);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 29, 1.993, 4837, @mid + 8);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 30, 2.223, 4838, @mid + 8);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 31, 0.623, 3359, @mid + 9);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 32, 0.043, 4836, @mid + 9);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 33, 0.036, 4837, @mid + 9);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 34, 0.075, 4838, @mid + 9);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 35, 0.524, 3359, @mid + 10);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 36, 0.032, 4838, @mid + 10);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 37, 0.688, 3359, @mid + 11);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 38, 0.08, 4836, @mid + 11);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 39, 0.075, 4837, @mid + 11);
insert ignore into modification_file (id, value, file_id, modification_id) values (@mfid + 40, 0.137, 4838, @mid + 11);

SELECT @nmfid := MAX(id) FROM modification_file;
TRUNCATE table modification_file_seq;
INSERT INTO modification_file_seq (next_val) values ( @nmfid + 1 );


SELECT @did := MAX(id) FROM data;


insert ignore into data (context_source_id, file_id, param_id, calculated_value, non_conformity_status, value, id, std) values
(@lcsid + 1, 3359, 1, 0.656, 'OK', 0.656, @did + 1, NULL),
(@lcsid + 1, 4836, 1, 0.167, 'OK', 0.167, @did + 2, NULL),
(@lcsid + 1, 4837, 1, 0.049, 'OK', 0.049, @did + 3, NULL),
(@lcsid + 1, 4838, 1, 0.108, 'OK', 0.108, @did + 4, NULL),
(@lcsid + 2, 4836, 1, 1.133, 'OK', 1.133, @did + 5, NULL),
(@lcsid + 2, 4837, 1, 1.063, 'OK', 1.063, @did + 6, NULL),
(@lcsid + 2, 4838, 1, 1.54, 'OK', 1.54, @did + 7, NULL),
(@lcsid + 3, 3359, 1, 8.882, 'OK', 8.882, @did + 8, NULL),
(@lcsid + 3, 4836, 1, 0.04, 'OK', 0.04, @did + 9, NULL),
(@lcsid + 3, 4837, 1, 0.039, 'OK', 0.039, @did + 10, NULL),
(@lcsid + 3, 4838, 1, 0.065, 'OK', 0.065, @did + 11, NULL),
(@lcsid + 4, 3359, 1, 1.18, 'OK', 1.18, @did + 12, NULL),
(@lcsid + 4, 4836, 1, 0.18, 'OK', 0.18, @did + 13, NULL),
(@lcsid + 4, 4837, 1, 0.219, 'OK', 0.219, @did + 14, NULL),
(@lcsid + 4, 4838, 1, 0.371, 'OK', 0.371, @did + 15, NULL),
(@lcsid + 5, 4836, 1, 0.047, 'OK', 0.047, @did + 16, NULL),
(@lcsid + 5, 4837, 1, 0.036, 'OK', 0.036, @did + 17, NULL),
(@lcsid + 5, 4838, 1, 0.051, 'OK', 0.051, @did + 18, NULL),
(@lcsid + 6, 3359, 1, 3.114, 'OK', 3.114, @did + 19, NULL),
(@lcsid + 6, 4836, 1, 0.167, 'OK', 0.167, @did + 20, NULL),
(@lcsid + 6, 4837, 1, 0.111, 'OK', 0.111, @did + 21, NULL),
(@lcsid + 6, 4838, 1, 0.239, 'OK', 0.239, @did + 22, NULL),
(@lcsid + 7, 3359, 1, 1.508, 'OK', 1.508, @did + 23, NULL),
(@lcsid + 7, 4836, 1, 0.593, 'OK', 0.593, @did + 24, NULL),
(@lcsid + 7, 4837, 1, 0.71, 'OK', 0.71, @did + 25, NULL),
(@lcsid + 7, 4838, 1, 0.796, 'OK', 0.796, @did + 26, NULL),
(@lcsid + 8, 3359, 1, 3.835, 'OK', 3.835, @did + 27, NULL),
(@lcsid + 8, 4836, 1, 2.422, 'OK', 2.422, @did + 28, NULL),
(@lcsid + 8, 4837, 1, 1.993, 'OK', 1.993, @did + 29, NULL),
(@lcsid + 8, 4838, 1, 2.223, 'OK', 2.223, @did + 30, NULL),
(@lcsid + 9, 3359, 1, 0.393, 'OK', 0.393, @did + 31, NULL),
(@lcsid + 9, 4836, 1, 0.043, 'OK', 0.043, @did + 32, NULL),
(@lcsid + 9, 4837, 1, 0.036, 'OK', 0.036, @did + 33, NULL),
(@lcsid + 9, 4838, 1, 0.075, 'OK', 0.075, @did + 34, NULL),
(@lcsid + 10, 3359, 1, 0.524, 'OK', 0.524, @did + 35, NULL),
(@lcsid + 10, 4838, 1, 0.032, 'OK', 0.032, @did + 36, NULL),
(@lcsid + 11, 3359, 1, 0.688, 'OK', 0.688, @did + 37, NULL),
(@lcsid + 11, 4836, 1, 0.08, 'OK', 0.08, @did + 38, NULL),
(@lcsid + 11, 4837, 1, 0.075, 'OK', 0.075, @did + 39, NULL),
(@lcsid + 11, 4838, 1, 0.137, 'OK', 0.137, @did + 40, NULL);

SELECT @ndid := MAX(id) FROM data;
TRUNCATE table data_seq;
INSERT INTO data_seq (next_val) values ( @ndid + 1 );
