SELECT mhl_cities.name, IFNULL(mhl_communes.name, "INVALID") 
FROM mhl_cities 
LEFT JOIN mhl_communes ON mhl_communes.id = mhl_cities.commune_ID;