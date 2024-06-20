SELECT S.name, S.straat, S.huisnr, S.postcode 
FROM mhl_yn_properties AS PS 
JOIN mhl_suppliers AS S ON PS.supplier_ID = S.id 
JOIN mhl_propertytypes AS P ON PS.propertytype_ID = P.id 
WHERE P.name = 'specialistische leverancier' OR P.name = 'ook voor particulieren';