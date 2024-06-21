SELECT 
    year, 
    month, 
    aantal 
FROM (
    SELECT 
        EXTRACT(YEAR FROM joindate) AS year, 
        MONTHNAME(joindate) AS month, 
        COUNT(id) AS aantal,
        MONTH(joindate) AS month_num
    FROM 
        mhl_suppliers
    GROUP BY 
        year, month, month_num
) AS subquery
ORDER BY 
    year, month_num
LIMIT 0, 1000;
