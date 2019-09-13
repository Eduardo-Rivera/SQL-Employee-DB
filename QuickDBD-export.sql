-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/I5jCJ0
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Department" (
    "ID" VARCHAR   NOT NULL,
    "Dept_Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Department_Employees" (
    "Employee_ID" INTEGER   NOT NULL,
    "Department_ID" VARCHAR   NOT NULL,
    "Start_Date" VARCHAR   NOT NULL,
    "End_Date" VARCHAR   NOT NULL
);

CREATE TABLE "Department_Manager" (
    "Department_ID" VARCHAR   NOT NULL,
    "Employee_ID" INTEGER   NOT NULL,
    "Start_Date" VARCHAR   NOT NULL,
    "End_Date" VARCHAR   NOT NULL
);

CREATE TABLE "Employees" (
    "Employee_ID" INTEGER   NOT NULL,
    "Birth_Date" VARCHAR   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    "Gender" VARCHAR   NOT NULL,
    "Hire_Date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Employee_ID"
     )
);

CREATE TABLE "Titles" (
    "Employee_ID" INTEGER   NOT NULL,
    "Job_Title" VARCHAR   NOT NULL,
    "Start_Date" VARCHAR   NOT NULL,
    "End_Date" VARCHAR   NOT NULL
);

CREATE TABLE "Salaries" (
    "Employee_ID" INTEGER   NOT NULL,
    "Salary" VARCHAR   NOT NULL,
    "Start_Date" VARCHAR   NOT NULL,
    "End_Date" VARCHAR   NOT NULL
);

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_Employee_ID" FOREIGN KEY("Employee_ID")
REFERENCES "Employees" ("Employee_ID");

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_Department_ID" FOREIGN KEY("Department_ID")
REFERENCES "Department" ("ID");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_Department_ID" FOREIGN KEY("Department_ID")
REFERENCES "Department" ("ID");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_Employee_ID" FOREIGN KEY("Employee_ID")
REFERENCES "Employees" ("Employee_ID");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_Employee_ID" FOREIGN KEY("Employee_ID")
REFERENCES "Employees" ("Employee_ID");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Employee_ID" FOREIGN KEY("Employee_ID")
REFERENCES "Employees" ("Employee_ID");

