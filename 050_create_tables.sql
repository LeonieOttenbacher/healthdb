# Tabelle für Laender

CREATE TABLE IF NOT EXISTS Laender (
    Land_ID INT AUTO_INCREMENT PRIMARY KEY, -- ID für jedes Land
    CC CHAR(2), -- Ländercode
    Name VARCHAR(100) -- Name des Landes
);

# Tabelle für Probanden
CREATE TABLE IF NOT EXISTS Proband(
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    Email VARCHAR(100),
    gender INT, -- Geschlecht des Probanden (männlich, weiblich, divers)
    birthday DATE,
    weight DECIMAL(5,2),  -- Körpergewicht des Probanden
    height DECIMAL(5,2), -- Körpergröße des Probanden
    health DECIMAL(5,2),
    isactive BOOL default true,
    Land_ID INT, -- Verweis auf das Herkunftsland des Probanden
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- für Aktualisierungen
    FOREIGN KEY (Land_ID) REFERENCES Laender(Land_ID)
);

create table if not exists Gender(
    id int auto_increment primary key ,
    name VARCHAR(50)
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
    FOREIGN KEY (Probanden_ID) REFERENCES Proband(id), -- Fremdschlüsselbeziehung zur Probanden-Tabelle
    FOREIGN KEY (Krankheits_ID) REFERENCES Krankheiten(Krankheits_ID) -- Fremdschlüsselbeziehung zur Krankheiten-Tabelle
);

# Verknüpfungstabelle Probanden-Medikamente
CREATE TABLE Probanden_Medikamente(
    Probanden_ID INT,
    Medikamente_ID INT,
    PRIMARY KEY (Probanden_ID,Medikamente_ID),
    FOREIGN KEY (Probanden_ID) REFERENCES Proband(id), -- Fremdschlüsselbeziehung zur Probanden-Tabelle
    FOREIGN KEY (Medikamente_ID) REFERENCES Medikamente(Medikamenten_ID) -- Fremdschlüsselbeziehung zur Medikamente-Tabelle
);



