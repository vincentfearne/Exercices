CREATE DATABASE exo_eval;

USE DATABASE exo_eval;



CREATE TABLE Client(
   cli_num INT,
   cli_nom VARCHAR(50),
   cli_adresse VARCHAR(50),
   cli_tel VARCHAR(30),
   PRIMARY KEY(cli_num)
);

CREATE TABLE Commande(
   com_num INT,
   com_date DATETIME,
   com_obs VARCHAR(50),
   cli_num INT NOT NULL,
   PRIMARY KEY(com_num),
   FOREIGN KEY(cli_num) REFERENCES Client(cli_num)
);

CREATE TABLE Produit(
   pro_num INT,
   pro_libelle VARCHAR(50),
   pro_description VARCHAR(50),
   PRIMARY KEY(pro_num)
);

CREATE TABLE est_compose(
   com_num INT,
   pro_num INT,
   est_qte INT,
   PRIMARY KEY(com_num, pro_num),
   FOREIGN KEY(com_num) REFERENCES Commande(com_num),
   FOREIGN KEY(pro_num) REFERENCES Produit(pro_num)
);

CREATE INDEX index_eval
ON Client ( cli_nom );