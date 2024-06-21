SELECT 
    c1.name AS plaatsname,
    c1.commune_ID AS gemeente1_Id,
    co1.name AS gemeente1name,
    c2.commune_ID AS gemeente2_Id,
    co2.name AS gemeente2name
FROM 
    mhl_cities c1
JOIN 
    mhl_cities c2 ON c1.name = c2.name AND c1.id <> c2.id
JOIN 
    mhl_communes co1 ON c1.commune_ID = co1.id 
JOIN 
    mhl_communes co2 ON c2.commune_ID = co2.id
ORDER BY 
    c1.name;
