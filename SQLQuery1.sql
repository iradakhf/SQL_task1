---------------------------------------------------------------------TASK 1------------------------------------------------------------------------
Create Database Google;

Use Google;

Create Table Employees
(
Id int identity primary key,
Name nvarchar(70) Constraint NN_Employees_Name Not Null,
Surname nvarchar(100) Constraint NN_Employees_Surname Not Null,
Position nvarchar(500) Constraint NN_Employees_Position Not Null,
Salary money  
);


Insert Into Employees(Name, Surname,Position,Salary)
Values
('Irada','Feyzullayeva','Software Engineer', 15000),
(N'Xanım','Camalova','Robotics Engineer', 20000),
('Alovsat','Gambarov','Data Analyst', 50000),
('Vusala', 'Aliyeva', 'Developer', 10000),
('Nisa','Huseynova','Smart Home Engineer', 30000)


----AVERAGE SALARY COULD BE DISPLAYED WITH THE STATEMENT WRITTEN BELOW----
Select AVG(Salary) Average_Salary From Employees
--OR--
Select AVG(Salary) As Average_Salary From Employees


----Employees, who are paid higher than the average salary, can be displayed with belowmentioned statement----
Select Name,Surname,Salary From Employees
Where Salary>
(
  Select AVG(Salary) From Employees
);

----Max And Min Salaries----
Select MAX(Salary) AS Max_Salary From Employees
Select MIN(Salary) AS Min_Salary From Employees

--or---
Select * From Employees
Where Salary=
(
  Select MAX(Salary) From Employees
);

---We can display min and max together by using Union---
Select * From Employees
Where Salary = 
(
 Select MAX(Salary) From Employees
)
Union
Select * From Employees
Where Salary = 
(
 Select MIN(Salary) From Employees
);




---------------------------------------------------------------------TASK 2------------------------------------------------------------------------

Create Database Market;
Use Market;

Create Table Products
(
  Id int identity primary key,
  Name nvarchar(110) Constraint NN_Products_Name Not Null,
  Price money 
);

----Add Brand Column To The Products Table---
Alter Table Products
Add Brand nvarchar(100)

---Insert some data into Products Table
Insert Into Products(Name, Price, Brand)
Values
  ('Egg',1,'RandomBrand1'),
  ('Oil',20,'RandomBrand2'),
  ('Sugar',40,'RandomBrand3'),
  ('Water',10,'RandomBrand1'),
  ('Chocolate',100,'RandomBrand5'),
  ('Corn',150,'RandomBrand6'),
  ('TomatoSoup',35,'RandomBrand7'),
  ('Candy',80,'RandomBrand8'),
  ('Salmon',65,'RandomBrand2'),
  ('Almond',300,'RandomBrand5'),
  ('CornSoup',44,'RandomBrand7'),
  ('Macaron',101,'RandomBrand10'),
  ('Taco',165,'RandomBrand11'),
  ('Peanut',300,'RandomBrand12') 

  ------------Qiymeti Productlarin price-larinin average-den kicik olan Products datalari----------

  Select * From Products
  Where Price< (Select AVG(Price) From Products)

  ------Qiymeti 10-dan yuxari olan Product datalarinin siyahisini getiren query----
  Select * From Products 
  Where Price > 10

  ------Brand uzunlugu 5-den boyuk olan Productlarin siyahisini getiren query.----
  ---Gelen datalarda Mehsulun adi ve Brand adi 1 columnda gorsensin ve Column adi ProductInfo--
  Select 'Name : ' + Name +', Brand : ' + Brand as ProductInfo, Price from Products
  where LEN(Brand)>5


  -----------------------------------------Task 3----------------------------------------------------
Create Database EmployeesAndDepartment

Use EmployeesAndDepartment

Create Table Departments
(
  Id int identity primary key,
  Name nvarchar not null Constraint CK_Departments_Name Check(Len(Name)>2)
)
Create Table Employees
( Id int identity primary key,
  FullName nvarchar(200) Constraint NN_Employees_FullName Not Null Constraint CK_Employees_FullName Check(LEN(FullName)>3),
  Salary money Check(Salary>0),
  Email nvarchar(150) Constraint NN_Employees_Email Not Null Constraint UQ_Employees_Email Unique,
  DepartmentId int Constraint NN_Employees_DepartmentId Not Null Constraint FK_Employees_DepartmentId Foreign Key References Departments(Id)

);

