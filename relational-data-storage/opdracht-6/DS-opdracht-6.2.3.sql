SELECT 
    `Dag van de week`, 
    `Aantal aanmeldingen`
FROM (
    SELECT 
        DAYNAME(joindate) AS `Dag van de week`, 
        COUNT(id) AS `Aantal aanmeldingen`
    FROM 
        mhl.mhl_suppliers
    GROUP BY 
        DAYNAME(joindate)
) AS subquery
ORDER BY 
    FIELD(`Dag van de week`, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
