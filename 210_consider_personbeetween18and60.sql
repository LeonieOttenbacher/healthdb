-- Personen jünger als 18 Jahre und älter als 60 Jahre sollen nicht betrachtet werden (Stichtag 16.05.2024)

UPDATE Proband
SET isactive = 0
WHERE birthday > '2006-05-16' OR birthday < '1964-05-16';