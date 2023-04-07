/*Queries that provide answers to the questions from all projects.*/

 SELECT * from animals WHERE name LIKE '%mon';
 SELECT name from animals WHERE date_of_birth between '2016-01-01' and '2019-12-30';
 SELECT name from animals WHERE neutered= true and escape_attempts <3;
 SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');
 SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5;
 SELECT * from animals where neutered = true;
 SELECT * from animals WHERE name not IN('Gabumon');
 SELECT * from animals WHERE weight_kg between 10.4 and 17.3;

-- Delete all animals born after Jan 1st, 2022.
 BEGIN transaction;
 DELETE from animals WHERE date_of_birth > '2022-01-01';

--  Create a savepoint for the transaction.
 SAVEPOINT first_savepoint;

-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;

-- Rollback to the savepoint
 ROLLBACK TO first_savepoint;
-- Update all animals' weights that are negative to be their weight multiplied by -1.
 UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
-- Commit transaction
COMMIT;
-- How many animals are there?
 SELECT COUNT(*) FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
-- What is the average weight of animals?
 SELECT AVG(weight_kg) FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, SUM(escape_attempts) AS total_escapes FROM animals GROUP BY neutered ORDER BY total_escapes DESC LIMIT 1;
-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg) AS min_wt, MAX(weight_kg) AS max_wt FROM animals GROUP BY species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
 SELECT species, AVG(escape_attempts) as avg_escapes FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2002-12-31' GROUP BY species;