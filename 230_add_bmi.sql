# neue Spalte hinzufügen
ALTER TABLE Proband
ADD COLUMN bmi FLOAT;

#Berechnung des BMI und Speicherung in der neuen Spalte, unter Verwendung einer WHERE-Bedingung mit einer Schlüsselspalte
UPDATE Proband
SET bmi = weight / ((height / 100) * (height / 100))
WHERE id > 0;
