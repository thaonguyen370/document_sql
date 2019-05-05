--EX1
CREATE DATABASE q_2_1;  
CREATE TABLE Employee(
   EmployeeID   INT  IDENTITY(1,1)   ,
   EmployeeLastName  VARCHAR(20)	NOT NULL,
   EmployeeFistName  VARCHAR(20)	NOT NULL,
   EmployeeHireDate  date          NOT NULL,    
   EmployeeStatus  VARCHAR(20)   NOT NULL,   
	SupervisorID INT  ,   
	SocialSecurityNumber INT ,   
   PRIMARY KEY (EmployeeID)
); 

CREATE TABLE Projects(
   ProjectID   INT  IDENTITY(1,1)   ,
   EmployeeID INT	NOT NULL,
   ProjectName  VARCHAR(20)        NOT NULL,
   ProjectStartDate  date          NOT NULL,    
   ProjectDecription  VARCHAR(20)   NOT NULL,   
   ProjectDetailt  VARCHAR(20)      NOT NULL,   
	ProjectcompletedOn  date         NOT NULL,  
   PRIMARY KEY (ProjectID),
   FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
    
); 

CREATE TABLE Project_Modules(
   ModuleID   INT  IDENTITY(1,1)   ,
   ProjectID INT    NOT NULL,
   EmployeeID INT	NOT NULL,
   ProjectModulesDate  VARCHAR(20)    NOT NULL,
   ProjectModulesDateCompleOn  VARCHAR(20) ,
   ProjectModulesDecription VARCHAR(20),
        
   PRIMARY KEY (ModuleID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) ON DELETE CASCADE,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);


CREATE TABLE Work_Done(
   WorkDoneID   INT  IDENTITY(1,1)   ,
   EmployeeID INT	NOT NULL,
   ModuleID INT	NOT NULL,
   WorkDoneDate  date       NOT NULL,    
   WorkDoneDecription  VARCHAR(20)   NOT NULL,   
   WorkDoneStatus  VARCHAR(20)      NOT NULL,   

   PRIMARY KEY (WorkDoneID),
   FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
   FOREIGN KEY (ModuleID) REFERENCES Project_Modules(ModuleID)  ON DELETE CASCADE
); 
--1a
-- insert Employee

INSERT INTO Employee(EmployeeLastName,EmployeeFistName,EmployeeHireDate,EmployeeStatus,SupervisorID,SocialSecurityNumber)
VALUES ( 'thao', 'nguyen', '2015/10/10','good',null,'123456789' );
INSERT INTO Employee(EmployeeLastName,EmployeeFistName,EmployeeHireDate,EmployeeStatus,SupervisorID,SocialSecurityNumber)
VALUES ( 'A', 'nguyen', '2015/10/10','good',null,'123456789' );
INSERT INTO Employee(EmployeeLastName,EmployeeFistName,EmployeeHireDate,EmployeeStatus,SupervisorID,SocialSecurityNumber)
VALUES ( 'B', 'nguyen', '2015/10/10','good',null,'123456789' );
INSERT INTO Employee(EmployeeLastName,EmployeeFistName,EmployeeHireDate,EmployeeStatus,SupervisorID,SocialSecurityNumber)
VALUES ( 'C', 'nguyen', '2015/10/10','good',1,'123456789' );
INSERT INTO Employee(EmployeeLastName,EmployeeFistName,EmployeeHireDate,EmployeeStatus,SupervisorID,SocialSecurityNumber)
VALUES ( 'D', 'nguyen', '2015/10/10','good',1,'123456789' );
INSERT INTO Employee(EmployeeLastName,EmployeeFistName,EmployeeHireDate,EmployeeStatus,SupervisorID,SocialSecurityNumber)
VALUES ( 'E', 'nguyen', '2015/10/10','good',1,'123456789' );
INSERT INTO Employee(EmployeeLastName,EmployeeFistName,EmployeeHireDate,EmployeeStatus,SupervisorID,SocialSecurityNumber)
VALUES ( 'f', 'nguyen', '2015/10/10','good',2,'123456789' );
INSERT INTO Employee(EmployeeLastName,EmployeeFistName,EmployeeHireDate,EmployeeStatus,SupervisorID,SocialSecurityNumber)
VALUES ( 'g', 'nguyen', '2015/10/10','good',2,'123456789' );
INSERT INTO Employee(EmployeeLastName,EmployeeFistName,EmployeeHireDate,EmployeeStatus,SupervisorID,SocialSecurityNumber)
VALUES ( 'hihii', 'nguyen', '2015/10/10','good',3,'123456789' );
INSERT INTO Employee(EmployeeLastName,EmployeeFistName,EmployeeHireDate,EmployeeStatus,SupervisorID,SocialSecurityNumber)
VALUES ( 'i', 'nguyen', '2015/10/10','good',4,'123456789' );
INSERT INTO Employee(EmployeeLastName,EmployeeFistName,EmployeeHireDate,EmployeeStatus,SupervisorID,SocialSecurityNumber)
VALUES ( 'k', 'nguyen', '2015/10/10','good',4,'123456789' );

