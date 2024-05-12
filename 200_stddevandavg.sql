
-- Standardabweicung Gewicht
SELECT STDDEV(weight) FROM Proband WHERE gender = 1; -- 1 = Männer
SELECT STDDEV(weight) FROM Proband WHERE gender = 2; -- 2 = Frauen

-- Mittelwert Gewicht
SELECT avg(weight) FROM Proband WHERE gender = 1; -- 1 = Männer
SELECT avg(weight) FROM Proband WHERE gender = 2; -- 2 = Frauen

-- Standardabweichung Größe
SELECT STDDEV(height) FROM Proband WHERE gender = 1; -- 1 = Männer
SELECT STDDEV(height) FROM Proband WHERE gender = 2; -- 2 = Frauen

-- Mittelwert Größe
SELECT avg(height) FROM Proband WHERE gender = 1; -- 1 = Männer
SELECT avg(height) FROM Proband WHERE gender = 2; -- 2 = Frauen

-- Ziel:
-- Mittelwert: Männer: 180cm und 88kg
-- Mittelwert Frauen: 167cm und 69kg

-- Aktuell:
-- Mittelwert: Männer: 176cm und 80kg
-- Mittelwert: Frauen: 174cm und 80kg



Update Proband set height= height + 4  where gender = 1;
Update Proband set weight= weight + 8  where gender = 1;

Update Proband set height= height - 7, weight= weight - 11   where gender = 2;
