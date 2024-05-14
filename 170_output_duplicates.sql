#Zählen der Dupletten

SELECT firstname, lastname, email, COUNT(*)
FROM Proband
GROUP BY firstname, lastname, email
-- Es sollen die angezeigt werden, die öfters als einmal vorkommen
HAVING COUNT(*) > 1;

