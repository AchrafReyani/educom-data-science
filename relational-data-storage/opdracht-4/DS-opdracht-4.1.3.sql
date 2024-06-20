SELECT RU.name, SP.name, straat, huisnr, postcode, RU.id, RU.parent, CI.name 
FROM mhl_suppliers AS SP 
JOIN mhl_suppliers_mhl_rubriek_view AS RV ON SP.id = RV.mhl_suppliers_ID 
JOIN mhl_rubrieken AS RU ON RV.mhl_rubriek_view_ID = RU.id JOIN mhl_cities AS CI ON SP.city_ID = CI.id AND CI.name = 'Amsterdam' 
WHERE RU.id = 235 OR RU.parent = 235 
ORDER BY RU.name, SP.name;
