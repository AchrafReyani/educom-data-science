SELECT 
    rnames.rubrieknaam, 
    COALESCE(SUM(HIT.hitcount), 'Geen hits') AS total
FROM 
    mhl_suppliers_mhl_rubriek_view AS RV
JOIN 
    mhl_suppliers AS SP ON RV.mhl_suppliers_ID = SP.id
JOIN 
    mhl_rubrieken AS RU ON RV.mhl_rubriek_view_ID = RU.id
LEFT JOIN 
    mhl_hitcount AS HIT ON SP.id = HIT.supplier_ID
RIGHT JOIN 
    (
        SELECT 
            R2.id AS rubID, 
            COALESCE(CONCAT(R1.name, ' - ', R2.name), R2.name) AS rubrieknaam
        FROM 
            mhl_rubrieken AS R2
        LEFT JOIN 
            mhl_rubrieken AS R1 ON R2.parent = R1.id
    ) AS rnames ON RV.mhl_rubriek_view_ID = rnames.rubID
GROUP BY 
    rnames.rubrieknaam
ORDER BY 
    rnames.rubrieknaam;
