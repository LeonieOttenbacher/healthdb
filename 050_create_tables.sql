# Tabelle für Laender

CREATE TABLE IF NOT EXISTS Laender (
    Land_ID INT AUTO_INCREMENT PRIMARY KEY, -- ID für jedes Land
    CC CHAR(2), -- Ländercode
    Name VARCHAR(100) -- Name des Landes
);

# Tabelle für Probanden
CREATE TABLE IF NOT EXISTS Probanden(
    Probanden_ID INT AUTO_INCREMENT PRIMARY KEY,
    Vorname VARCHAR(50),
    Nachname VARCHAR(50),
    Email VARCHAR(100),
    Geschlecht ENUM('M','F','D'), -- Geschlecht des Probanden (männlich, weiblich, divers)
    Geburtstag DATE,
    KGewicht DECIMAL(5,2),  -- Körpergewicht des Probanden
    KGroesse DECIMAL(5,2), -- Körpergröße des Probanden
    Land_ID INT, -- Verweis auf das Herkunftsland des Probanden
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- für Aktualisierungen
    FOREIGN KEY (Land_ID) REFERENCES Laender(Land_ID)
);


 # Tabelle für Krankheiten
CREATE TABLE IF NOT EXISTS Krankheiten(
    Krankheits_ID INT AUTO_INCREMENT PRIMARY KEY, -- ID für jede Krankheit
    Name VARCHAR(100)
);

# Tabelle für Medikamente
CREATE TABLE IF NOT EXISTS Medikamente(
    Medikamenten_ID INT AUTO_INCREMENT PRIMARY KEY, -- ID für jedes Medikament
    Name VARCHAR(100)
);

# Verknüpfungstabelle für Probanden-Krankheiten
CREATE TABLE  Probanden_Krankheiten(
    Probanden_ID INT, -- Verweis auf den Probanden
    Krankheits_ID INT, -- Verweis auf die Krankheit
    PRIMARY KEY (Probanden_ID,Krankheits_ID),
    FOREIGN KEY (Probanden_ID) REFERENCES Probanden(Probanden_ID), -- Fremdschlüsselbeziehung zur Probanden-Tabelle
    FOREIGN KEY (Krankheits_ID) REFERENCES Krankheiten(Krankheits_ID) -- Fremdschlüsselbeziehung zur Krankheiten-Tabelle
);

# Verknüpfungstabelle Probanden-Medikamente
CREATE TABLE Probanden_Medikamente(
    Probanden_ID INT,
    Medikamente_ID INT,
    PRIMARY KEY (Probanden_ID,Medikamente_ID),
    FOREIGN KEY (Probanden_ID) REFERENCES Probanden(Probanden_ID), -- Fremdschlüsselbeziehung zur Probanden-Tabelle
    FOREIGN KEY (Medikamente_ID) REFERENCES Medikamente(Medikamenten_ID) -- Fremdschlüsselbeziehung zur Medikamente-Tabelle
);



