
----------------------QUERYING ON TABLES-------------------

--EJ: 
-- Retrieving succesful shot to goal rate
WITH totalshots
AS (
	SELECT s.shooter_key as player_key
		,p.name AS player_name
		,count(s.shot_key) AS shot_sum
	FROM shot AS s
	INNER JOIN player AS P ON s.shooter_key = p.player_key
	GROUP BY s.shooter_key
		,p.name
	)
	,totalgoals
AS (
	SELECT s.shooter_key as player_key
  				,p.name AS player_name
		,sum(s.is_goal) AS goal_sum
	FROM shot AS s
	INNER JOIN player AS P ON s.shooter_key = p.player_key
    WHERE s.is_goal = 1
	GROUP BY s.shooter_key
	)
SELECT ts.player_name
	,tg.goal_sum * 1.0 / ts.shot_sum AS goal_rate
FROM totalshots AS ts
INNER JOIN totalgoals AS tg ON ts.player_key = tg.player_key
;

-- EJ: 
-- Select all players keys who have scored goals
select distinct(s.shooter_key)
from shot s
where s.is_goal = 1;

--BRISA: 
-- Retrieving a list of players who have blocked shots, the types of shot blocked, and the qualtiy:
SELECT t.name
, p.name
, s.shot_type
,s.shot_quality
FROM team t
LEFT JOIN tenure tn
	ON t.team_key = tn.team_key
LEFT JOIN player p 
	on tn.player_key=p.player_key
INNER JOIN shot s
	ON p.player_key=s.blocker_key;

--BRISA: 
-- Retrieving a list of all players who have assists on goals
SELECT 
   a.assist_key
  , a.goal_key
  ,a.player_key
  ,a.assist_number
  , p.name
from goal g
LEFT JOIN assist a
	on g.goal_key = a.goal_key
LEFT JOIN player p
	on a.player_key=p.player_key;

--BRISA: 
-- Raking the above a step further, and displaying the count of assists by player in descending order
WITH player_assists AS (
  SELECT 
  a.assist_key
  , a.goal_key
  ,a.player_key
  ,a.assist_number
  , p.name
from goal g
LEFT JOIN assist a
	on g.goal_key = a.goal_key
LEFT JOIN player p
	on a.player_key=p.player_key
INNER JOIN tenure tn
    ON p.player_key=tn.player_key
LEFT JOIN team t
    ON tn.team_key=t.team_key
)

select 
name
, count(*) as assist_cnt 
from player_assists
GROUP BY name
order by assist_cnt desc;


--ALYSSA
-- Using JOIN – This will ideally show each game, season of game, venue of game, and home/away team.
SELECT
  g.game_key,
  g.game_date,
  s.Shortname AS season,
  ht.name     AS home_team,
  at.name     AS away_team,
  l.name      AS venue
FROM Game g
JOIN season s   ON g.Season_Key = s.season_key
JOIN team ht    ON g.home_team_key = ht.team_key
JOIN team at    ON g.away_team_key = at.team_key
JOIN location l ON g.location_key = l.location_key
ORDER BY g.game_date;

--ALYSSA:
-- This will ideally retrieve the information of the largest venues opened after a certain date (Jan 1,2000); from top-down.
SELECT
  location_key,
  name,
  address,
  open_date,
  seat_capacity
FROM location
WHERE open_date >= '2000-01-01'
ORDER BY seat_capacity DESC, open_date ASC
LIMIT 3;

-- ALYSSA
--Using JOIN,  This will ideally show each game, season of game, venue of game, and home/away team.
SELECT
  g.game_key,
  g.game_date,
  s.shortname AS season,
  ht.name     AS home_team,
  at.name     AS away_team,
  l.name      AS venue
FROM game g
JOIN season s   ON g.season_key = s.season_key
JOIN team ht    ON g.home_team_key = ht.team_key
JOIN team at    ON g.away_team_key = at.team_key
JOIN location l ON g.location_key = l.location_key
ORDER BY g.game_date;

-- ALYSSA
-- This will ideally retrieve the largest venues opened after Jan 1, 2000
SELECT
  location_key,
  name,
  address,
  open_date,
  seat_capacity
FROM location
WHERE open_date >= '2000-01-01'
ORDER BY seat_capacity DESC, open_date ASC
LIMIT 3;

-- ALYSSA
-- This will ideally retrieve the total points by each player (goals + assists) 
WITH goals_by_player AS (
  SELECT s.shooter_key AS player_key, COUNT(*) AS goals
  FROM goal g
  JOIN shot s ON g.shot_key = s.shot_key
  GROUP BY s.shooter_key
),
assists_by_player AS (
  SELECT a.player_key, COUNT(*) AS assists
  FROM assist a
  GROUP BY a.player_key
)
SELECT
  p.player_key,
  p.name,
  COALESCE(g.goals, 0)   AS goals,
  COALESCE(a.assists, 0) AS assists,
  COALESCE(g.goals, 0) + COALESCE(a.assists, 0) AS points
FROM player p
LEFT JOIN goals_by_player g ON p.player_key = g.player_key
LEFT JOIN assists_by_player a ON p.player_key = a.player_key
ORDER BY points DESC, goals DESC, assists DESC, p.name;

-- ALYSSA
-- This will ideally retreieve team and player information by season
SELECT
  se.shortname AS season,
  t.name AS team,
  p.player_key,
  p.name,
  tn.jersey_number,
  tn.position,
  tn.captain
FROM tenure tn
JOIN player p ON tn.player_key = p.player_key
JOIN team t ON tn.team_key = t.team_key
JOIN season se ON tn.season_key = se.season_key
ORDER BY se.shortname, t.name, tn.position, tn.jersey_number;

-- ALYSSA
-- This will ideally retrieve the "team roster" information by Season (includes player info)
SELECT
  se.shortname AS season,
  t.name AS team,
  p.name AS player,
  p.hometown,
  p.birthdate,
  tn.jersey_number,
  tn.position,
  tn.captain
FROM tenure tn
JOIN team t ON tn.team_key = t.team_key
JOIN season se ON tn.season_key = se.season_key
JOIN player p ON tn.player_key = p.player_key
ORDER BY se.start_date DESC, t.name, tn.jersey_number, p.name;

-- ALYSSA
-- This will ideally retreieve the penalties with player name and game date 
SELECT
  pe.penalty_key,
  g.game_date,
  pe.time,
  pe.minute_length,
  pe.description,
  p.name AS player_name,
  pe.game_key
FROM penalties pe
JOIN player p ON pe.player_key = p.player_key
JOIN game g   ON pe.game_key = g.game_key
ORDER BY pe.game_key, pe.time;
