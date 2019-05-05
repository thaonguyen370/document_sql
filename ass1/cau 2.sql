-- 2
/*Employee_Table (Employee_Number, Employee_Name, Department_Number)
 Employee_Skill_Table (Employee_Number, Skill_Code, Date Registered)
 Department (Department_Number, Department_Name)*/
-- tao bang Department
CREATE TABLE Department(
   Department_Number   INT  AUTO_INCREMENT         NOT NULL,
   Department_Name    varchar(20)  NOT NULL,
        
   PRIMARY KEY (Department_Number)
  
);
-- tao bang Employee_Skill_Table

CREATE TABLE Employee_Skill_Table(
   Employee_Number   INT      NOT NULL,
   Skill_Code    varchar(20)  NOT NULL,
	Date_Registered Date ,
   PRIMARY KEY (Employee_Number,Skill_Code )
  
);
-- tao bang Employee_Table
CREATE TABLE Employee_Table(
   Employee_Number   INT  AUTO_INCREMENT         NOT NULL,
   Employee_Name varchar(20)     NOT NULL,
   Department_Number  INT              NOT NULL,
        
   PRIMARY KEY (Employee_Number),
   FOREIGN KEY (Department_Number) REFERENCES Department(Department_Number)
);

-- insert Department

INSERT INTO Department(Department_Number,Department_Name)
VALUES (null, 'ke toan' );

INSERT INTO Department(Department_Number,Department_Name)
VALUES (null, 'co so vat chat' );

INSERT INTO Department(Department_Number,Department_Name)
VALUES (null, 'tai chinh' );

INSERT INTO Department(Department_Number,Department_Name)
VALUES (null, 'kinh doanh' );

-- insert Employee_Table

INSERT INTO Employee_Table(Employee_Number,Employee_Name,Department_Number)
VALUES (null, 'nguyen van teo', 1 );

INSERT INTO Employee_Table(Employee_Number,Employee_Name,Department_Number)
VALUES (null, 'nguyen van ti', 2 );

INSERT INTO Employee_Table(Employee_Number,Employee_Name,Department_Number)
VALUES (null, 'nguyen van buoi', 3 );

INSERT INTO Employee_Table(Employee_Number,Employee_Name,Department_Number)
VALUES (null, 'nguyen van xoai', 4 );
INSERT INTO Employee_Table(Employee_Number,Employee_Name,Department_Number)
VALUES (null, 'nguyen van a', 1 );

INSERT INTO Employee_Table(Employee_Number,Employee_Name,Department_Number)
VALUES (null, 'nguyen van b', 1 );

INSERT INTO Employee_Table(Employee_Number,Employee_Name,Department_Number)
VALUES (null, 'nguyen van c', 1 );

INSERT INTO Employee_Table(Employee_Number,Employee_Name,Department_Number)
VALUES (null, 'nguyen van d', 4 );

INSERT INTO Employee_Table(Employee_Number,Employee_Name,Department_Number)
VALUES (null, 'nguyen van e', 4 );


-- insert Employee_Skill_Table

INSERT INTO Employee_Skill_Table(Employee_Number,Skill_Code,Date_Registered)
VALUES (1, 'java' ,'2010/10/10');
INSERT INTO Employee_Skill_Table(Employee_Number,Skill_Code,Date_Registered)
VALUES (2, 'c++' ,'2010/10/10');
INSERT INTO Employee_Skill_Table(Employee_Number,Skill_Code,Date_Registered)
VALUES (3, 'c#' ,'2010/11/10');
INSERT INTO Employee_Skill_Table(Employee_Number,Skill_Code,Date_Registered)
VALUES (4, 'php' ,'2010/10/10');
INSERT INTO Employee_Skill_Table(Employee_Number,Skill_Code,Date_Registered)
VALUES (5, 'java' ,'2010/10/10');

INSERT INTO Employee_Skill_Table(Employee_Number,Skill_Code,Date_Registered)
VALUES (6, 'java' ,'2010/10/10');

-- 2.b.1
select b.Employee_Name
 from employee_skill_table as a
 join employee_table as b
ON a.Employee_Number= b.Employee_Number
where  a.Skill_Code like '%java%'

-- 2.b.2

select x.Employee_Name
from  employee_table as x
where x.Employee_Number IN (
select k.Employee_Number from employee_skill_table as k where k.Skill_Code like '%java%'
)


 -- cau 3 in ra danh sach nv cua moi phong ban >=3
 select x.Employee_Name, department.Department_Number
from  employee_table as x, department
where x.Department_Number IN (
select y.Department_Number from
(select k.Department_Number, count(k.Department_Number) as dem from employee_table as k group by k.Department_Number ) as y where y.dem>=3
) and x.Department_Number=department.Department_Number

-- cau 4 in ra nhan cien nhieu hon 1 ki nang
select x.Employee_Name
from  employee_table as x
where 1 < (

select count(k.Employee_Number) as dem from employee_skill_table as k  where x.Employee_Number=k.Employee_Number group by k.Employee_Number
)
 
-- cau 5 tao view nv nhieu hon 1 ki nang

CREATE VIEW  different_employees_view AS
SELECT m.Employee_Name, m.Employee_Number, department.Department_Name
FROM ( select x.Employee_Name, x.Employee_Number, x.Department_Number
from  employee_table as x
where 1 < (
select count(k.Employee_Number) as dem from employee_skill_table as k  where x.Employee_Number=k.Employee_Number group by k.Employee_Number
)) as m, department where m.Department_Number=department.Department_Number

