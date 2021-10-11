alter table application_constraint add `show_charges_plot` bit(1) NOT NULL DEFAULT b'0';
update application_constraint set show_charges_plot = true where id = 1;


insert into context_source values (3, "+2", "apiKey3", null, null, "Charge +2", 1);

insert into context_source values (4, "+3", "apiKey4", null, null, "Charge +3", 1);

insert into context_source values (5, "+4", "apiKey5", null, null, "Charge +4", 1);


alter table modification add `type` varchar(50) NOT NULL;
update modification set `type` = "total-numbers";
