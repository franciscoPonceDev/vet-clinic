/* Database schema to keep the structure of entire database. */

CREATE TABLE animals
(
    id int NOT NULL IDENTITY(1,1),
    name character varying(100) NOT NULL,
    date_of_birth date,
    escape_attempts integer DEFAULT 0,
    neutered boolean,
    weight_kg numeric,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS animals
    ADD COLUMN species character varying;

CREATE TABLE owners(
    id serial PRIMARY KEY,
    full_name character varying(100),
    age INT
);

CREATE TABLE species(
    id serial PRIMARY KEY,
    name character varying(100)
);

ALTER TABLE
    animals
DROP 
    COLUMN species,
ADD
    COLUMN species_id INT references species(id),
ADD
    COLUMN owner_id INT references owners(id);