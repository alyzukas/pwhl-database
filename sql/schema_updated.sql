------DELETE TABLES IF EXISTS-----------
DROP TABLE IF EXISTS penalties;
DROP TABLE IF EXISTS tenure;
DROP TABLE IF EXISTS assist; 
DROP TABLE IF EXISTS goal;
DROP TABLE IF EXISTS shot;
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS period;
DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS season;

------CREATING TABLES-------------------

CREATE TABLE season (
    season_key INT, 
    name VARCHAR(255) NOT NULL UNIQUE,
    shortname VARCHAR(255) NOT NULL UNIQUE,
    career_flag INT NOT NULL,
    playoff_flag INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    PRIMARY KEY (season_key)
);

CREATE TABLE location (
    location_key INT,
    name VARCHAR(255) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL UNIQUE,
    seat_capacity INT not NULL,
    open_date DATE NOT NULL, 
    PRIMARY KEY (location_key)
);

CREATE TABLE team (
    team_key INT,
    name VARCHAR(255) NOT NULL UNIQUE,
    nickname VARCHAR(255) NOT NULL UNIQUE,
    team_code VARCHAR(255) NOT NULL UNIQUE,
    division INT NOT NULL,
    date_founded DATE NOT NULL,
    PRIMARY KEY (team_key)
);

CREATE TABLE period (
    period_key INT,
    min_time DATETIME NOT NULL UNIQUE,
    max_time DATETIME NOT NULL UNIQUE,
    period_desc VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY (period_key)
);

CREATE TABLE IF NOT EXISTS player (
    player_key INT,
    hometown VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL,
    name VARCHAR(100) NOT NULL,
    shoots VARCHAR(10),         
    catches VARCHAR(10),      
    PRIMARY KEY (player_key)
);

CREATE TABLE  game (
    game_key INT,
    game_date DATE NOT NULL,
    game_number INT NOT NULL UNIQUE, 
    location_key INT NOT NULL,
    attendance INT,
    start_time DATETIME,
    end_time DATETIME,
    duration DATETIME,
    status VARCHAR(50) NOT NULL,
    season_key INT NOT NULL,
    home_team_key INT NOT NULL,
    away_team_key INT NOT NULL,
    PRIMARY KEY(game_key),
    FOREIGN KEY (home_team_key) REFERENCES team(team_key),
    FOREIGN KEY (away_team_key) REFERENCES team(team_key),
    FOREIGN KEY (season_key) REFERENCES season(season_key),
    FOREIGN KEY (location_key) REFERENCES location(location_key)
);
-- updated PK: (game_key,shot_key)
CREATE TABLE IF NOT EXISTS shot (
    game_key INT NOT NULL,
    shot_key INT,
    shot_time DATETIME NOT NULL,
    shooter_key INT NOT NULL,
    goalie_key INT NOT NULL,
    blocker_key INT,
    is_goal TINYINT NOT NULL,
    shot_quality VARCHAR(50),
    shot_type VARCHAR(50),
    x_location INT,
    y_location INT,
    PRIMARY KEY (game_key,shot_key),
    FOREIGN KEY (game_key) REFERENCES game(game_key),
    FOREIGN KEY (shooter_key) REFERENCES player(player_key),
    FOREIGN KEY (goalie_key) REFERENCES player(player_key),
    FOREIGN KEY (blocker_key) REFERENCES player(player_key)
);
-- updated PK: (game_key,goal_key)
CREATE TABLE IF NOT EXISTS goal (
    game_key INT NOT NULL,
    goal_key INT,
    shot_key INT NOT NULL,
    is_power_play TINYINT NOT NULL,
    is_short_handed TINYINT NOT NULL,
    is_empty_net TINYINT NOT NULL,
    is_penalty_shot TINYINT NOT NULL,
    is_insurance_goal TINYINT NOT NULL,
    is_game_winning_goal TINYINT NOT NULL,
    PRIMARY KEY (game_key,goal_key),
    FOREIGN KEY (game_key, shot_key) REFERENCES shot(game_key, shot_key),
    FOREIGN KEY (game_key) REFERENCES game(game_key)
);
-- updated PK: (game_key,assist_key)
CREATE TABLE assist (
    game_key INT NOT NULL,
    assist_key INT,
    goal_key INT NOT NULL,
    player_key INT NOT NULL,
    assist_number INT,
    PRIMARY KEY (game_key,assist_key),
    FOREIGN KEY (game_key, goal_key) REFERENCES goal(game_key, goal_key),
    FOREIGN KEY (player_key) REFERENCES player(player_key)
);

CREATE TABLE tenure(
    tenure_key INT,
    player_key INT NOT NULL,
    team_key INT NOT NULL,
    season_key INT NOT NULL,
    captain VARCHAR(11),
    jersey_number INT NOT NULL,
    position VARCHAR(10) NOT NULL,
    PRIMARY KEY(tenure_key),
    FOREIGN KEY(player_key) REFERENCES player(player_key),
    FOREIGN KEY(team_key) REFERENCES team(team_key),
    FOREIGN KEY(season_key) REFERENCES season(season_key)
);


CREATE TABLE penalties (
    penalty_key INT PRIMARY KEY,
    game_key INT NOT NULL,
    period_key INT,
    player_key INT NOT NULL,
    time DATETIME,
    minute_length INT NOT NULL,
    description VARCHAR(255),
    FOREIGN KEY (game_key) REFERENCES game(game_key),
    FOREIGN KEY (period_key) REFERENCES period(period_key),
    FOREIGN KEY (player_key) REFERENCES player(player_key)
);