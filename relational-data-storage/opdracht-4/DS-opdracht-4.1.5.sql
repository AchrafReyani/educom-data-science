SELECT S.name, S.straat, S.huisnr, S.postcode, PC.lat, PC.lng 
FROM mhl_suppliers AS S, pc_lat_long AS PC 
WHERE S.postcode = PC.pc6 
ORDER BY PC.lat 
DESC LIMIT 5;

