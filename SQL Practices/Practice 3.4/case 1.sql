CREATE TABLE Cars (
  CarID INT PRIMARY KEY,
  Brand VARCHAR(50),
  Model VARCHAR(50),
  Year INT,
  Mileage INT,
  Price DECIMAL(10,2),
  Available BIT
);
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(100),
  PhoneNumber VARCHAR(20)
);
CREATE TABLE Sales (
  SaleID INT PRIMARY KEY,
  CarID INT,
  CustomerID INT,
  SaleDate DATE,
  SalePrice DECIMAL(10,2),
  FOREIGN KEY (CarID) REFERENCES Cars(CarID),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- query-1
SELECT Brand, Model, Price 
FROM Cars 
ORDER BY Price DESC 
LIMIT 10;

-- query-2
SELECT AVG(Price) AS AvgPrice
FROM Cars
WHERE Available = 1;

-- query-3
SELECT c.FirstName, c.LastName, COUNT(s.CarID) AS Num_of_Cars_Purchased
FROM Customers c
JOIN Sales s ON c.CustomerID = s.CustomerID
GROUP BY c.CustomerID
ORDER BY Num_of_Cars_Purchased DESC;

-- query-4
SELECT *
FROM Customers c
LEFT JOIN Sales s 
ON c.CustomerID = s.CustomerID
WHERE s.SaleID IS NULL;

-- query-5
INSERT INTO Cars (Brand, Model, Year, Mileage, Price, Available)
VALUES ('Toyota', 'Corolla', 2022, 0, 20000, 1);

-- query-6
UPDATE Cars
SET Price = Price * 1.1;
select * from Cars;

-- query-7
DELETE FROM Sales
WHERE SaleDate < '2022-01-01'
