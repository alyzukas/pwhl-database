PRAGMA foreign_keys = ON;

-- CHILD TABLES FIRST when deleting (avoid FK delete issues)
DELETE FROM  penalties;
DELETE FROM  tenure;
DELETE FROM  assist; 
DELETE FROM  goal;
DELETE FROM  shot;
DELETE FROM  game;
DELETE FROM  player;
DELETE FROM  period;
DELETE FROM  team;
DELETE FROM  location;
DELETE FROM  season;


-- 1) Season
INSERT INTO season (season_key, name, shortname, career_flag, playoff_flag, start_date, end_date) VALUES
  (8, '2025-26 Regular Season', '2025-26 Reg', 1, 0, '2025-11-21', '2026-04-27'),
  (7, '2025-26 Preseason', '2025-26 Preseason', 0, 0, '2025-06-01', '2025-11-19'),
  (6, '2025 Playoffs', '2025 Playoffs', 1, 1, '2025-05-06', '2025-06-03'),
  (5, '2024-25 Regular Season', '2024-25 Reg', 1, 0, '2024-11-25', '2025-05-05'),
  (4, '2024-25 Preseason', '2024-25 Preseason', 0, 0, '2024-11-01', '2024-11-29');

-- 2) Location
INSERT INTO location (location_key, name, address, seat_capacity, open_date) VALUES
  (1, 'Tsongas Center', '300 Martin Luther King Jr. Way, Lowell, MA 01852, USA', 6500, '1998-01-27'),
  (2, 'Xcel Energy Center', '199 W Kellogg Blvd, St Paul, MN 55102, USA', 18000, '2000-09-01'),
  (3, 'Place Bell', '1950 Rue Claude-Gagné, Laval, Quebec H7N 0E4', 10172, '2017-08-31'),
  (4, 'Prudential Center', '25 Lafayette St, Newark, NJ 07102, USA', 16514, '2007-10-25'),
  (5, 'TD Place Arena', '1015 Bank St, Ottawa, ON K1S 3W7, Canada', 9000, '1967-12-29'),
  (6, 'Coca-Cola Coliseum', '19 Nunavut Rd, Toronto, ON M6K 3C3, Canada', 8140, '1921-12-10'),
  (7, 'Climate Pledge Arena', '334 1st Ave N, Seattle, WA 98109, USA', 17151, '2021-10-15'),
  (8, 'Pacific Coliseum', '100 North Renfrew St, Vancouver, BC V5K 3N9, Canada', 16281, '1968-01-08');

-- 3) Teams
INSERT INTO team (team_key, name, nickname, team_code, division, date_founded) VALUES
  (1, 'Boston Fleet', 'Fleet', 'BOS', 1, '2023-08-29'),
  (2, 'Minnesota Frost', 'Frost', 'MIN', 1, '2023-08-29'),
  (3, 'Montréal Victoire', 'Victoire', 'MTL', 1, '2023-08-29'),
  (4, 'New York Sirens', 'Sirens', 'NY', 1, '2023-08-29'),
  (5, 'Ottawa Charge', 'Charge', 'OTT', 1, '2023-08-29'),
  (6, 'Toronto Sceptres', 'Sceptres', 'TOR', 1, '2023-08-29'),
  (8, 'Seattle Torrent', 'Torrent', 'SEA', 1, '2025-04-30'),
  (9, 'Vancouver Goldeneyes', 'Goldeneyes', 'VAN', 1, '2023-04-23');

-- 4) Period
INSERT INTO period (period_key, min_time, max_time, period_desc) VALUES
  (1, '2000-01-01 00:00:00', '2000-01-01 00:20:00', 'first period'),
  (2, '2000-01-01 00:20:00', '2000-01-01 00:40:00', 'second period'),
  (3, '2000-01-01 00:40:00', '2000-01-01 01:00:00', 'third period'),
  (4, '2000-01-01 01:00:00', '2000-01-01 01:05:00', 'over time'),
  (5, '2000-01-01 01:05:00', '2000-01-01 23:59:59', 'shoot out');

