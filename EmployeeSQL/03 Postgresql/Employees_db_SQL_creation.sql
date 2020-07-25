-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/

-- Tables created in sequence to handle foreign keys

CREATE TABLE Departments (
    Dept_No VARCHAR(4)   NOT NULL,
    Dept_Name VARCHAR(40)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        Dept_No
     )
);

CREATE TABLE Titles (
    TitleID VARCHAR(30)   NOT NULL,
    Title VARCHAR   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        TitleID
     )
);

CREATE TABLE Employees (
    Emp_No INTEGER   NOT NULL,
    Emp_TitleID VARCHAR(6)   NOT NULL,
    Birth_Date DATE   NOT NULL,
    First_Name VARCHAR(45)   NOT NULL,
    Last_Name varchar(45)   NOT NULL,
    Sex VARCHAR   NOT NULL,
    Hire_Date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        Emp_No
     )
);

CREATE TABLE Dept_Emp (
    Emp_No INTEGER   NOT NULL,
    Dept_No VARCHAR(4)   NOT NULL
);

CREATE TABLE Dept_Manager (
    Dept_No VARCHAR(4)   NOT NULL,
    Emp_No INTEGER   NOT NULL
);

CREATE TABLE Salaries (
    Emp_No INTEGER   NOT NULL,
    Salary NUMERIC   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        Emp_No
     )
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_Emp_TitleID FOREIGN KEY(Emp_TitleID)
REFERENCES Titles (TitleID);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_Emp_No FOREIGN KEY(Emp_No)
REFERENCES Employees (Emp_No);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_Dept_No FOREIGN KEY(Dept_No)
REFERENCES Departments (Dept_No);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Dept_No FOREIGN KEY(Dept_No)
REFERENCES Departments (Dept_No);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Emp_No FOREIGN KEY(Emp_No)
REFERENCES Employees (Emp_No);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_Emp_No FOREIGN KEY(Emp_No)
REFERENCES Employees (Emp_No);

