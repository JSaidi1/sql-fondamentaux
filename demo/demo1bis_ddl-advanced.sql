CREATE SCHEMA demo_padawan;
SET search_path TO 'demo_padawan', '$user', 'public';

CREATE TABLE IF NOT EXISTS padawan (
	padawan_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS niveau (
	niveau_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	libelle VARCHAR(50) NOT NULL UNIQUE,
	bonus INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS parcours (
	parcours_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	date_parcours DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	padawan_id INT NOT NULL,
	CONSTRAINT fk_padawan_id FOREIGN KEY(padawan_id) REFERENCES padawan(padawan_id)
);

CREATE TABLE IF NOT EXISTS obstacle (
	obstacle_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nom VARCHAR(30) NOT NULL,
	note_minimum INTEGER NOT NULL DEFAULT 0,
	niveau_id INT NOT NULL,
		CONSTRAINT fk_niveau_id FOREIGN KEY(niveau_id) REFERENCES niveau(niveau_id)
);

CREATE TABLE IF NOT EXISTS parcours_obstacle (
	parcours_id INT NOT NULL,
	obstacle_id INT NOT NULL,
	note INTEGER NOT NULL,
	temps TIME NOT NULL,
	CONSTRAINT pk_parcours_obstacle PRIMARY KEY(parcours_id, obstacle_id),
	CONSTRAINT fk_parcours_id FOREIGN KEY(parcours_id) REFERENCES parcours(parcours_id),
	CONSTRAINT fk_obstacle_id FOREIGN KEY(obstacle_id) REFERENCES obstacle(obstacle_id)
);

CREATE TABLE IF NOT EXISTS parcours_obstacle (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	parcours_id INT NOT NULL,
	obstacle_id INT NOT NULL,
	note INTEGER NOT NULL,
	temps TIME NOT NULL,
	CONSTRAINT fk_parcours_id FOREIGN KEY(parcours_id) REFERENCES parcours(parcours_id),
	CONSTRAINT fk_obstacle_id FOREIGN KEY(obstacle_id) REFERENCES obstacle(obstacle_id)
);