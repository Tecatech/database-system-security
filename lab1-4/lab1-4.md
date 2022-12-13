```sql
PS C:\Users\Admin> sqlplus tecatech_lab1_4/alpha@"DESKTOP-UG7SO1F:1521/xepdb1"

SQL*Plus: Release 18.0.0.0.0 - Production on Fri Dec 9 23:28:11 2022
Version 18.4.0.0.0

Copyright (c) 1982, 2018, Oracle.  All rights reserved.

Last Successful login time: Fri Dec 09 2022 02:31:21 +03:00

Connected to:
Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0

SQL> SHOW con_name;

CON_NAME
------------------------------
XEPDB1
SQL> CREATE TABLE national_teams(
  2  national_team_id NUMBER(3, 0) NOT NULL,
  3  national_team_name NVARCHAR2(60) NOT NULL,
  4  national_team_points NUMBER(6, 2) NOT NULL,
  5  national_team_association NVARCHAR2(10) NOT NULL,
  6  PRIMARY KEY (national_team_id)
  7  );

Table created.

SQL> CREATE TABLE leagues(
  2  league_id NUMBER(3, 0) NOT NULL,
  3  national_team_id NUMBER(3, 0) NOT NULL,
  4  league_name NVARCHAR2(50) NOT NULL,
  5  PRIMARY KEY (league_id),
  6  FOREIGN KEY (national_team_id) REFERENCES national_teams(national_team_id)
  7  );

Table created.

SQL> CREATE TABLE clubs(
  2  club_id NUMBER(5, 0) NOT NULL,
  3  league_id NUMBER(3, 0) NOT NULL,
  4  club_name NVARCHAR2(50) NOT NULL,
  5  club_stadium NVARCHAR2(50) NOT NULL,
  6  PRIMARY KEY (club_id),
  7  FOREIGN KEY (league_id) REFERENCES leagues(league_id)
  8  );

Table created.

SQL> CREATE TABLE players(
  2  player_id NUMBER(6, 0) NOT NULL,
  3  club_id NUMBER(5, 0) NOT NULL,
  4  national_team_id NUMBER(3, 0) NOT NULL,
  5  player_name NVARCHAR2(50) NOT NULL,
  6  player_ovr NUMBER(2, 0) NOT NULL CHECK(player_ovr BETWEEN 50 AND 99),
  7  player_age NUMBER(2, 0) NOT NULL CHECK(player_age BETWEEN 16 AND 50),
  8  player_trait NVARCHAR2(50) NOT NULL,
  9  player_speciality NVARCHAR2(40) NOT NULL,
 10  PRIMARY KEY (player_id),
 11  FOREIGN KEY (club_id) REFERENCES clubs(club_id),
 12  FOREIGN KEY (national_team_id) REFERENCES national_teams(national_team_id)
 13  );

Table created.

SQL> CREATE TABLE timestamps(
  2  timestamp_id NUMBER(4, 0) NOT NULL,
  3  day NUMBER(2, 0) NOT NULL CHECK(day BETWEEN 1 AND 31),
  4  month NUMBER(2, 0) NOT NULL CHECK(month BETWEEN 1 AND 12),
  5  year NUMBER(4, 0) NOT NULL CHECK(year BETWEEN 2022 AND 2027),
  6  PRIMARY KEY (timestamp_id)
  7  );

Table created.

SQL> CREATE TABLE market_values(
  2  market_value_id NUMBER(6, 0) NOT NULL,
  3  player_id NUMBER(6, 0) NOT NULL,
  4  timestamp_id NUMBER(4, 0) NOT NULL,
  5  player_market_value NUMBER(3, 0) NOT NULL,
  6  PRIMARY KEY (market_value_id),
  7  FOREIGN KEY (player_id) REFERENCES players(player_id),
  8  FOREIGN KEY (timestamp_id) REFERENCES timestamps(timestamp_id)
  9  );

Table created.

SQL> CONNECT system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> GRANT UNLIMITED TABLESPACE TO tecatech_lab1_4;

Grant succeeded.

SQL> CONNECT tecatech_lab1_4/alpha@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> INSERT ALL
  2  INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (1, 'Belgium', 1828.45, 'UEFA')
  3  INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (2, 'Brazil', 1823.42, 'CONMEBOL')
  4  INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (3, 'France', 1786.15, 'UEFA')
  5  INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (4, 'Argentina', 1766.99, 'CONMEBOL')
  6  INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (5, 'England', 1755.52, 'UEFA')
  7  INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (6, 'Portugal', 1660.25, 'UEFA')
  8  INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (7, 'Mexico', 1647.91, 'CONCACAF')
  9  INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (8, 'Senegal', 1587.78, 'CAF')
 10  INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (9, 'IR Iran', 1572.89, 'AFC')
 11  INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (10, 'New Zealand', 1161.66, 'OFC')
 12  SELECT * FROM dual;

10 rows created.

SQL> INSERT ALL
  2  INTO leagues(league_id, national_team_id, league_name) VALUES (1, 5, 'Premier League')
  3  INTO leagues(league_id, national_team_id, league_name) VALUES (2, 3, 'Ligue 1 Conforama')
  4  INTO leagues(league_id, national_team_id, league_name) VALUES (3, 6, 'Liga NOS')
  5  INTO leagues(league_id, national_team_id, league_name) VALUES (4, 1, 'Pro League')
  6  INTO leagues(league_id, national_team_id, league_name) VALUES (5, 2, 'Serie A')
  7  SELECT * FROM dual;

5 rows created.

SQL> INSERT ALL
  2  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (1, 1, 'Arsenal', 'Emirates Stadium')
  3  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (2, 1, 'Everton', 'Goodison Park')
  4  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (3, 1, 'Manchester United', 'Old Trafford')
  5  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (4, 1, 'Manchester City', 'Etihad Stadium')
  6  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (5, 2, 'Paris Saint-Germain', 'Parc des Princes')
  7  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (6, 2, 'Olympique de Marseille', 'Stade Velodrome')
  8  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (7, 3, 'SL Benfica', 'Estadio da Luz')
  9  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (8, 3, 'FC Porto', 'Estadio do Dragao')
 10  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (9, 4, 'Club Brugge KV', 'Jan Breydel Stadium')
 11  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (10, 5, 'Atletico Mineiro', 'Estadio Governador')
 12  SELECT * FROM dual;

10 rows created.

SQL> INSERT ALL
  2  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (1, 5, 4, 'Lionel Messi', 93, 34, 'One Club Player', 'Free Kick Specialist')
  3  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (2, 3, 6, 'Cristiano Ronaldo', 91, 36, 'Long Shot Taker', 'Aerial Threat')
  4  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (3, 5, 2, 'Neymar Jr', 91, 30, 'Technical Dribbler', 'Acrobat')
  5  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (4, 5, 3, 'Kylian Mbappe', 91, 23, 'Speed Dribbler', 'Speedster')
  6  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (5, 4, 1, 'Kevin De Bruyne', 91, 30, 'Playmaker', 'Engine')
  7  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (6, 4, 2, 'Ederson', 89, 27, 'Comes for Crosses', 'Long Passer')
  8  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (7, 5, 2, 'Marquinhos', 88, 27, 'Leadership', 'Tackler')
  9  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (8, 4, 6, 'Ruben Dias', 88, 24, 'Power Header', 'Solid Player')
 10  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (9, 4, 5, 'Raheem Sterling', 87, 26, 'Clinical Finisher', 'Team Player')
 11  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (10, 8, 9, 'Mehdi Taremi', 79, 29, 'Strength', 'Flair')
 12  SELECT * FROM dual;

10 rows created.

SQL> INSERT ALL
  2  INTO timestamps(timestamp_id, day, month, year) VALUES (1, 10, 6, 2022)
  3  INTO timestamps(timestamp_id, day, month, year) VALUES (2, 31, 8, 2022)
  4  INTO timestamps(timestamp_id, day, month, year) VALUES (3, 1, 1, 2023)
  5  INTO timestamps(timestamp_id, day, month, year) VALUES (4, 31, 1, 2023)
  6  INTO timestamps(timestamp_id, day, month, year) VALUES (5, 10, 6, 2023)
  7  SELECT * FROM dual;

5 rows created.

SQL> INSERT ALL
  2  INTO market_values(market_value_id, player_id, timestamp_id, player_market_value) VALUES (1, 3, 1, 180)
  3  INTO market_values(market_value_id, player_id, timestamp_id, player_market_value) VALUES (2, 4, 1, 200)
  4  INTO market_values(market_value_id, player_id, timestamp_id, player_market_value) VALUES (3, 7, 1, 70)
  5  INTO market_values(market_value_id, player_id, timestamp_id, player_market_value) VALUES (4, 8, 1, 75)
  6  INTO market_values(market_value_id, player_id, timestamp_id, player_market_value) VALUES (5, 9, 1, 160)
  7  INTO market_values(market_value_id, player_id, timestamp_id, player_market_value) VALUES (6, 3, 2, 75)
  8  INTO market_values(market_value_id, player_id, timestamp_id, player_market_value) VALUES (7, 4, 2, 150)
  9  INTO market_values(market_value_id, player_id, timestamp_id, player_market_value) VALUES (8, 7, 2, 80)
 10  INTO market_values(market_value_id, player_id, timestamp_id, player_market_value) VALUES (9, 8, 2, 90)
 11  INTO market_values(market_value_id, player_id, timestamp_id, player_market_value) VALUES (10, 9, 2, 55)
 12  INTO market_values(market_value_id, player_id, timestamp_id, player_market_value) VALUES (11, 3, 3, 100)
 13  INTO market_values(market_value_id, player_id, timestamp_id, player_market_value) VALUES (12, 4, 3, 160)
 14  INTO market_values(market_value_id, player_id, timestamp_id, player_market_value) VALUES (13, 7, 3, 75)
 15  INTO market_values(market_value_id, player_id, timestamp_id, player_market_value) VALUES (14, 8, 3, 85)
 16  INTO market_values(market_value_id, player_id, timestamp_id, player_market_value) VALUES (15, 9, 3, 70)
 17  SELECT * FROM dual;

15 rows created.

SQL> EXIT;
Disconnected from Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0
PS C:\Users\Admin> sqlplus tecatech_lab1_4/alpha@xepdb1

SQL*Plus: Release 18.0.0.0.0 - Production on Fri Mar 11 00:40:36 2022
Version 18.4.0.0.0

Copyright (c) 1982, 2018, Oracle.  All rights reserved.

Last Successful login time: Fri Mar 11 2022 00:27:09 +03:00

Connected to:
Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0

SQL> SHOW con_name;

CON_NAME
------------------------------
XEPDB1
SQL> SELECT * FROM national_teams;

NATIONAL_TEAM_ID NATIONAL_TEAM_NAME                                           NATIONAL_TEAM_POINTS NATIONAL_TEAM_ASSOCIATION
---------------- ------------------------------------------------------------ -------------------- -------------------------
               1 Belgium                                                                   1828.45 UEFA
               2 Brazil                                                                    1823.42 CONMEBOL
               3 France                                                                    1786.15 UEFA
               4 Argentina                                                                 1766.99 CONMEBOL
               5 England                                                                   1755.52 UEFA
               6 Portugal                                                                  1660.25 UEFA
               7 Mexico                                                                    1647.91 CONCACAF
               8 Senegal                                                                   1587.78 CAF
               9 IR Iran                                                                   1572.89 AFC
              10 New Zealand                                                               1161.66 OFC

10 rows selected.

SQL> SELECT * FROM leagues;

LEAGUE_ID NATIONAL_TEAM_ID LEAGUE_NAME
--------- ---------------- --------------------------------------------------
        1                5 Premier League
        2                3 Ligue 1 Conforama
        3                6 Liga NOS
        4                1 Pro League
        5                2 Serie A

7 rows selected.

SQL> SELECT * FROM clubs;

CLUB_ID LEAGUE_ID CLUB_NAME                                          CLUB_STADIUM
------- --------- -------------------------------------------------- --------------------------------------------------
      1         1 Arsenal                                            Emirates Stadium
      2         1 Everton                                            Goodison Park
      3         1 Manchester United                                  Old Trafford
      4         1 Manchester City                                    Etihad Stadium
      5         2 Paris Saint-Germain                                Parc Des Princes
      6         2 Olympique de Marseille                             Stade Velodrome
      7         3 SL Benfica                                         Estadio da Luz
      8         3 FC Porto                                           Estadio do Dragao
      9         4 Club Brugge KV                                     Jan Breydel Stadium
     10         5 Atletico Mineiro                                   Estadio Governador

11 rows selected.

SQL> SELECT * FROM players;

PLAYER_ID CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
--------- ------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
        1       5                4 Lionel Messi                                               93         34 One Club Player                                    Free Kick Specialist
        2       3                6 Cristiano Ronaldo                                          91         36 Long Shot Taker                                    Aerial Threat
        3       5                2 Neymar Jr                                                  91         30 Technical Dribbler                                 Acrobat
        4       5                3 Kylian Mbappe                                              91         23 Speed Dribbler                                     Speedster
        5       4                1 Kevin De Bruyne                                            91         30 Playmaker                                          Engine
        6       4                2 Ederson                                                    89         27 Comes for Crosses                                  Long Passer
        7       5                2 Marquinhos                                                 88         27 Leadership                                         Tackler
        8       4                6 Ruben Dias                                                 88         24 Power Header                                       Solid Player
        9       4                5 Raheem Sterling                                            87         26 Clinical Finisher                                  Team Player
       10       8                9 Mehdi Taremi                                               79         29 Strength                                           Flair

10 rows selected.

SQL> SELECT * FROM timestamps;

TIMESTAMP_ID        DAY      MONTH       YEAR
------------ ---------- ---------- ----------
           1         10          6       2022
           2         31          8       2022
           3          1          1       2023
           4         31          1       2023
           5         10          6       2023

SQL> SELECT * FROM market_values;

MARKET_VALUE_ID  PLAYER_ID TIMESTAMP_ID PLAYER_MARKET_VALUE
--------------- ---------- ------------ -------------------
              1          3            1                 180
              2          4            1                 200
              3          7            1                  70
              4          8            1                  75
              5          9            1                 160
              6          3            2                  75
              7          4            2                 150
              8          7            2                  80
              9          8            2                  90
             10          9            2                  55
             11          3            3                 100
             12          4            3                 160
             13          7            3                  75
             14          8            3                  85
             15          9            3                  70

15 rows selected.

SQL> SELECT *
  2      FROM market_values
  3          MATCH_RECOGNIZE (
  4              PARTITION BY player_id
  5              ORDER BY timestamp_id
  6              MEASURES
  7                  MATCH_NUMBER() AS match_number
  8              ALL ROWS PER MATCH
  9              PATTERN (^ gt80)
 10              DEFINE
 11                  gt80 AS player_market_value > 80
 12              ) MR
 13      INNER JOIN players ON MR.player_id = players.player_id
 14      ORDER BY match_number;

 PLAYER_ID TIMESTAMP_ID MATCH_NUMBER MARKET_VALUE_ID PLAYER_MARKET_VALUE  PLAYER_ID    CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
---------- ------------ ------------ --------------- ------------------- ---------- ---------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
         3            1            1               1                 180          3          5                2 Neymar Jr                                                  91         30 Technical Dribbler                                 Acrobat
         4            1            1               2                 200          4          5                3 Kylian Mbappe                                              91         23 Speed Dribbler                                     Speedster
         9            1            1               5                 160          9          4                5 Raheem Sterling                                            87         26 Clinical Finisher                                  Team Player

SQL> SELECT *
  2      FROM market_values
  3          MATCH_RECOGNIZE (
  4              PARTITION BY player_id
  5              ORDER BY timestamp_id
  6              MEASURES
  7                  STRT.timestamp_id AS start_tstamp,
  8                  LAST(DOWN.timestamp_id) AS bottom_tstamp,
  9                  LAST(UP.timestamp_id) AS end_tstamp,
 10                  MATCH_NUMBER() AS match_number
 11              ALL ROWS PER MATCH
 12              AFTER MATCH SKIP TO LAST DOWN
 13              PATTERN (STRT UP+ FLAT* DOWN+)
 14              DEFINE
 15                  DOWN AS DOWN.player_market_value < PREV(DOWN.player_market_value),
 16                  FLAT AS FLAT.player_market_value = PREV(FLAT.player_market_value),
 17                  UP AS UP.player_market_value > PREV(UP.player_market_value)
 18              ) MR
 19          INNER JOIN players ON MR.player_id = players.player_id
 20          ORDER BY MR.player_id, MR.start_tstamp;

 PLAYER_ID TIMESTAMP_ID START_TSTAMP BOTTOM_TSTAMP END_TSTAMP MATCH_NUMBER MARKET_VALUE_ID PLAYER_MARKET_VALUE  PLAYER_ID    CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
---------- ------------ ------------ ------------- ---------- ------------ --------------- ------------------- ---------- ---------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
         7            1            1                                     1               3                  70          7          5                2 Marquinhos                                                 88         27 Leadership                                         Tackler
         7            2            1                        2            1               8                  80          7          5                2 Marquinhos                                                 88         27 Leadership                                         Tackler
         7            3            1             3          2            1              13                  75          7          5                2 Marquinhos                                                 88         27 Leadership                                         Tackler
         8            1            1                                     1               4                  75          8          4                6 Ruben Dias                                                 88         24 Power Header                                       Solid Player
         8            2            1                        2            1               9                  90          8          4                6 Ruben Dias                                                 88         24 Power Header                                       Solid Player
         8            3            1             3          2            1              14                  85          8          4                6 Ruben Dias                                                 88         24 Power Header                                       Solid Player

6 rows selected.

SQL> CONNECT system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> GRANT CREATE ATTRIBUTE DIMENSION TO tecatech_lab1_4;

Grant succeeded.

SQL> GRANT CREATE HIERARCHY TO tecatech_lab1_4;

Grant succeeded.

SQL> GRANT CREATE ANALYTIC VIEW TO tecatech_lab1_4;

Grant succeeded.

SQL> CONNECT tecatech_lab1_4/alpha@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> CREATE OR REPLACE ATTRIBUTE DIMENSION time_attr_dim
  2  DIMENSION TYPE TIME
  3  USING timestamps
  4  ATTRIBUTES
  5     (year,
  6      month,
  7      day)
  8  LEVEL day
  9      LEVEL TYPE DAYS
 10      KEY day
 11  LEVEL month
 12      LEVEL TYPE MONTHS
 13      KEY month
 14  LEVEL year
 15      LEVEL TYPE YEARS
 16      KEY year;

Attribute dimension created.

SQL> CREATE OR REPLACE HIERARCHY time_hier
  2  USING time_attr_dim
  3     (day CHILD OF
  4      month CHILD OF
  5      year);

Hierarchy created.

SQL> SELECT year,
  2      month,
  3      day,
  4      member_name,
  5      member_unique_name,
  6      member_caption,
  7      member_description
  8  FROM time_hier
  9  ORDER BY hier_order;

      YEAR      MONTH        DAY MEMBER_NAME                              MEMBER_UNIQUE_NAME                                                               M M
---------- ---------- ---------- ---------------------------------------- -------------------------------------------------------------------------------- - -
                                 ALL                                      [ALL].[ALL]
      2022                       2022                                     [YEAR].&[2022]
      2022          6            6                                        [MONTH].&[2022]&[6]
      2022          6         10 10                                       [DAY].&[2022]&[6]&[10]
      2022          8            8                                        [MONTH].&[2022]&[8]
      2022          8         31 31                                       [DAY].&[2022]&[8]&[31]
      2023                       2023                                     [YEAR].&[2023]
      2023          1            1                                        [MONTH].&[2023]&[1]
      2023          1          1 1                                        [DAY].&[2023]&[1]&[1]
      2023          1         31 31                                       [DAY].&[2023]&[1]&[31]
      2023          6            6                                        [MONTH].&[2023]&[6]
      2023          6         10 10                                       [DAY].&[2023]&[6]&[10]

12 rows selected.

SQL> CREATE OR REPLACE ANALYTIC VIEW market_values_av
  2      CLASSIFICATION caption VALUE 'Market Values AV'
  3      CLASSIFICATION description VALUE 'Market Values Analytic View'
  4      CLASSIFICATION created_by VALUE 'Dmitriy Rodionov'
  5  USING market_values
  6  DIMENSION BY
  7     (time_attr_dim
  8      KEY timestamp_id REFERENCES day
  9      HIERARCHIES (
 10          time_hier DEFAULT)
 11     )
 12  MEASURES
 13     (market_values FACT player_market_value
 14          CLASSIFICATION caption VALUE 'Market Values'
 15          CLASSIFICATION description VALUE 'Player Market Values'
 16          CLASSIFICATION format_string VALUE '999',
 17      market_values_prior_period AS
 18         (LAG(market_values) OVER (HIERARCHY time_hier OFFSET 1))
 19          CLASSIFICATION caption VALUE 'Market Values Prior Period'
 20          CLASSIFICATION description VALUE 'Market Values Prior Period'
 21          CLASSIFICATION format_string VALUE '999',
 22      market_values_chg_prior_period AS
 23         (LAG_DIFF(market_values) OVER (HIERARCHY time_hier OFFSET 1))
 24          CLASSIFICATION caption VALUE 'Market Values Change Prior Period'
 25          CLASSIFICATION description VALUE 'Market Values Change Prior Period'
 26          CLASSIFICATION format_string VALUE '999'
 27  );
    KEY timestamp_id REFERENCES day
                                *
ERROR at line 8:
ORA-18298: The REFERENCES clause for the analytic view dimension
"TIME_ATTR_DIM" does not determine the lowest level of every hierarchy.

SQL>
```