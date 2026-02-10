------------- M3 - JOINs and Subqueries ----------
-- Subqueries are queries w/in queries . .  Using IN, NOT IN, EXISTS, NOT EXISTS, WHERE

-- Week 2, JOIN Queries: 
-- Q1 - Show each game, season of game, venue of game, and home/away team. . . . ( JOIN )
-- Q2 - Largest venues opened after Jan 1, 2000 . . . ( Filtering + Ordering ) 
-- Q3 - Total points by each player (goals + assists + points) . . . (JOIN )
-- Q4 - Retreieve team and player information BY season . . . ( JOIN ) 
-- Q5 - "Team roster" information BY Season (includes player info) . . . ( JOIN ) 
-- Q6 - Penalties with player name and game date . . . ( JOIN ) 

-- Week 3:
-- Q1 - Every GOAL event, with shooter + goalie + game + team . . . ( JOIN )
-- Q2 - Show PENALTY events with game info +  player name + and period (when available) . . .  ( JOIN )
-- Q3 - Find players who have NOT scored a goal (no matching goal via shot). Subquery using NOT EXISTS . . . ( Subquery ) 
-- Q4 - Find players on the Seattle Torrents who have never scored a goal . . . ( Subquery ) 
-- Q5  - Find players on the Boston Fleets who did not score a goal in the 2024 season . . . ( Subquery ) 

-- Q1 - JOIN - Every GOAL event, with shooter + goalie + game + team 
SELECT
  go.goal_key,
  g.game_key,
  g.game_date,
  ht.name AS home_team,
  at.name AS away_team,
  sh.shot_time,
  shooter.name AS shooter_name,
  goalie.name  AS goalie_name,
  go.is_power_play,
  go.is_short_handed,
  go.is_empty_net,
  go.is_game_winning_goal
FROM goal go
JOIN shot   sh      ON go.shot_key = sh.shot_key
JOIN game   g       ON sh.game_key = g.game_key
JOIN team   ht      ON g.home_team_key = ht.team_key
JOIN team   at      ON g.away_team_key = at.team_key
JOIN player shooter ON sh.shooter_key = shooter.player_key
JOIN player goalie  ON sh.goalie_key  = goalie.player_key
ORDER BY g.game_date, go.goal_key;

-- Q2 - JOIN - Show PENALTY events with game info +  player name + and period (when available).
SELECT
  p.penalty_key,
  g.game_date,
  ht.name AS home_team,
  at.name AS away_team,
  per.period_desc,
  p.time,
  p.minute_length,
  p.description,
  pl.name AS penalized_player
FROM penalties p
JOIN game g          ON p.game_key = g.game_key
JOIN team ht         ON g.home_team_key = ht.team_key
JOIN team at         ON g.away_team_key = at.team_key
LEFT JOIN period per ON p.period_key = per.period_key
JOIN player pl       ON p.player_key = pl.player_key
ORDER BY g.game_date, p.time;

-- Q3 - Find players who have NOT scored a goal + the team they are on (no matching goal via shot). 
-- Subquery using NOT EXISTS
SELECT
  p.player_key,
  p.name AS player_name,
  t.name AS team_name,
  p.hometown,
  p.birthdate
FROM player p
JOIN tenure tn ON p.player_key = tn.player_key
JOIN team t ON tn.team_key = t.team_key
WHERE NOT EXISTS (
    SELECT 1
    FROM goal g
    JOIN shot sh ON g.shot_key = sh.shot_key
    WHERE sh.shooter_key = p.player_key
)
ORDER BY t.name, p.name;


-- Q4 - Find players on the "Seattle Torrents'  who have never scored a goal
-- Subquery using WHERE
SELECT
    p.player_key,
    p.name,
    t.name AS team_name
FROM player p
JOIN tenure tn ON p.player_key = tn.player_key
JOIN team t ON tn.team_key = t.team_key
WHERE p.player_key NOT IN (
    SELECT s.shooter_key
    FROM shot s
    WHERE s.is_goal = 1
)
AND t.name = 'Seattle Torrent'
ORDER BY p.name;


-- Players on the Boston Fleet who have NOT scored a goal in the 2024 season
-- NOT WORKING
SELECT
    p.player_key,
    p.name,
    t.name AS team,
    s.shortname AS season
FROM tenure tn
JOIN player p ON tn.player_key = p.player_key
JOIN team t ON tn.team_key = t.team_key
JOIN season s ON tn.season_key = s.season_key
WHERE t.name = 'Toronto Sceptres'
  AND s.shortname = '2024-25 Reg'
  AND p.player_key NOT IN (
        SELECT DISTINCT sh.shooter_key
        FROM goal g
        JOIN shot sh ON g.shot_key = sh.shot_key
        JOIN game ga ON sh.game_key = ga.game_key
        JOIN season se ON ga.season_key = se.season_key
        WHERE se.shortname = '2024-25 Reg'
  )
ORDER BY p.name;



