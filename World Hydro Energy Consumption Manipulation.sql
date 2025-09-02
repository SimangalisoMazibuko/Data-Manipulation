-- SIMANGALISO MAZIBUKO: Getting Data on consumption of HydroElectric Energy to track the top hydroElectric Energy Consuming Countries with World average each year to track usage of Renewable Energy sources
SELECT *, AVG(CAST([Hydro (% equivalent primary energy)] AS DECIMAL(10,2))) OVER (PARTITION BY [Year]) AS Average_Hydro_Consumption
FROM [Portfolio Projects]..[hydro-share-energy]
WHERE [Entity] NOT IN ('World')
    AND [Entity] NOT LIKE '%ASIA%'
    AND [Entity] NOT LIKE '%EUROPE%'
    AND [Entity] NOT LIKE 'Africa%'
    AND [Entity] NOT LIKE '%OCEAnia%'
    AND [Entity] NOT LIKE '%NORTH America%'
    AND [Entity] NOT LIKE '%South America%'
    AND [Entity] NOT LIKE '%income%'
    AND [Entity] NOT LIKE '%G%'
    AND [Entity] NOT LIKE '%OECD%'
    AND [Entity] NOT LIKE '%(Ember)%'
    AND [Entity] NOT LIKE '%(EI)%'
    -- AND [Year] = 2024
ORDER BY [Year],
    CAST([Hydro (% equivalent primary energy)] AS DECIMAL(10,2)) DESC

