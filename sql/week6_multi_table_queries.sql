/*This query pulls information about every shot: details about the shooter, the goalie, the blockers and assists when applicable. 
We have detailed information about the shooter and the shot to perform analysis about the shooter
we can compile data about shot efficiency, and analyze some basic defensive data from the blocker and goalie

The following are requirements across the two submitted queries, for this query a 1 indiciates it is met a 0 indicates it is not met:
1 - At least one INNER JOIN
1 - At least one LEFT JOIN (to preserve rows and expose missing data)
0 - WHERE filtering
1 - ORDER BY sorting
0 - At least one GROUP BY query with aggregation (COUNT, SUM, AVG, etc.)
0 - At least one calculated column (examples: total_cost, completion_rate, price * quantity)*/

SELECT t.team_code as shooting_team
,gm.game_date
,gm.duration
-- shooter details
,shooter.name as player_name
,tn.position
,shooter.shoots
,shooter.hometown
,shooter.birthdate
,tn.jersey_number
-- shot details
,s.shot_key 
,s.shot_type
,s.shot_time
,s.shot_quality
-- goalie details
,goalie.name as player_name2
,s.is_goal
--blocker and assists
,blocker.name AS player_name3
,primary_assist.name AS assist
,secondary_assist.name as assist2
--goal details
,gl.is_power_play
,gl.is_short_handed
,gl.is_empty_net
,gl.is_penalty_shot
,gl.is_insurance_goal
,gl.is_game_winning_goal
,s.x_location
,s.y_location
FROM shot s
INNER JOIN game gm 
	on s.game_key=gm.game_key
INNER JOIN player shooter 
	on s.shooter_key=shooter.player_key
INNER JOIN player goalie
	on s.goalie_key=goalie.player_key
LEFT JOIN player blocker
	on s.blocker_key=blocker.player_key
INNER JOIN tenure tn
    ON shooter.player_key = tn.player_key
   AND gm.season_key = tn.season_key
INNER JOIN team t
    ON tn.team_key = t.team_key
LEFT JOIN goal gl 
	ON s.game_key=gl.game_key
    AND s.shot_key=gl.shot_key
LEFT JOIN assist a 
	ON gl.game_key=a.game_key
	AND gl.goal_key=a.goal_key
LEFT JOIN player primary_assist
	ON a.player_key=primary_assist.player_key
    and a.assist_number=1
LEFT JOIN player secondary_assist
	ON a.player_key=secondary_assist.player_key
    and a.assist_number=2
ORDER BY s.shot_key;

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