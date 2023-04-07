/*Queries that provide answers to the questions from all projects.*/

 SELECT * from animals WHERE name LIKE '%mon';
 SELECT name from animals WHERE date_of_birth between '2016-01-01' and '2019-12-30';
 SELECT name from animals WHERE neutered= true and escape_attempts <3;
 SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');
 SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5;
 SELECT * from animals where neutered = true;
 SELECT * from animals WHERE name not IN('Gabumon');
 SELECT * from animals WHERE weight_kg between 10.4 and 17.3;
