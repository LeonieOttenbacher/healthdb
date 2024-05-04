#Zählen der Dupletten

SELECT firstname, lastname, email, COUNT(*)
FROM Proband
GROUP BY firstname, lastname, email
HAVING COUNT(*) > 1;

