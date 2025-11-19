-- DDL : DATA DEFINITION LANGUAGE
-- Pour faire un commentaire, on utilise deux "-" suivi d'un espace

-- Création d'une base de données
-- La création d'une base de données dans postgreSQL implique de créer
-- une seconde connexion pour pouvoir y accéder!
CREATE DATABASE demo01;

-- Suppression d'une base de données
DROP DATABASE demo01;

-- Ajout d'un commentaire sur une base de données
COMMENT ON DATABASE postgres IS 'base de données principale';


-- CREATE <type objet> <nom>;
CREATE SCHEMA entreprise_demo;

-- Ne lève pas d'erreur si l'objet existe déjà
CREATE SCHEMA IF NOT EXISTS entreprise_demo;

-- Suppression du schéma
DROP SCHEMA IF EXISTS entreprise_demo;

---------------------------------------
--------- CREATE TABLE ----------------
---------------------------------------

-- Pour créer une table, on utilise l'instruction CREATE TABLE
-- On peut vérifier que la table n'existe pas avant de la créer
-- Pour être sûr de créer la table au bon endroit, on peut la préfixer du schéma
CREATE TABLE IF NOT EXISTS entreprise_demo.services (
	-- <nom table> <type> <contraintes>
	service_id SERIAL PRIMARY KEY,
	libelle VARCHAR(100) NOT NULL
);

-- Suppression d'une table si elle existe
DROP TABLE IF EXISTS entreprise_demo.services;

CREATE TYPE secteur_enum AS ENUM ('INFO', 'GESTION', 'RD');

CREATE TABLE IF NOT EXISTS entreprise_demo.salarie (
	-- Fait la même chose que SERIAL, càd utilise le méchanisme de séquence
	-- Respecte au mieux la convention SQL
	salarie_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	-- On précise NOT NULL, par défaut la valeur peut être nulle
	prenom VARCHAR(50) NOT NULL,
	nom VARCHAR(50) NOT NULL,
	-- La contrainte check permet d'ajouter un méchanisme de vérification
	-- Les mots réservés du langage peuvent être notés entre guillemets
	"age" INT NOT NULL CHECK("age" > 18 AND "age" < 65),
	"status" TEXT NOT NULL CHECK ("status" IN ('STAGIAIRE', 'EMPLOYER', 'MANAGER')),
	secteur secteur_enum NOT NULL ,

	-- La contrainte default permet de définir une valeur par défaut en cas d'absence de valeur renseignée
	salaire DECIMAL(6, 2) DEFAULT 1500,
	service_id INT NOT NULL,
	-- Contrainte qui permet de lier la colonne service_id à la table à laquelle elle fait référence
	CONSTRAINT fk_service_id FOREIGN KEY(service_id) 
	REFERENCES entreprise_demo.services(service_id)
);


-- Modification d'une table
ALTER TABLE entreprise_demo.salarie
	RENAME TO salaries;

-- Suppression d'une contrainte
ALTER TABLE entreprise_demo.salaries
	DROP CONSTRAINT fk_service_id;

-- Ajout d'une contrainte
ALTER TABLE entreprise_demo.salaries
	ADD CONSTRAINT fk_service_id
	FOREIGN KEY(service_id) REFERENCES entreprise_demo.services(service_id);

-- Création d'une colonne
ALTER TABLE entreprise_demo.services
	ADD COLUMN date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- Modification d'une colonnegit 
ALTER TABLE entreprise_demo.services
	ALTER COLUMN date_creation TYPE DATE;