-- 5) Player
INSERT INTO player (player_key, hometown, birthdate, name, shoots, catches) VALUES
  (149, 'Halifax, NS', '1992-03-07', 'Jill Saulnier', 'L', ''),
  (78, 'Turku, FIN', '1993-03-02', 'Susanna Tapani', 'L', ''),
  (12, 'Farmington, MI', '1996-05-01', 'Megan Keller', 'L', ''),
  (246, 'Rochester, NY', '2003-07-14', 'Haley Winn', 'R', ''),
  (6, 'Chappaqua, NY', '1999-05-24', 'Aerin Frankel', '', 'L'),
  (63, 'Toronto, ON', '1999-05-15', 'Daryl Watts', 'L', ''),
  (244, 'Alpena, MI', '2002-10-23', 'Emma Gentry', 'L', ''),
  (76, 'Stellarton, NS', '1993-07-15', 'Blayre Turnbull', 'R', ''),
  (44, 'Ingersoll, ON', '1998-01-19', 'Ella Shelton', 'L', ''),
  (211, 'Ste. Anne, MB', '2001-03-11', 'Raygan Kirk', '', 'L'),
  (36, 'Barrie, ON', '1997-12-17', 'Jessie Eldridge', 'R', ''),
  (138, 'Brampton, ON', '1998-07-15', 'Mikyla Grant-Mentis', 'L', ''),
  (181, 'Coppell, TX', '2001-03-24', 'Hannah Bilka', 'L', ''),
  (13, 'Sun Valley, ID', '1989-07-12', 'Hilary Knight', 'R', ''),
  (34, 'North Reading, MA', '1994-04-13', 'Alex Carpenter', 'L', ''),
  (49, 'St. Thomas, ON', '2000-06-30', 'Lexie Adzija', 'L', ''),
  (99, 'Menomonie, WI', '2000-06-27', 'Mariah Keopple', 'L', ''),
  (294, 'Aurora, IL', '2002-09-01', 'Lyndie Lobdell', 'R', ''),
  (155, 'Elm Creek, MB', '1999-08-17', 'Corinne Schroeder', '', 'L'),
  (52, 'Caledon East, ON', '2000-08-09', 'Zoe Boyd', 'L', ''),
  (185, 'Teplice, CZE', '2002-08-14', 'Daniela Pejšová', 'L', ''),
  (316, 'Okemos, MI', '2002-01-25', 'Clara Van Wieren', 'L', ''),
  (74, 'Yarmouth, NS', '1997-04-20', 'Allie Munroe', 'L', ''),
  (210, 'London, ON', '2001-02-21', 'Julia Gosling', 'L', ''),
  (62, 'Prague, CZE', '1996-01-04', 'Aneta Tejralová', 'L', ''),
  (15, 'Winterthur, SWI', '1998-03-12', 'Alina Müller', 'L', ''),
  (259, 'St John''s, NL', '2003-05-13', 'Abby Newhook', 'R', ''),
  (73, 'Burlington, ON', '1999-11-04', 'Emma Maltais', 'L', ''),
  (26, 'Toronto, ON', '2000-03-20', 'Claire Dalton', 'R', ''),
  (68, 'Burlington, MA', '1995-09-19', 'Kali Flanagan', 'R', ''),
  (56, 'Downers Grove, IL', '1995-10-27', 'Savannah Harmon', 'L', ''),
  (91, 'Linden, CA', '2000-08-22', 'Brooke Bryant', 'R', ''),
  (2, 'Blaine, MN', '1998-12-30', 'Emily Brown', 'L', ''),
  (196, 'Eastvale, CA', '1999-01-07', 'Cayla Barnes', 'R', ''),
  (100,'Scarborough, ON','1990-10-17','Natalie Spooner','R',''),
  (208, 'Milton, ON', '2001-05-23', 'Megan Carter', 'L', 'D');
  

-- 6) Game
INSERT INTO game (game_key, game_date, game_number, location_key, attendance, start_time, end_time, duration, status, season_key, home_team_key, away_team_key) VALUES
  (259, '2026-01-18', 50, 7, 12774, '2000-01-01 19:07:00', '2000-01-01 21:52:00', '2000-01-01 02:45:00', 'Final SO', 8, 8, 1),
  (261, '2026-01-20', 52, 7, 10160, '2000-01-01 19:08:00', '2000-01-01 21:39:00', '2000-01-01 02:31:00', 'Final', 8, 8, 6);

