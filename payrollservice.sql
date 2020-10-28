#UC1
SHOW databases;
CREATE DATABASE payroll_service; #Created database
SHOW databases;
USE payroll_service;
SELECT database();

#UC2
CREATE TABLE employee_payroll
(
id       INT unsigned NOT NULL auto_increment,		#ID is set on auto increment
name     VARCHAR(150) NOT NULL,
salary   DOUBLE NOT NULL,
start    DATE NOT NULL,
PRIMARY KEY (id)  									#Set ID as primary key
);
DESCRIBE employee_payroll;

#UC3
INSERT INTO employee_payroll(name , salary , start) VALUES
( 'Bill',100000.00,'2018-01-03' ),
( 'Terisa',200000.00,'2019-11-13'),
( 'Charlie',300000.00,'2020-05-21');

#UC4
SELECT * FROM employee_payroll;