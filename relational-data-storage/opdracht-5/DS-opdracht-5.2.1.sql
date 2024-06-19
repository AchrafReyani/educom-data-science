SELECT 
    s.name AS naam,
    COALESCE(con.name, 't.a.v. de directie') AS aanhef,
    CASE 
        WHEN s.p_address <> '' THEN s.p_address 
        ELSE CONCAT(s.straat, ' ', s.huisnr) 
    END AS adres,
    CASE 
        WHEN s.p_address <> '' THEN c_p.name 
        ELSE c.name 
    END AS stad,
    CASE 
        WHEN s.p_address <> '' THEN s.p_postcode 
        ELSE s.postcode 
    END AS postcode,
    IF(
        s.p_address = '',
        (SELECT d.name AS provincie 
         FROM mhl_districts AS d 
         WHERE d.id = (SELECT district_ID 
                      FROM mhl_communes 
                      WHERE id = (SELECT commune_ID 
                                 FROM mhl_cities 
                                 WHERE id = s.city_ID))
        ),
        (SELECT d.name AS provincie 
         FROM mhl_districts AS d 
         WHERE d.id = (SELECT district_ID 
                      FROM mhl_communes 
                      WHERE id = (SELECT commune_ID 
                                 FROM mhl_cities 
                                 WHERE id = s.p_city_ID))
        )
    ) AS provincie
FROM 
    mhl_suppliers AS s
LEFT JOIN 
    mhl_contacts AS con ON s.id = con.supplier_ID
LEFT JOIN 
    mhl_cities AS c ON s.city_ID = c.id
LEFT JOIN 
    mhl_cities AS c_p ON s.p_city_ID = c_p.id
WHERE 
    s.p_address <> '' OR s.straat <> ''
ORDER BY 
    provincie, stad, naam;