-- 7) Shot (added game_key)
INSERT INTO shot (game_key, shot_key, shot_time, shooter_key, goalie_key, blocker_key, is_goal, shot_quality, shot_type, x_location, y_location) VALUES
  (259, 16,  '2000-01-01 00:06:20', 34,  6,   149, 0, 'Non quality blocked', 'Default', 175, 143),
  (259, 36,  '2000-01-01 00:12:28', 12, 155,  NULL, 1, 'Non quality goal',    'Slap',    423, 203),
  (259, 41,  '2000-01-01 00:13:50', 12, 155,  99,   0, 'Non quality blocked', 'Slap',    434, 217),
  (259, 43,  '2000-01-01 00:14:00', 246,155,  49,   0, 'Non quality blocked', 'Default', 389, 173),
  (259, 75,  '2000-01-01 00:25:47', 210,6,    NULL, 1, 'Non quality goal',    'Slap',     81,  67),
  (261, 4,   '2000-01-01 00:01:18', 76, 155,  NULL, 1, 'Quality goal',        'Wrist',   513, 196),
  (261, 47,  '2000-01-01 00:09:52', 13, 211,  NULL, 1, 'Non quality goal',    'Wrist',    48, 178),
  (261, 51,  '2000-01-01 00:10:54', 138,211,  76,   0, 'Non quality blocked', 'Backhand', 70,  99),
  (261, 55,  '2000-01-01 00:12:33', 244,155,  NULL, 0, 'Quality on net',      'Wrist',   525, 170),
  (261, 57,  '2000-01-01 00:13:49', 181,211,  NULL, 1, 'Non quality goal',    'Tip',      39, 165),
  (261, 109, '2000-01-01 00:30:30', 68, 155,  NULL, 1, 'Non quality goal',    'Wrist',   406, 153),
  (261, 203, '2000-01-01 00:58:14', 36, 211,  NULL, 1, 'Quality goal',        'Wrist',    99, 147),
  (261, 88,  '2000-01-01 00:20:13', 210,211,  NULL, 1, 'Quality goal',        'Default',  86, 143),
  (261, 160, '2000-01-01 00:40:14', 208,211,  NULL, 1, 'Quality goal',        'Default',  93, 161),
  (261, 172, '2000-01-01 00:40:31', 100,155,  NULL, 1, 'Quality goal',        'Backhand',522, 150);

-- 8) Goal (added game_key)
INSERT INTO goal (game_key, goal_key, shot_key, is_power_play, is_short_handed, is_empty_net, is_penalty_shot, is_insurance_goal, is_game_winning_goal) VALUES
  (259, 37,  36,  1, 0, 0, 0, 0, 0),
  (261, 5,   4,   0, 0, 0, 0, 0, 0),
  (259, 17,  16,  0, 0, 0, 0, 0, 0),
  (261, 48,  47,  1, 0, 0, 0, 0, 0),
  (261, 58,  57,  0, 0, 0, 0, 0, 0),
  (261, 204, 203, 0, 0, 0, 0, 1, 0),
  (259, 76,  75,  0, 0, 0, 0, 0, 0),
  (261, 89,  88,  0, 0, 0, 0, 0, 0),
  (261, 110, 109, 1, 0, 0, 0, 0, 0),
  (261, 161, 160, 0, 0, 0, 0, 0, 1),
  (261, 173, 172, 0, 0, 0, 0, 0, 0);

-- 9) Assist (added game_key)
INSERT INTO assist (game_key, assist_key, goal_key, player_key, assist_number) VALUES
  (259, 371,  37,  259, 1),
  (259, 372,  37,  15,  2),
  (259, 761,  76,  91,  1),
  (259, 762,  76,  196, 2),
  (261, 51,   5,   26,  1),
  (261, 52,   5,   68,  2),
  (259, 171,  17,  63,  1),
  (259, 172,  17,  56,  2),
  (261, 481,  48,  181, 1),
  (261, 482,  48,  34,  2),
  (261, 581,  58,  196, 1),
  (261, 891,  89,  294, 1),
  (261, 892,  89,  36,  2),
  (261, 1101, 110, 56,  1),
  (261, 1102, 110, 73,  2),
  (261, 1611, 161, 36,  1),
  (261, 1612, 161, 2,   2),
  (261, 1731, 173, 316, 1),
  (261, 1732, 173, 63,  2),
  (261, 2041, 204, 34,  1),
  (261, 2042, 204, 99,  2);

