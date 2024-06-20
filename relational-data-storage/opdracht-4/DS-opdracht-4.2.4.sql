SELECT SP.name AS 'mhl_suppliers.name', PT.name AS 'mhl_propertytypes.name', IFNULL(YN.content, 'NOT SET') AS value 
FROM mhl_suppliers AS SP 
JOIN mhl_cities AS CI ON SP.city_ID = CI.id 
CROSS JOIN mhl_propertytypes AS PT 
LEFT JOIN mhl_yn_properties AS YN ON SP.id = YN.supplier_ID AND PT.id = YN.propertytype_ID 
WHERE CI.name = 'amsterdam' AND PT.proptype = "A";