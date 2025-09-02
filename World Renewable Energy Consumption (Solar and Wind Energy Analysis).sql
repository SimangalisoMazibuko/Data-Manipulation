-- SIMANGALISO MAZIBUKO: JOINING 3 DIFFERENT DATA SOURCES OF RENEWABLE ENERGY FOR ANALYSIS (SOLAR + HYDRO + WIND)
SELECT so_1.[Entity], so_1.[Year], so_1.[Electricity from solar - TWh] AS Solar_Energy_Consumption, wi.[Wind (TWh - equivalent)] AS Wind_Energy_Consumption, (CAST([Electricity from solar - TWh] AS DECIMAL(10, 2))+ CAST([Wind (TWh - equivalent)] AS DECIMAL(10,2)))/2 AS Average_Renewable_Energy_Consumption
FROM [Portfolio Projects]..[solar-energy-consumption] so_1 -- JOINING TWO TABLES TO FIRST ONE
JOIN [Portfolio Projects]..[hydro-share-energy] hy
    ON so_1.[Entity] = hy.[Entity] 
    AND so_1.[Year] = hy.[Year]

JOIN [Portfolio Projects]..[primary-energy-wind] wi
   ON so_1.[Entity] = wi.[Entity]
   AND so_1.[Year] = wi.[Year]
WHERE so_1.[Entity] NOT IN('World')
    AND so_1.[Entity] NOT LIKE '%ASIA%'
    AND so_1.[Entity] NOT LIKE '%EUROPE%'
    AND so_1.[Entity] NOT LIKE 'Africa%'
    AND so_1.[Entity] NOT LIKE '%OCEAnia%'
    AND so_1.[Entity] NOT LIKE '%NORTH America%'
    AND so_1.[Entity] NOT LIKE '%South America%'
    AND so_1.[Entity] NOT LIKE '%income%'
    AND so_1.[Entity] NOT LIKE '%G%'
    AND so_1.[Entity] NOT LIKE '%OECD%'
    AND so_1.[Entity] NOT LIKE '%(Ember)%'
    AND so_1.[Entity] NOT LIKE '%(EI)%'
    AND so_1.[Year] = 2024

ORDER BY so_1.[Year],
    -- so_1.[Entity]
    (CAST([Electricity from solar - TWh] AS DECIMAL(10, 2))+ CAST([Wind (TWh - equivalent)] AS DECIMAL(10,2)))/2 DESC -- ORDER BY HIGHEST AVERAGE OF WIND and SOLAR ENERGY CONSUMPTION



-- Its Interesting seeing that the Last time United States was leading in Renewable Energy Consumption was 2015 and since then China has been in the lead
-- This obviously shows me that China is trying its best to use Renewable Energy as its main source of energy which in turn really benefits the environment
-- Also if you fiddle with so_1.[Year] you will see that the gap between China's and the United States use of Renewable Energy has increased exponentially since 2016
