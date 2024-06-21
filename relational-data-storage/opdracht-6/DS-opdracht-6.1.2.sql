WITH SupplierHitcounts AS (
    SELECT
        s.id AS supplier_id,
        s.name AS leverancier,
        c.commune_ID AS commune_id,
        com.name AS gemeente,
        SUM(h.hitcount) AS totaalHitcount
    FROM
        mhl_suppliers s
        JOIN mhl_cities c ON s.city_ID = c.id
        JOIN mhl_communes com ON c.commune_ID = com.id
        JOIN mhl_hitcount h ON s.id = h.supplier_ID
        JOIN mhl_districts d ON com.district_ID = d.id
    WHERE
        d.country_ID = (SELECT id FROM mhl_countries WHERE name = 'Nederland')
    GROUP BY
        s.id, s.name, c.commune_ID, com.name
),
MunicipalityAverages AS (
    SELECT
        com.id AS commune_id,
        AVG(h.hitcount) AS avgHitcount
    FROM
        mhl_hitcount h
        JOIN mhl_suppliers s ON h.supplier_ID = s.id
        JOIN mhl_cities c ON s.city_ID = c.id
        JOIN mhl_communes com ON c.commune_ID = com.id
        JOIN mhl_districts d ON com.district_ID = d.id
    WHERE
        d.country_ID = (SELECT id FROM mhl_countries WHERE name = 'Nederland')
    GROUP BY
        com.id
)
SELECT
    sh.gemeente,
    sh.leverancier,
    sh.totaalHitcount,
    ma.avgHitcount,
    sh.totaalHitcount - ma.avgHitcount AS verschil
FROM
    SupplierHitcounts sh
    JOIN MunicipalityAverages ma ON sh.commune_id = ma.commune_id
WHERE
    sh.totaalHitcount > ma.avgHitcount
ORDER BY
    verschil DESC;
