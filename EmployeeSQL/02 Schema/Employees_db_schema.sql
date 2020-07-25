# Tables created in sequence to handle foreign keys

Departments
-
Dept_No VARCHAR(4) PK
Dept_Name VARCHAR(40)


Titles
-
TitleID VARCHAR(30) PK
Title VARCHAR


Employees
-
Emp_No INTEGER PK
Emp_TitleID VARCHAR(6) FK >- Titles.TitleID
Birth_Date DATE
First_Name VARCHAR(45)
Last_Name varchar(45)
Sex VARCHAR
Hire_Date DATE


Dept_Emp
-
Emp_No INTEGER FK - Employees.Emp_No
Dept_No VARCHAR(4) FK >- Departments.Dept_No


Dept_Manager
-
Dept_No VARCHAR(4) FK >- Departments.Dept_No
Emp_No INTEGER FK - Employees.Emp_No


Salaries
-
Emp_No INTEGER PK FK - Employees.Emp_No
Salary NUMERIC