-- Active: 1748637167568@@127.0.0.1@5432@wildlife conservation
Create Table rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region VARCHAR(50)

)

-- create the table species
CREATE Table species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE,
    conservation_status VARCHAR(50) CHECK (
        conservation_status IN (
            'Endangered',
            'Vulnerable'
        )
    )
);

-- create sightings table
CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT NOT NULL REFERENCES rangers(ranger_id) ON DELETE CASCADE,
    species_id INT NOT NULL  REFERENCES species(species_id) ON DELETE CASCADE,
    sighting_time TIMESTAMP NOT NULL,
    notes VARCHAR(200)
);

CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT NOT NULL REFERENCES rangers(ranger_id) ON DELETE CASCADE,
    species_id INT NOT NULL  REFERENCES species(species_id) ON DELETE CASCADE,
    "location" VARCHAR(50),
    sighting_time TIMESTAMP NOT NULL,
    notes VARCHAR(200)
);
-- insert data into rangers table 

INSERT INTO  rangers(name, region) 
    VALUES('Alice Green', 'Northern Hills'),
          ('Bob White', 'River Delta'),
          ('Carol King', 'Mountain Range');

-- insert data into species table

INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status) VALUES ('Snow Leopard', 'Pantera uncia', '1775-01-01', 'Endangered'),('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'), ('Red Panda', 'Ailurus flgens', '1825-01-01', 'Vulnerable'),('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


--isert data into sightings table
INSERT INTO sightings(species_id, ranger_id, "location", sighting_time, notes ) VALUES(1,1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera tram image c'), (2,2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'), (3,3,'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'), (1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);


-- problem 1
INSERT INTO rangers(name, region) VALUES(
    'Derek Fox', 'Coastal Plains'
);

-- problem 2
SELECT count(DISTINCT species_id) as unique_species_count FROM sightings;

--problem 3
SELECT * FROM sightings
    WHERE "location" LIKE '%Pass%';

-- problem 4 
SELECT name , count(sighting_id) as total_sightings FROM rangers
    JOIN sightings on rangers.ranger_id = sightings.ranger_id
    GROUP BY name
    ORDER BY name;

--problem 5
SELECT common_name FROM species
    WHERE species_id NOT IN (
        SELECT DISTINCT species_id
            FROM sightings
    );

--problem 6 
SELECT common_name, sighting_time, name FROM sightings
     JOIN species on sightings.species_id = species.species_id
     JOIN rangers on sightings.ranger_id = rangers.ranger_id
     ORDER BY sighting_time DESC
     LIMIT 2;