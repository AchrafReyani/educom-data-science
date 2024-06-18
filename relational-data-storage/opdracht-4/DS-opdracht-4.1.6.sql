SELECT HC.hitcount, S.name AS Leverancier, CI.name AS Stad, CO.name AS Gemeente, D.name AS Provincie
FROM mhl_suppliers AS S
JOIN mhl_hitcount AS HC ON S.id = HC.supplier_ID
JOIN mhl_cities AS CI ON S.city_ID = CI.id
JOIN mhl_communes AS CO ON CI.commune_ID = CO.id
JOIN mhl_districts AS D ON CO.district_ID = D.id
WHERE HC.year = 2014 AND HC.month = 1 AND (D.name = 'Limburg' OR D.name = 'Noord-Brabant' OR D.name='Zeeland');
