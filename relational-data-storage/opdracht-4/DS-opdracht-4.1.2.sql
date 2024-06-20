SELECT mhl_suppliers.name, mhl_suppliers.straat, mhl_suppliers.huisnr, mhl_suppliers.postcode , mhl_cities.name AS plaatsnaam 
FROM mhl_suppliers 
JOIN mhl_cities ON mhl_suppliers.city_ID=mhl_cities.ID 
JOIN mhl_communes ON mhl_cities.commune_ID=mhl_communes.ID AND mhl_communes.name="steenwijkerland";
