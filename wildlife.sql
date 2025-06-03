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
