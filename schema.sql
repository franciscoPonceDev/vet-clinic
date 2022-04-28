/* Database schema to keep the structure of entire database. */

CREATE TABLE animals
(
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    date_of_birth date,
    escape_attempts integer DEFAULT 0,
    neutered boolean,
    weight_kg numeric,
    PRIMARY KEY (id)
);
