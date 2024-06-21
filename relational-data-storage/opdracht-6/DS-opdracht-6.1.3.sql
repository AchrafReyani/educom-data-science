SELECT 
    COALESCE(CONCAT(R1.name, ' - ', R2.name), R2.name) AS rubrieknaam,
    COUNT(SP.id) AS numsup
FROM 
    mhl_rubrieken AS R2
LEFT JOIN 
    mhl_rubrieken AS R1 ON R2.parent = R1.id
LEFT JOIN 
    mhl_suppliers_mhl_rubriek_view AS RV ON R2.id = RV.mhl_rubriek_view_ID
LEFT JOIN 
    mhl_suppliers AS SP ON RV.mhl_suppliers_ID = SP.id
GROUP BY 
    rubrieknaam
ORDER BY 
    rubrieknaam;
