SELECT SP.name, IFNULL(D.contact, 't.a.v. directie') Contact, P.adres, P.postcode, P.stad 
FROM mhl_suppliers AS SP 
JOIN mhl.postadres AS P ON P.ID = SP.ID 
LEFT JOIN mhl.directie AS D ON D.ID = SP.ID;