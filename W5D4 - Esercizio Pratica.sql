CREATE SCHEMA IF NOT EXISTS PalestraDB;
USE PalestraDB;

CREATE TABLE IF NOT EXISTS Istruttore (
    ID_Istruttore INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(50),
    Cognome VARCHAR(50),
    Specializzazione VARCHAR(100),
    CONSTRAINT PK_Istruttore PRIMARY KEY (ID_Istruttore)
);

CREATE TABLE IF NOT EXISTS Attivita (
    ID_Attivita INT NOT NULL AUTO_INCREMENT,
    NomeAttivita VARCHAR(50),
    Orario TIME,
    GiornoSettimana VARCHAR(100),
    Durata INT,
    ID_Istruttore INT,
    CONSTRAINT PK_Attivita PRIMARY KEY (ID_Attivita),
    CONSTRAINT FK_Attivita_Istruttore FOREIGN KEY (ID_Istruttore) 
        REFERENCES Istruttore(ID_Istruttore)
);

CREATE TABLE IF NOT EXISTS Socio (
    ID_Socio INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(50),
    Cognome VARCHAR(50),
    DataNascita DATE,
    ContattoTelefonico VARCHAR(20),
    CONSTRAINT PK_Socio PRIMARY KEY (ID_Socio)
);

CREATE TABLE IF NOT EXISTS Iscrizione (
    ID_Iscrizione INT NOT NULL AUTO_INCREMENT,
    DataIscrizione DATE,
    DataFineIscrizione DATE,
    StatoIscrizione VARCHAR(20),
    ID_Socio INT NOT NULL,
    ID_Attivita INT NOT NULL,
    CONSTRAINT PK_Iscrizione PRIMARY KEY (ID_Iscrizione),
    CONSTRAINT FK_Iscrizione_Socio FOREIGN KEY (ID_Socio) 
        REFERENCES Socio(ID_Socio),
    CONSTRAINT FK_Iscrizione_Attivita FOREIGN KEY (ID_Attivita) 
        REFERENCES Attivita(ID_Attivita)
);

INSERT INTO Istruttore (Nome, Cognome, Specializzazione) 
VALUES
('Marco', 'Rossi', 'Yoga'),
('Anna', 'Bianchi', 'Pilates'),
('Luca', 'Verdi', 'Sollevamento Pesi');

INSERT INTO Attivita (NomeAttivita, Orario, GiornoSettimana, Durata, ID_Istruttore) 
VALUES
('Yoga Mattutino', '08:00:00', 'Lunedì, Mercoledì, Venerdì', 60, 1),
('Pilates Serale', '18:30:00', 'Martedì, Giovedì', 45, 2),
('Allenamento Pesi', '17:00:00', 'Lunedì, Mercoledì, Venerdì', 90, 3);

INSERT INTO Socio (Nome, Cognome, DataNascita, ContattoTelefonico) 
VALUES
('Giulia', 'Neri', '1990-05-15', '3331234567'),
('Paolo', 'Gialli', '1985-10-22', '3345678901'),
('Sara', 'Blu', '1995-03-08', '3356789012');

INSERT INTO Iscrizione (DataIscrizione, DataFineIscrizione, StatoIscrizione, ID_Socio, ID_Attivita) 
VALUES
('2023-01-10', '2023-12-31', 'Attiva', 1, 1),
('2023-02-15', '2023-12-31', 'Attiva', 2, 2),
('2023-03-20', '2023-12-31', 'Scaduta', 3, 3);