-- 10) Tenure 
INSERT INTO tenure (tenure_key, player_key, team_key, season_key, captain, jersey_number, position)
VALUES
  (25, 6,   1, 8, NULL,        44, 'LW'),
  (16, 12,  1, 8, NULL,        77, 'C'),
  (60, 13,  8, 8, 'Captain',    5, 'LD'),
  (40, 26,  6, 8, NULL,         8, 'RD'),
  (61, 34,  8, 8, 'Alternate', 31, 'G'),
  (55, 36,  8, 8, NULL,         9, 'F'),
  (48, 44,  6, 8, NULL,        20, 'F'),
  (65, 49,  8, 8, NULL,        40, 'F'),
  (15, 52,  1, 8, 'Captain',   17, 'D'),
  (68, 62,  8, 8, NULL,         1, 'G'),
  (28, 63,  6, 8, NULL,         9, 'F'),
  (45, 74,  6, 8, 'Alternate', 13, 'F'),
  (39, 76,  6, 8, 'Captain',   19, 'F'),
  (14, 78,  1, 8, NULL,        21, 'F'),
  (73, 99,  8, 8, NULL,        25, 'F'),
  (57, 138, 8, 8, NULL,        78, 'F'),
  (12, 149, 1, 8, NULL,        20, 'D'),
  (76, 155, 8, 8, NULL,        24, 'D'),
  (59, 181, 8, 8, NULL,        30, 'G'),
  (22, 185, 1, 8, NULL,         3, 'LD'),
  (66, 210, 8, 8, NULL,        55, 'LD'),
  (50, 211, 6, 8, NULL,        25, 'F'),
  (33, 244, 6, 8, NULL,        12, 'D'),
  (19, 246, 1, 8, NULL,        88, 'F'),
  (74, 294, 8, 8, NULL,         2, 'D'),
  (37, 316, 6, 8, NULL,        11, 'C'),
  (2,  15,  1, 8, 'Alternate', 19, 'RW'),
  (6,  259, 1, 8, NULL,        27, 'F'),
  (38, 73,  6, 8, NULL,        42, 'F'),
  (43, 68,  6, 8, NULL,         6, 'D'),
  (47, 56,  6, 8, NULL,        15, 'D'),
  (58, 91,  8, 8, NULL,        17, 'F'),
  (69, 196, 8, 8, NULL,        11, 'D'),
  (72, 2,   8, 8, 'Alternate',  3, 'D'),
  (80, 100, 6, 8, NULL,         24,'F'),
  (999, 208, 8, 8, NULL, 27, 'D');

  -- 11) Penalties
  INSERT INTO penalties
(penalty_key, game_key, period_key, player_key, time, minute_length, description)
VALUES
  (11,  259, 1, 185, '2000-01-01 00:05:11.000', 2, 'Illegal Body Checking'),
  (29,  259, 1,  62, '2000-01-01 00:10:35.000', 2, '2-Minute-Hit to the head'),
  (34,  259, 1, 138, '2000-01-01 00:12:24.000', 2, 'Slashing'),
  (52,  259, 1,  52, '2000-01-01 00:17:02.000', 2, 'Interference'),
  (97,  259, 2,  78, '2000-01-01 00:34:52.000', 2, 'Interference'),
  (45,  261, 1, 316, '2000-01-01 00:09:37.000', 2, 'Tripping'),
  (102, 261, 2, 294, '2000-01-01 00:28:46.000', 2, 'Delay of Game'),
  (129, 261, 2,  26, '2000-01-01 00:35:21.000', 2, 'High Sticking'),
  (145, 261, 3, 210, '2000-01-01 00:41:45.000', 2, 'Hooking'),
  (153, 261, 3,  49, '2000-01-01 00:43:41.000', 2, 'Roughing'),
  (154, 261, 3,  74, '2000-01-01 00:43:41.000', 2, 'Cross Checking'),
  (177, 261, 3,  74, '2000-01-01 00:50:13.000', 2, 'Holding'),
  (207, 261, 3,  76, '2000-01-01 00:58:35.000', 2, 'Slashing');
