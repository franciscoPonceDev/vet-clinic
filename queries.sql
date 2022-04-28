SELECT
  *
FROM
  animals
WHERE
  name LIKE '%mon%';

SELECT
  name
FROM
  animals
WHERE
  date_of_birth BETWEEN '2016-01-01'
  AND '2019-01-01';

SELECT
  name
FROM
  animals
WHERE
  neutered = true
  AND escape_attempts < 3;

SELECT
  date_of_birth
FROM
  animals
WHERE
  name IN ('Agumon', 'Pikachu');

SELECT
  name,
  escape_attempts
FROM
  animals
WHERE
  weight_kg > 10.5;

SELECT
  *
from
  animals
WHERE
  neutered = true;

SELECT
  *
from
  animals
WHERE
  name != 'Gabumon';

SELECT
  *
from
  animals
WHERE
  weight_kg BETWEEN 10.4
  AND 17.3;

BEGIN TRANSACTION;
UPDATE animals
SET species = 'unspecified';

SELECT name,species FROM animals;

ROLLBACK TRANSACTION;

SELECT name,species FROM animals;

BEGIN TRANSACTION;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon%';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

SELECT name,species FROM animals;

COMMIT TRANSACTION;

SELECT name,species FROM animals;

BEGIN TRANSACTION;

DELETE FROM animals;

SELECT * FROM animals;

ROLLBACK TRANSACTION;

SELECT * FROM animals;

BEGIN TRANSACTION;

DELETE FROM animals WHERE date_of_birth > '2022-1-1';

SELECT name, date_of_birth FROM animals;

SAVEPOINT S1;

UPDATE animals
SET weight_kg = weight_kg * (-1);

SELECT name, weight_kg from animals;

ROLLBACK TO S1;

UPDATE animals
SET weight_kg = weight_kg * (-1)
WHERE weight_kg < 0;

SELECT name, weight_kg from animals;

COMMIT TRANSACTION;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, COUNT(escape_attempts) as "Escape count" FROM animals GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-12-31' GROUP BY species;

SELECT
  name,
  full_name as Owner
FROM
  animals
  JOIN owners on animals.owner_id = owners.id
WHERE
  full_name = 'Melody Pond';

SELECT
  A.name,
  S.name as Species
FROM
  animals as A
  JOIN species as S on A.species_id = S.id
WHERE
  S.name = 'Pokemon';

SELECT
  full_name as Owner,
  name
FROM
  animals
  RIGHT JOIN owners on animals.owner_id = owners.id;

SELECT
  COUNT(A.name),
  S.name as Species
FROM
  species as S
  JOIN animals as A on S.id = A.species_id
GROUP BY
  S.name;

SELECT
  A.name,
  full_name as Owner,
  S.name as Species
FROM
  animals as A
  JOIN owners on A.owner_id = owners.id
  JOIN species as S on A.species_id = S.id
WHERE
  S.name = 'Digimon'
  AND full_name = 'Jennifer Orwell';

SELECT
  A.name,
  full_name as Owner,
  escape_attempts
FROM
  animals as A
  JOIN owners on A.owner_id = owners.id
WHERE
  escape_attempts = 0
  AND full_name = 'Dean Winchester';

SELECT
  COUNT(*),
  full_name as Owner
FROM
  animals as A
  JOIN owners on A.owner_id = owners.id
GROUP BY
  full_name
ORDER BY
  COUNT(*) desc
LIMIT
  1;