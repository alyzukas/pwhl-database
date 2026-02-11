
/*This query aggregates all the statistics for shooters, blockers, and assisters by birth year. We calculate the total contributions and shot efficiency, by birth year.
The data for birth years with only 1 contribution are filtered out to focus on more significant data points.


The following are requirements across the two submitted queries, for this query a 1 indiciates it is met a 0 indicates it is not met:
1 - At least one INNER JOIN
0 - At least one LEFT JOIN (to preserve rows and expose missing data)
1 - WHERE filtering
1 - ORDER BY sorting
1 - At least one GROUP BY query with aggregation (COUNT, SUM, AVG, etc.)
1 - At least one calculated column (examples: total_cost, completion_rate, price * quantity)*/


with shooter_prep as (
SELECT 
CAST(strftime('%Y', p.birthdate) AS INT) AS birth_year
,COUNT(*) AS shots
,SUM(s.is_goal) AS goals
,0 AS blocks
,0 AS assists
FROM shot s
INNER JOIN player p 
ON s.shooter_key = p.player_key
GROUP BY CAST(strftime('%Y', p.birthdate) AS INT)
),

blocker_prep as (
SELECT 
CAST(strftime('%Y', p.birthdate) AS INT) AS birth_year
,0 AS shots
,0 AS goals
,COUNT(*) AS blocks
,0 AS assists
FROM shot s
INNER JOIN player p 
ON s.blocker_key = p.player_key
GROUP BY CAST(strftime('%Y', p.birthdate) AS INT)
),

assist_prep as (
SELECT 
CAST(strftime('%Y', p.birthdate) AS INT) AS birth_year
,0 AS shots
,0 AS goals
,0 AS blocks
,COUNT(*) AS assists
FROM shot s
INNER JOIN player p 
ON s.blocker_key = p.player_key
GROUP BY CAST(strftime('%Y', p.birthdate) AS INT) 
),

statistic_aggregation as (
SELECT * FROM shooter_prep
UNION ALL
SELECT * FROM blocker_prep
UNION ALL
SELECT * FROM assist_prep
)

SELECT *
, (shots + goals + blocks + assists) AS total_contributions
, goals/shots AS shot_efficiency 
FROM statistic_aggregation
WHERE (shots + goals + blocks + assists) > 1
ORDER BY birth_year DESC;