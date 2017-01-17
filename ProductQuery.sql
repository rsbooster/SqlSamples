SELECT t.ProductId, COUNT(1) FirstCount
FROM
(SELECT ProductId, ROW_NUMBER() OVER (PARTITION BY CustomerId ORDER BY DateCreated) rowNum
FROM Sales) t
WHERE t.rowNum=1
GROUP BY t.ProductId

