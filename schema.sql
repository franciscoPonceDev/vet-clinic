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
