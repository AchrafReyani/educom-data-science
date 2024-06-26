SELECT DATE_FORMAT(joindate, GET_FORMAT(DATE, 'EUR')) AS joindate_EUR, id
FROM mhl_suppliers
WHERE DAYOFMONTH(joindate) BETWEEN DAYOFMONTH(DATE_SUB(LAST_DAY(joindate), INTERVAL 7 DAY)) AND DAYOFMONTH(LAST_DAY(joindate))