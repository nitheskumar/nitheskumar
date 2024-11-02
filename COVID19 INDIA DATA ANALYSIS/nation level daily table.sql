USE  statedistrictcovid19;



CREATE TABLE IF NOT EXISTS nation_level_daily (
                                              
                                              Date VARCHAR (20) NOT NULL,
                                              DailyConfirmed int,
                                              TotalConfirmed int,
                                              DailyRecovered int,
                                              TotalRecovered int,
                                              DailyDeceased int,
                                              TotalDeceased int
                                              );
  
  select * from nation_level_daily ;
  
  SELECT
    *
FROM nation_level_daily
ORDER BY Date ;


SELECT
	Date,
	COUNT(*) as DailyConfirmed
FROM nation_level_daily
GROUP BY Date
ORDER BY DailyConfirmed;


SELECT
	Date,
	COUNT(*) as TotalConfirmed
FROM nation_level_daily
GROUP BY Date
ORDER BY TotalConfirmed;

SELECT
	Date,
	COUNT(*) as DailyRecovered
FROM nation_level_daily
GROUP BY Date
ORDER BY DailyRecovered ;

SELECT
	Date,
	COUNT(*) as TotalRecovered
FROM nation_level_daily
GROUP BY Date
ORDER BY TotalRecovered ;


SELECT
	Date,
	COUNT(*) as DailyDeceased
FROM nation_level_daily
GROUP BY Date
ORDER BY DailyDeceased ;





