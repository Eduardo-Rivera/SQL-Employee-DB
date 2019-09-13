DROP TABLE IF EXISTS "Departments";
DROP TABLE IF EXISTS "Department_Employee";
DROP TABLE IF EXISTS "Department_Manager";
DROP TABLE IF EXISTS "Salaries";
DROP TABLE IF EXISTS "Titles";
DROP TABLE IF EXISTS "Employees";

CREATE TABLE "Departments" (
    "ID" VARCHAR  NOT NULL,
    "Department_Name" VARCHAR   NOT NULL,
	CONSTRAINT "pk_Departments" 
	ADD PRIMARY KEY ("ID")
) ;
SELECT * FROM "Departments";
 --
 
 CREATE TABLE "Department_Employee" (
    "Employee_ID" INTEGER   NOT NULL,
    "Department_ID" VARCHAR   NOT NULL,
    "Start_Date" VARCHAR   NOT NULL,
    "End_Date" VARCHAR   NOT NULL);
	
SELECT * FROM "Department_Employee";
--

CREATE TABLE "Department_Manager" (
    "Department_ID" VARCHAR   NOT NULL,
    "Employee_ID" INTEGER   NOT NULL,
    "Start_Date" VARCHAR   NOT NULL,
    "End_Date" VARCHAR   NOT NULL);
	
SELECT * FROM "Department_Manager";
--

CREATE TABLE "Employees" (
    "ID" INTEGER   NOT NULL,
    "Birth_Date" VARCHAR   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    "Gender" VARCHAR   NOT NULL,
    "Hire_Date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Employees" 
	ADD PRIMARY KEY ("ID")
);
SELECT * FROM "Employees";
--

CREATE TABLE "Salaries" (
    "Employee_ID" INTEGER   NOT NULL,
    "Salary" VARCHAR   NOT NULL,
    "Start_Date" VARCHAR   NOT NULL,
    "End_Date" VARCHAR   NOT NULL);
	
SELECT * FROM "Salaries";
--

CREATE TABLE "Titles" (
    "Employee_ID" INTEGER   NOT NULL,
    "Job_Title" VARCHAR   NOT NULL,
    "Start_Date" VARCHAR   NOT NULL,
    "End_Date" VARCHAR   NOT NULL);
	
SELECT * FROM "Titles";

-- foreign key relations
ALTER TABLE "Department_Employee" 
ADD CONSTRAINT "fk_Department_Employee_Employee_ID"
FOREIGN KEY("Employee_ID")
REFERENCES "Employees" ("ID");

ALTER TABLE "Department_Employee" 
ADD CONSTRAINT "fk_Department_Employee_Department_ID" 
FOREIGN KEY("Department_ID")
REFERENCES "Departments" ("ID");

ALTER TABLE "Department_Manager" 
ADD CONSTRAINT "fk_Department_Manager_Department_ID" 
FOREIGN KEY("Department_ID")
REFERENCES "Departments" ("ID");

ALTER TABLE "Department_Manager" 
ADD CONSTRAINT "fk_Department_Manager_EmpLoyee_ID" 
FOREIGN KEY("Employee_ID")
REFERENCES "Employees" ("ID");

ALTER TABLE "Salaries" 
ADD CONSTRAINT "fk_Salaries_Employee_ID" 
FOREIGN KEY("Employee_ID")
REFERENCES "Employees" ("ID");

ALTER TABLE "Titles" 
ADD CONSTRAINT "fk_Titles_Employee_ID" 
FOREIGN KEY("Employee_ID")
REFERENCES "Employees" ("ID");