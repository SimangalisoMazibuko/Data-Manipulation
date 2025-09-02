-- SIMANGALISO MAZIBUKO: Getting Data on Wind Energy Consumption In The World Tracking The Countries with The Highest Wind Energy Consumption along With the Average Use Worldy To Track If People Are using This renewable Energy Source
SELECT *, AVG(CAST([Wind (TWh - equivalent)] AS DECIMAL(10,2))) OVER (PARTITION BY [Year]) AS Average_Wind_Consumption
FROM [Portfolio Projects]..[primary-energy-wind]
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
    CAST([Wind (TWh - equivalent)] AS DECIMAL(10,2)) DESC
