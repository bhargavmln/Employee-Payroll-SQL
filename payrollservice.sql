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

#UC5
SELECT salary FROM employee_payroll WHERE name ='Bill';              
SELECT * FROM employee_payroll WHERE start BETWEEN CAST('2018-01-01' as date) and date(now());

#UC6
ALTER TABLE employee_payroll ADD Gender CHAR(1) AFTER name;
UPDATE employee_payroll SET Gender = 'F' WHERE id = 2;
UPDATE employee_payroll SET Gender = 'M' WHERE id = 1 or id = 3;