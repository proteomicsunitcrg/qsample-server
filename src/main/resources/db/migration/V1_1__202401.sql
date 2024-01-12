-- Add new column groupp to user table
ALTER table `user` add column `groupp` varchar(255) default NULL;

-- Modify value of modification_file to double
ALTER table `modification_file` modify column `value` double default NULL;
