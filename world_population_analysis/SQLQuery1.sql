--Query 1: Total Population by Year

SELECT 
    SUM(pop1980) AS total_pop_1980,
    SUM(pop2000) AS total_pop_2000,
    SUM(pop2010) AS total_pop_2010,
    SUM(pop2023) AS total_pop_2023,
    SUM(pop2024) AS total_pop_2024,
    SUM(pop2030) AS total_pop_2030,
    SUM(pop2050) AS total_pop_2050
FROM 
    countries_table;


--Query 2: Population Growth by Country (1980 - 2023)

SELECT 
    country,
    pop1980,
    pop2023,
    ROUND(((pop2023 - pop1980) / CAST(pop1980 AS FLOAT)) * 100, 2) AS growth_rate_1980_2023
FROM 
    countries_table
ORDER BY 
    growth_rate_1980_2023 DESC;

--Query 3: Top 10 Most Populous Countries in 2023

SELECT TOP 10
    country,
    pop2023
FROM 
    countries_table
ORDER BY 
    pop2023 DESC;


--Query 4: Top 10 Countries by Projected Growth (2023 - 2050)

SELECT TOP 10 
    country,
    pop2023,
    pop2050,
    ROUND(((CAST(pop2050 AS FLOAT) - pop2023) / pop2023) * 100, 2) AS projected_growth_2023_2050
FROM 
    countries_table
ORDER BY 
    projected_growth_2023_2050 DESC;

--Query 5: Countries with the Highest Population Density in 2023

SELECT TOP 10 
    country,
    pop2023,
    landAreaKm,
    ROUND((CAST(pop2023 AS FLOAT) / landAreaKm), 2) AS density_2023
FROM 
    countries_table
ORDER BY 
    density_2023 DESC;

--Query 6: UN Member Population Contribution in 2023

SELECT 
    SUM(pop2023) AS total_un_population,
    ROUND((SUM(pop2023) * 100.0 / (SELECT SUM(pop2023) FROM countries_table)), 2) AS un_population_percentage
FROM 
    countries_table
WHERE 
    unMember = 1; 

--Query 7: Top 10 Most Populous Countries in 2023 and 2050

SELECT TOP 10 
    country,
    pop2023,
    pop2050
FROM 
    countries_table
ORDER BY 
    pop2023 DESC;