-- insert Projects
INSERT INTO Projects(EmployeeID,ProjectName,ProjectStartDate,ProjectDecription,ProjectDetailt,ProjectcompletedOn)
VALUES ( 1, 'web ban hang', '2015/11/10','abc','xyz','2016/05/06' );
INSERT INTO Projects(EmployeeID,ProjectName,ProjectStartDate,ProjectDecription,ProjectDetailt,ProjectcompletedOn)
VALUES ( 2, 'web ban hang', '2015/12/10','abc','xyz','2016/06/06' );
INSERT INTO Projects(EmployeeID,ProjectName,ProjectStartDate,ProjectDecription,ProjectDetailt,ProjectcompletedOn)
VALUES ( 3, 'web thoi trang', '2015/01/10','abc','xyz','2016/05/06' );
INSERT INTO Projects(EmployeeID,ProjectName,ProjectStartDate,ProjectDecription,ProjectDetailt,ProjectcompletedOn)
VALUES ( 4, 'web ban gia dung', '2015/03/10','abc','xyz','2016/05/06' );
INSERT INTO Projects(EmployeeID,ProjectName,ProjectStartDate,ProjectDecription,ProjectDetailt,ProjectcompletedOn)
VALUES ( 5, 'web chung khoan', '2015/04/10','abc','xyz','2016/05/06' );
INSERT INTO Projects(EmployeeID,ProjectName,ProjectStartDate,ProjectDecription,ProjectDetailt,ProjectcompletedOn)
VALUES ( 2, 'web giao dich', '2015/05/10','abc','xyz','2018/05/06' );
INSERT INTO Projects(EmployeeID,ProjectName,ProjectStartDate,ProjectDecription,ProjectDetailt,ProjectcompletedOn)
VALUES ( 7, 'web game', '2015/10/10','abc','xyz','2017/05/06' );
INSERT INTO Projects(EmployeeID,ProjectName,ProjectStartDate,ProjectDecription,ProjectDetailt,ProjectcompletedOn)
VALUES ( 2, 'web doc bao', '2015/10/10','abc','xyz','2016/05/06' );


-- insert Project_Modules
INSERT INTO Project_Modules(ProjectID,EmployeeID,ProjectModulesDate,ProjectModulesDateCompleOn,ProjectModulesDecription)
VALUES ( 1, 1,'2015/02/03','2016/05/06','good' );

INSERT INTO Project_Modules(ProjectID,EmployeeID,ProjectModulesDate,ProjectModulesDateCompleOn,ProjectModulesDecription)
VALUES ( 1, 2,'2015/02/03','2016/05/06','good' );

INSERT INTO Project_Modules(ProjectID,EmployeeID,ProjectModulesDate,ProjectModulesDateCompleOn,ProjectModulesDecription)
VALUES ( 1, 3,'2015/02/03','2016/05/06','good' );

INSERT INTO Project_Modules(ProjectID,EmployeeID,ProjectModulesDate,ProjectModulesDateCompleOn,ProjectModulesDecription)
VALUES ( 2, 4,'2015/02/03','2016/05/06','good' );

INSERT INTO Project_Modules(ProjectID,EmployeeID,ProjectModulesDate,ProjectModulesDateCompleOn,ProjectModulesDecription)
VALUES ( 2, 5,'2015/02/03','2016/05/06','good' );

INSERT INTO Project_Modules(ProjectID,EmployeeID,ProjectModulesDate,ProjectModulesDateCompleOn,ProjectModulesDecription)
VALUES ( 3, 6,'2015/02/03','2016/05/06','good' );

