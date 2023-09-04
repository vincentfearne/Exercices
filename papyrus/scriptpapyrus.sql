CREATE DATABASE papyrus;

USE papyrus;

CREATE TABLE Produit(
   CODART CHAR(4),
   LIBART VARCHAR(15) NOT NULL,
   STKALE INT NOT NULL,
   STKPHY INT NOT NULL,
   QTEANN INT NOT NULL,
   UNIMES CHAR(5) NOT NULL,
   PRIMARY KEY(CODART)
);

CREATE TABLE FOURNIS(
   NUMFOU SMALLINT,
   NOMFOU VARCHAR(25) NOT NULL,
   RUEFOU VARCHAR(50) NOT NULL,
   POSFOU CHAR(5) NOT NULL,
   VILFOU VARCHAR(30) NOT NULL,
   CONFOU VARCHAR(15) NOT NULL,
   SATISF SMALLINT,
   PRIMARY KEY(NUMFOU)
);

CREATE TABLE ENTCOM(
   NUMCOM INT,
   OBSCOM VARCHAR(50),
   DATCOM DATE NOT NULL,
   NUMFOU SMALLINT,
   PRIMARY KEY(NUMCOM),
   FOREIGN KEY(NUMFOU) REFERENCES FOURNIS(NUMFOU)
);

CREATE TABLE LIGCOM(
   NUMLIG SMALLINT,
   QTECDE INT NOT NULL,
   PRIUNI DECIMAL(9,2) NOT NULL,
   QTELIV INT,
   DERLIV DATE NOT NULL,
   NUMCOM INT,
   CODART CHAR(4),
   PRIMARY KEY(NUMLIG),
   FOREIGN KEY(NUMCOM) REFERENCES ENTCOM(NUMCOM),
   FOREIGN KEY(CODART) REFERENCES Produit(CODART)
);

CREATE TABLE VENTE(
   CODART CHAR(4),
   NUMFOU SMALLINT,
   DELLIV SMALLINT NOT NULL,
   QTE1 INT NOT NULL,
   PRIX1 DECIMAL(9,2) NOT NULL,
   QTE2 INT,
   PRIX2 DECIMAL(9,2),
   QTE3 INT,
   PRIX3 DECIMAL(9,2),
   PRIMARY KEY(CODART, NUMFOU),
   FOREIGN KEY(CODART) REFERENCES Produit(CODART),
   FOREIGN KEY(NUMFOU) REFERENCES FOURNIS(NUMFOU)
);

CREATE INDEX index1
ON ENTCOM ( NUMFOU );

