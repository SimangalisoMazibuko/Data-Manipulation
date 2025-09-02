-- SIMANGALISO MAZIBUKO : GETTING DATA ON SOLAR CONSUMPTION AND TRACKING TOP SOLAR ENERGY CONSUMING COUNTRIES ALONG WITH WORLD AVERAGE TO TRACK SHIFT IN RENEWABLE ENERGY USE

SELECT *,  AVG(CAST([Electricity from solar - TWh] AS DECIMAL(10,2))) OVER (PARTITION BY [Year]) AS Average_Solar_Consumption -- CHANGE Star for specific column(s) to view
FROM [Portfolio Projects]..[solar-energy-consumption] -- Database you are using and specific table of data you using [] = good practice
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
          -- Can be used to select/omit specific Row for multiple use IN('','','') Can only use '%' in 'LIKE'

ORDER BY [Year], -- Used to set an order (ASC first column default) of data 
         CAST([Electricity from solar - TWh] AS DECIMAL(10, 2)) DESC -- Used to arrange data but also use 'CAST' as original data is string and 'AS DECIMAL' to convert to decimal (10, 2)