
-- 1. Total sales per city
SELECT c.City, SUM(s.Amount) AS TotalSales
FROM Sales s
JOIN Customer c ON s.CustomerID = c.CustomerID
GROUP BY c.City;

-- 2. Top 3 customers by total sales amount
SELECT s.CustomerID, c.CustomerName, SUM(s.Amount) AS TotalSales
FROM Sales s
JOIN Customer c ON s.CustomerID = c.CustomerID
GROUP BY s.CustomerID, c.CustomerName
ORDER BY TotalSales DESC
LIMIT 3;

-- 3. Monthly sales (sum of Amount grouped by month)
SELECT strftime('%Y-%m', s.SaleDate) AS SaleMonth, SUM(s.Amount) AS MonthlySales
FROM Sales s
GROUP BY SaleMonth
ORDER BY SaleMonth;

-- 4. Customers who haven’t made any purchase
SELECT c.CustomerID, c.CustomerName
FROM Customer c
LEFT JOIN Sales s ON c.CustomerID = s.CustomerID
WHERE s.CustomerID IS NULL;

-- 5. Average age of customers per city
SELECT City, AVG(Age) AS AverageAge
FROM Customer
GROUP BY City;
