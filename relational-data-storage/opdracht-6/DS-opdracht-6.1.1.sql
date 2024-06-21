SELECT h.year AS year,
       CASE 
           WHEN MONTHNAME(CONCAT(h.year, '-', h.month, '-', '1')) = 'January' THEN 'januari'
           WHEN MONTHNAME(CONCAT(h.year, '-', h.month, '-', '1')) = 'February' THEN 'februari'
           WHEN MONTHNAME(CONCAT(h.year, '-', h.month, '-', '1')) = 'March' THEN 'maart'
           WHEN MONTHNAME(CONCAT(h.year, '-', h.month, '-', '1')) = 'April' THEN 'april'
           WHEN MONTHNAME(CONCAT(h.year, '-', h.month, '-', '1')) = 'May' THEN 'mei'
           WHEN MONTHNAME(CONCAT(h.year, '-', h.month, '-', '1')) = 'June' THEN 'juni'
           WHEN MONTHNAME(CONCAT(h.year, '-', h.month, '-', '1')) = 'July' THEN 'juli'
           WHEN MONTHNAME(CONCAT(h.year, '-', h.month, '-', '1')) = 'August' THEN 'augustus'
           WHEN MONTHNAME(CONCAT(h.year, '-', h.month, '-', '1')) = 'September' THEN 'september'
           WHEN MONTHNAME(CONCAT(h.year, '-', h.month, '-', '1')) = 'October' THEN 'oktober'
           WHEN MONTHNAME(CONCAT(h.year, '-', h.month, '-', '1')) = 'November' THEN 'november'
           WHEN MONTHNAME(CONCAT(h.year, '-', h.month, '-', '1')) = 'December' THEN 'december'
       END AS month,
       COUNT(h.supplier_ID) AS 'aantal leveranciers',
       SUM(h.hitcount) AS 'totaal aantal hits'
FROM mhl_hitcount h
GROUP BY h.year, h.month
ORDER BY h.year DESC, h.month DESC;