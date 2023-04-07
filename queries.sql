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