INSERT INTO Project_Modules(ProjectID,EmployeeID,ProjectModulesDate,ProjectModulesDateCompleOn,ProjectModulesDecription)
VALUES ( 3, 7,'2015/02/03','2016/05/06','good' );

INSERT INTO Project_Modules(ProjectID,EmployeeID,ProjectModulesDate,ProjectModulesDateCompleOn,ProjectModulesDecription)
VALUES ( 4, 7,'2015/02/03','2016/05/06','good' );

-- insert Work_Done
 
INSERT INTO Work_Done(EmployeeID,ModuleID,WorkDoneDate,WorkDoneDecription,WorkDoneStatus)
VALUES ( 1, 1,'2015/02/03','login logout','good' );
 
 INSERT INTO Work_Done(EmployeeID,ModuleID,WorkDoneDate,WorkDoneDecription,WorkDoneStatus)
VALUES ( 2, 1,'2015/02/03','gio hang','good' );

INSERT INTO Work_Done(EmployeeID,ModuleID,WorkDoneDate,WorkDoneDecription,WorkDoneStatus)
VALUES ( 4, 2,'2015/02/03','thanh toan','good' );

INSERT INTO Work_Done(EmployeeID,ModuleID,WorkDoneDate,WorkDoneDecription,WorkDoneStatus)
VALUES ( 5, 2,'2015/02/03','abc','good' );

INSERT INTO Work_Done(EmployeeID,ModuleID,WorkDoneDate,WorkDoneDecription,WorkDoneStatus)
VALUES ( 6, 3,'2015/02/03','xyz','good' );

INSERT INTO Work_Done(EmployeeID,ModuleID,WorkDoneDate,WorkDoneDecription,WorkDoneStatus)
VALUES ( 7, 4,'2015/02/03','123','good' );
 INSERT INTO Work_Done(EmployeeID,ModuleID,WorkDoneDate,WorkDoneDecription,WorkDoneStatus)
VALUES ( 8, 1,'2015/02/03','login logout','good' );
--1.b


-- 1.c
use q_2_1;
if OBJECT_ID ('checkEmployeeInModules','P') is not null
	drop procedure checkEmployeeInModules;
go
CREATE PROCEDURE checkEmployeeInModules(@Employee int)

as

   select * from project_modules as x
    where x.EmployeeID=@Employee;
return
go

exec checkEmployeeInModules @Employee=7; 
-- 1d

CREATE FUNCTION abc2()
RETURNS TABLE AS RETURN (
  select * from Employee where EmployeeID IN(  select a.EmployeeID from Work_Done a where EmployeeID not in (select EmployeeID from Project_Modules ))

);

select * from abc2();
-- 1.e

CREATE TRIGGER beforeProjectModules_INSERT ON dbo.Project_modules
FOR  INSERT
AS
	DECLARE @ProjectID INT;
	DECLARE @ProjectModuleDates DATE;
	DECLARE @ProjectModulesDateCompleOn DATE;
	SELECT @ProjectModuleDates = i.ProjectModulesDate,@ProjectID=I.ProjectID,@ProjectModulesDateCompleOn=I.ProjectModulesDateCompleOn	
	FROM inserted i;
 if @ProjectModuleDates<(SELECT ProjectStartDate FROM projects WHERE projects.ProjectID=@ProjectID)

    begin
	print 'date modules not less than project start date';
	rollback tran
	end
if @ProjectModulesDateCompleOn<(SELECT ProjectStartDate FROM projects WHERE projects.ProjectID=@ProjectID)

    begin
	print 'date modules complete more than date project complete';
	rollback tran
	end
GO

INSERT INTO Project_Modules(ProjectID,EmployeeID,ProjectModulesDate,ProjectModulesDateCompleOn,ProjectModulesDecription)
VALUES ( 2, 4,'2015/02/03','2012/05/06','loi rui' );

select * from Project_Modules;



select * from Projects;



USE q_2_1;
go 
if OBJECT_ID('removeProjectAfter3Month','p') is not null
	drop procedure removeProjectAfter3Month;
go 
create procedure removeProjectAfter3Month
	
as
	DELETE FROM Projects where projectID in(select projectID from Projects as x where datediff(day,x.ProjectcompletedOn,getdate())>90);

	print ''+convert(varchar(3),@@rowcount)
	return
GO
EXECute removeProjectAfter3Month ;


select * from Work_Done;