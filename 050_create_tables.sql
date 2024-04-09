# Land-Tabelle

CREATE TABLE IF NOT EXISTS Laender (
    Land_ID INT AUTO_INCREMENT PRIMARY KEY,
    CC CHAR(2),
    Name VARCHAR(100)
);

# Probanden-Tabelle
CREATE TABLE IF NOT EXISTS Probanden(
    Probanden_ID INT AUTO_INCREMENT PRIMARY KEY,
    Vorname VARCHAR(50),
    Nachname VARCHAR(50),
    Email VARCHAR(100),
    Geschlecht ENUM('M','F','D'),
    Geburtstag DATE,
    KGewicht DECIMAL(5,2),
    KGroesse DECIMAL(5,2),
    Land_ID INT,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (Land_ID) REFERENCES Laender(Land_ID)
);


 # Krankheiten-Tabelle
CREATE TABLE IF NOT EXISTS Krankheiten(
    Krankheits_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100)
);

# Medikamente-Tabelle
CREATE TABLE IF NOT EXISTS Medikamente(
    Medikamenten_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100)
);

# Verknüpfung Probanden-Krankheiten
CREATE TABLE  Probanden_Krankheiten(
    Probanden_ID INT,
    Krankheits_ID INT,
    PRIMARY KEY (Probanden_ID,Krankheits_ID),
    FOREIGN KEY (Probanden_ID) REFERENCES Probanden(Probanden_ID),
    FOREIGN KEY (Krankheits_ID) REFERENCES Krankheiten(Krankheits_ID)
);

# Verknüpfung Probanden-Medikamente
CREATE TABLE Probanden_Medikamente(
    Probanden_ID INT,
    Medikamente_ID INT,
    PRIMARY KEY (Probanden_ID,Medikamente_ID),
    FOREIGN KEY (Probanden_ID) REFERENCES Probanden(Probanden_ID),
    FOREIGN KEY (Medikamente_ID) REFERENCES Medikamente(Medikamenten_ID)
);



