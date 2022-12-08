create database techproed;
create table students (
id char(7),
	student_name varchar(20),
	student_surname varchar(20),
	average_not real,
	datum date
	
);
create table students_info as select id,
average_not real from students;
insert into students values ('100','Fatih','Hayyar',88.79,'2005-07-15');
insert into students values ('101','Gulsah','Hayyar',68.79,'2003-07-15');
insert into students (id,student_name,student_surname) values ('102','Osman','Hayyar');
select * from students;