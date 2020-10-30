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

#UC7
SELECT gender,SUM(salary),AVG(salary),MIN(salary),MAX(salary) FROM employee_payroll WHERE gender = 'F';       
SELECT gender,SUM(salary),AVG(salary),MIN(salary),MAX(salary) FROM employee_payroll WHERE gender = 'M';       
SELECT gender,SUM(salary),AVG(salary),MIN(salary),MAX(salary) FROM employee_payroll GROUP BY gender;          
 
select gender,COUNT(*) from employee_payroll group by gender;

#UC8
ALTER TABLE employee_payroll 
ADD COLUMN phone VARCHAR(13) AFTER name,
ADD COLUMN address VARCHAR(250) DEFAULT 'India' AFTER phone,
ADD COLUMN department VARCHAR(150) NOT NULL AFTER address;
SELECT * FROM employee_payroll;

#UC9
ALTER TABLE employee_payroll 
ADD COLUMN basic_pay DOUBLE NOT NULL AFTER gender,
ADD COLUMN deductions DOUBLE NOT NULL AFTER basic_pay,
ADD COLUMN taxable_pay DOUBLE NOT NULL AFTER deductions,
ADD COLUMN tax DOUBLE NOT NULL AFTER taxable_pay,
ADD COLUMN net_pay DOUBLE NOT NULL AFTER tax;

ALTER TABLE employee_payroll DROP COLUMN salary;

SELECT * FROM employee_payroll;

#UC10
UPDATE employee_payroll SET department = 'sales' WHERE name = 'Terisa';
INSERT INTO employee_payroll (name,phone,address,department,gender,basic_pay,deductions,taxable_pay,tax,net_pay,start) VALUES
('Terisa','1231231231','Goa','marketing','F',300000.00,100000,2000000,500000,1500000,'2020-05-21');

#UC11
DROP TABLE employee_payroll;

CREATE TABLE Employee_Details (
   id INT unsigned NOT NULL auto_increment,
   name VARCHAR(150) NOT NULL,
   phone VARCHAR(10),
   address VARCHAR(250),
   gender CHAR(1),
   start_date DATE NOT NULL,
   payroll_id VARCHAR(6) NOT NULL,
   PRIMARY KEY (id),
   FOREIGN KEY (payroll_id) REFERENCES payroll (payroll_id)
);

CREATE TABLE payroll (
  payroll_id VARCHAR(6) NOT NULL,
  basic_pay DOUBLE NOT NULL,
  deductions DOUBLE NOT NULL,
  taxable_pay DOUBLE NOT NULL,
  tax DOUBLE NOT NULL,
  net_pay DOUBLE NOT NULL,
  PRIMARY KEY (payroll_id)
);

CREATE TABLE Department (
  department_id VARCHAR(6) NOT NULL,
  department VARCHAR(150) NOT NULL,
  PRIMARY KEY (department_id)
);

CREATE TABLE Employee_Dep (
  id INT UNSIGNED NOT NULL auto_increment,
  dep_id VARCHAR(6) NOT NULL,
  FOREIGN KEY (id) REFERENCES employee_details (id),
  FOREIGN KEY (dep_id) REFERENCES department (department_id)
);

INSERT INTO payroll(payroll_id,basic_pay,deductions,taxable_pay,tax,net_pay) VALUES
('PID001',30000,10000,20000,2000,18000),
('PID002',50000,10000,40000,4000,36000),
('PID003',40000,10000,30000,3000,27000);
SELECT * FROM payroll;

INSERT INTO employee_details (name,phone,address,gender,start_date,payroll_id) VALUES
('Bill','1231231231','Pune','M','2020-05-21','PID001'),
('Mark','3213213213','Goa','M','2020-01-15','PID002'),
('Terisa','9879879879','Pune','F','2019-011-01','PID003');
SELECT * FROM employee_details;

INSERT INTO department(department_id,department) VALUES
('DEP000', 'training'),
('DEP001', 'sales'),
('DEP002', 'marketing'),
('DEP003', 'HR');
SELECT * FROM department;

INSERT INTO employee_dep(id,dep_id) VALUES
(1,'DEP000'),
(2,'DEP003'),
(3,'DEP001'),
(3,'DEP002');
SELECT * FROM employee_dep;

SELECT gender,SUM(net_pay),AVG(net_pay),MIN(net_pay),MAX(net_pay) 
FROM employee_details JOIN payroll 
ON employee_details.payroll_id = payroll.payroll_id
GROUP BY gender ; 

select gender,COUNT(*) from employee_details group by gender;

#UC12
SELECT * FROM payroll;
SELECT * FROM employee_details;
SELECT * FROM department;
SELECT * FROM employee_dep;

SELECT name,basic_pay,deductions,taxable_pay,tax,net_pay 
FROM employee_details JOIN payroll 
ON employee_details.payroll_id = payroll.payroll_id
HAVING name = 'Bill';              

SELECT start_date,name,basic_pay,deductions,taxable_pay,tax,net_pay 
FROM employee_details JOIN payroll 
ON employee_details.payroll_id = payroll.payroll_id
HAVING start_date BETWEEN CAST('2018-01-01' as date) and date(now());

