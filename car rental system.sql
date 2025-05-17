

-- 1. Employee Table
CREATE TABLE Employee (
    EmpID INTEGER PRIMARY KEY,
    FName VARCHAR(50),
    LName VARCHAR(50),
    Salary DECIMAL(10,2),
    JoinDate DATE,
    Responsibility VARCHAR(100),
    HouseNo VARCHAR(10),
    City VARCHAR(50),
    Country VARCHAR(50),
    ContactNo VARCHAR(15)
);

-- 2. Customer Table
CREATE TABLE Customer (
    CustID INTEGER PRIMARY KEY,
    FName VARCHAR(50),
    LName VARCHAR(50),
    HouseNo VARCHAR(10),
    City VARCHAR(50),
    Country VARCHAR(50),
    ContactNo VARCHAR(15),
    DrivingLicence VARCHAR(20)
);

-- 3. Vehicle Table
CREATE TABLE Vehicle (
    VehicleID INTEGER PRIMARY KEY,
    Mileage INTEGER,
    PlateNo VARCHAR(20),
    DailyPrice DECIMAL(10,2),
    Condition_ VARCHAR(50),
    Model VARCHAR(50)
);

-- 4. Reservation Table
CREATE TABLE Reservation (
    ReserveID INTEGER PRIMARY KEY,
    CustID INTEGER,
    PickupDate DATE,
    ReturnDate DATE,
    NoOfDays INTEGER,
    CancelationDetails VARCHAR(100),
    PickupLocation VARCHAR(100),
    FOREIGN KEY (CustID) REFERENCES Customer(CustID)
);

-- 5. Rent Table
CREATE TABLE Rent (
    RentID INTEGER PRIMARY KEY,
    Refund DECIMAL(10,2),
    DownPay DECIMAL(10,2),
    PayMethod VARCHAR(20),
    TotalPay DECIMAL(10,2),
    DamageCompensation DECIMAL(10,2),
    PayDate DATE,
    CustID INTEGER,
    VehicleID INTEGER,
    FOREIGN KEY (CustID) REFERENCES Customer(CustID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID)
);

-- Sample SQL Queries

-- 1. CONCAT (combine first and last names of employees)
SELECT CONCAT(FName, ' ', LName) AS FullName FROM Employee;

-- For SQLite use: FName || ' ' || LName AS FullName

-- 2. BETWEEN (salary range)
SELECT * FROM Employee WHERE Salary BETWEEN 4500 AND 5000;

-- 3. AND (multiple conditions)
SELECT * FROM Employee WHERE City = 'New York' AND Salary > 4000;

-- 4. OR (either condition)
SELECT * FROM Customer WHERE City = 'Los Angeles' OR City = 'Chicago';

-- 5. HAVING (aggregate with filter)
SELECT City, AVG(Salary) AS AvgSalary
FROM Employee
GROUP BY City
HAVING AVG(Salary) > 4500;

-- 6. GROUP BY (count by responsibility)
SELECT Responsibility, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY Responsibility;

-- 7. ORDER BY (descending salary)
SELECT * FROM Employee ORDER BY Salary DESC;

-- 8. ASC (sort contact numbers ascending)
SELECT ContactNo FROM Employee ORDER BY ContactNo ASC;
