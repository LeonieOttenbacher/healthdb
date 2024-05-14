# neue Spalte hinzufügen
ALTER TABLE Proband
ADD COLUMN bmi FLOAT;

#Berechnung des BMI und Speicherung in der neuen Spalte
UPDATE Proband
SET bmi = weight / ((height / 100) * (height / 100));

