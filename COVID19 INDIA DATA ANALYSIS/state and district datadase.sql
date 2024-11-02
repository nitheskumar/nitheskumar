USE statedistrictcovid19 ;

CREATE TABLE IF NOT EXISTS stateanddistrict (
                       SlNo INT,
                       State_Code VARCHAR (10) NOT NULL,
                       State VARCHAR (40) NOT NULL,
                       District_Key VARCHAR (40)  NOT NULL,
                       District VARCHAR (30) NOT NULL,
                       Confirmed INT,
                       Active INT,
                       Recovered INT,
                       Deceased INT,
                       Migrated_Other INT,
                       Delta_Confirmed INT,
                       Delta_Active INT,
                       Delta_Recovered INT,
                       Delta_Deceased INT
);


SELECT*FROM stateanddistrict;

SELECT*FROM stateanddistrict WHERE Confirmed > 0;
  
  
  
                                                   -- District wise Active,Recoverd and Deceased cases--




SELECT
    *
FROM stateanddistrict
ORDER BY District ; 


SELECT
	District,
	COUNT(*) as District_Key
FROM stateanddistrict
GROUP BY District
ORDER BY District_Key DESC;


SELECT
	District,
	COUNT(*) as Active
FROM stateanddistrict
GROUP BY District
ORDER BY Active DESC;


SELECT
	District,
	COUNT(*) as Recoverd
FROM stateanddistrict
GROUP BY District
ORDER BY Recoverd DESC;


SELECT
	District,
	COUNT(*) as Deceased
FROM stateanddistrict
GROUP BY District
ORDER BY  Deceased DESC;


                                           -- State wise Active,Recoverd and Deceased cases--
                 
                 
SELECT
    *
FROM stateanddistrict
ORDER BY State ; 

nation_level_dailynation_level_daily
SELECT
	State,
	COUNT(*) as State_code
FROM stateanddistrict
GROUP BY State
ORDER BY State_code DESC;


SELECT
	State,
	COUNT(*) as Active
FROM stateanddistrict
GROUP BY State
ORDER BY Active DESC;


SELECT
	State,
	COUNT(*) as Recoverd
FROM stateanddistrict
GROUP BY State
ORDER BY Recoverd DESC;


SELECT
	State,
	COUNT(*) as Deceased
FROM stateanddistrict
GROUP BY State
ORDER BY  Deceased DESC;
										


