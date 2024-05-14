-- Sucht nicht valide Email-Adressen aus dem Datenbestand

SELECT Email
FROM Proband
WHERE NOT Email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$';