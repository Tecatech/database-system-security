```sql
PS C:\Users\Admin> sqlldr tecatech_lab1_1/alpha@"DESKTOP-VA4QSE1:1521/xepdb1" control = C:\Users\Admin\Documents\control\Teams.ctl log = C:\Users\Admin\Documents\log\Teams.log

SQL*Loader: Release 18.0.0.0.0 - Production on Fri Apr 1 19:02:29 2022
Version 18.4.0.0.0

Copyright (c) 1982, 2019, Oracle and/or its affiliates.  All rights reserved.

Path used:      Conventional
Commit point reached - logical record count 9
Commit point reached - logical record count 10

Table NATIONAL_TEAMS:
  10 Rows successfully loaded.

Check the log file:
  C:\Users\Admin\Documents\log\Teams.log
for more information about the load.
PS C:\Users\Admin> sqlldr tecatech_lab1_1/alpha@"DESKTOP-VA4QSE1:1521/xepdb1" control = C:\Users\Admin\Documents\control\Leagues.ctl log = C:\Users\Admin\Documents\log\Leagues.log

SQL*Loader: Release 18.0.0.0.0 - Production on Fri Apr 1 19:03:30 2022
Version 18.4.0.0.0

Copyright (c) 1982, 2019, Oracle and/or its affiliates.  All rights reserved.

Path used:      Conventional
Commit point reached - logical record count 9
Commit point reached - logical record count 10

Table LEAGUES:
  10 Rows successfully loaded.

Check the log file:
  C:\Users\Admin\Documents\log\Leagues.log
for more information about the load.
PS C:\Users\Admin> sqlldr tecatech_lab1_1/alpha@"DESKTOP-VA4QSE1:1521/xepdb1" control = C:\Users\Admin\Documents\control\Clubs.ctl log = C:\Users\Admin\Documents\log\Clubs.log

SQL*Loader: Release 18.0.0.0.0 - Production on Fri Apr 1 19:04:22 2022
Version 18.4.0.0.0

Copyright (c) 1982, 2019, Oracle and/or its affiliates.  All rights reserved.

Path used:      Conventional
Commit point reached - logical record count 14
Commit point reached - logical record count 15

Table CLUBS:
  15 Rows successfully loaded.

Check the log file:
  C:\Users\Admin\Documents\log\Clubs.log
for more information about the load.
PS C:\Users\Admin> sqlldr tecatech_lab1_1/alpha@"DESKTOP-VA4QSE1:1521/xepdb1" control = C:\Users\Admin\Documents\control\Players.ctl log = C:\Users\Admin\Documents\log\Players.log

SQL*Loader: Release 18.0.0.0.0 - Production on Fri Apr 1 19:04:55 2022
Version 18.4.0.0.0

Copyright (c) 1982, 2019, Oracle and/or its affiliates.  All rights reserved.

Path used:      Conventional
Commit point reached - logical record count 14
Commit point reached - logical record count 15

Table PLAYERS:
  15 Rows successfully loaded.

Check the log file:
  C:\Users\Admin\Documents\log\Players.log
for more information about the load.
PS C:\Users\Admin> sqlldr tecatech_lab1_1/alpha@"DESKTOP-VA4QSE1:1521/xepdb1" control = C:\Users\Admin\Documents\control\Sponsors.ctl log = C:\Users\Admin\Documents\log\Sponsors.log

SQL*Loader: Release 18.0.0.0.0 - Production on Fri Apr 1 19:06:02 2022
Version 18.4.0.0.0

Copyright (c) 1982, 2019, Oracle and/or its affiliates.  All rights reserved.

Path used:      Conventional
Commit point reached - logical record count 4
Commit point reached - logical record count 5

Table SPONSORS:
  5 Rows successfully loaded.

Check the log file:
  C:\Users\Admin\Documents\log\Sponsors.log
for more information about the load.
PS C:\Users\Admin> sqlplus tecatech_lab1_1/alpha@"DESKTOP-VA4QSE1:1521/xepdb1"

SQL*Plus: Release 18.0.0.0.0 - Production on Fri Apr 1 19:11:06 2022
Version 18.4.0.0.0

Copyright (c) 1982, 2018, Oracle.  All rights reserved.

Last Successful login time: Fri Apr 01 2022 19:06:03 +03:00

Connected to:
Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0

SQL> INSERT ALL
  2      INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (11, 'Uruguay', 1635.73, 'CONMEBOL')
  3      INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (12, 'Denmark', 1653.66, 'UEFA')
  4  SELECT * FROM dual;

2 rows created.

SQL> INSERT ALL
  2      INTO leagues(league_id, national_team_id, league_name) VALUES (11, 12, 'Superliga')
  3      INTO leagues(league_id, national_team_id, league_name) VALUES (12, 11, 'Liga Profesional')
  4  SELECT * FROM dual;

2 rows created.

SQL> INSERT ALL
  2      INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (16, 11, 'Brondby IF', 'Idraetsforening')
  3      INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (17, 12, 'Atletico Penarol', 'Estadio Campeon del Siglo')
  4  SELECT * FROM dual;

2 rows created.

SQL> INSERT ALL
  2      INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (16, 17, 11, 'Agustin Martinez', 77, 20, 'Finesse Shot', 'Second Wind')
  3      INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (17, 16, 12, 'Simon Hedlund', 78, 29, 'Early Crosser', 'Swerve Pass')
  4   SELECT * FROM dual;

2 rows created.

SQL> INSERT ALL
  2      INTO sponsors(sponsor_id, national_team_id, club_id, player_id, sponsor_name) VALUES (6, 12, 16, 17, 'Bet25')
  3      INTO sponsors(sponsor_id, national_team_id, club_id, player_id, sponsor_name) VALUES (7, 11, 17, 16, 'Nissan')
  4  SELECT * FROM dual;

2 rows created.

SQL> SELECT * FROM national_teams;

NATIONAL_TEAM_ID NATIONAL_TEAM_NAME                                           NATIONAL_TEAM_POINTS NATIONAL_TEAM_ASSOCIATION
---------------- ------------------------------------------------------------ -------------------- -------------------------
               1 Brazil                                                                    1823.42 CONMEBOL
               2 Belgium                                                                   1828.45 UEFA
               3 Mexico                                                                    1647.91 CONCACAF
               4 IR Iran                                                                   1572.89 AFC
               5 New Zealand                                                               1161.66 OFC
               6 Senegal                                                                   1587.78 CAF
               7 France                                                                    1786.15 UEFA
               8 England                                                                   1755.52 UEFA
               9 Argentina                                                                 1766.99 CONMEBOL
              10 Portugal                                                                  1660.25 UEFA
              11 Uruguay                                                                   1635.73 CONMEBOL
              12 Denmark                                                                   1653.66 UEFA

12 rows selected.

SQL> SELECT national_team_name FROM national_teams;

NATIONAL_TEAM_NAME
------------------------------------------------------------
Brazil
Belgium
Mexico
IR Iran
New Zealand
Senegal
France
England
Argentina
Portugal
Uruguay
Denmark

12 rows selected.

SQL> SELECT national_team_name
  2  FROM national_teams
  3  WHERE national_team_points > 1700;

NATIONAL_TEAM_NAME
------------------------------------------------------------
Brazil
Belgium
France
England
Argentina

SQL> SELECT national_team_name
  2  FROM national_teams
  3  ORDER BY national_team_points DESC;

NATIONAL_TEAM_NAME
------------------------------------------------------------
Belgium
Brazil
France
Argentina
England
Portugal
Denmark
Mexico
Uruguay
Senegal
IR Iran
New Zealand

12 rows selected.

SQL> SELECT
  2      national_team_name,
  3      TRUNC(national_team_points)
  4  FROM national_teams;

NATIONAL_TEAM_NAME                                           TRUNC(NATIONAL_TEAM_POINTS)
------------------------------------------------------------ ---------------------------
Brazil                                                                              1823
Belgium                                                                             1828
Mexico                                                                              1647
IR Iran                                                                             1572
New Zealand                                                                         1161
Senegal                                                                             1587
France                                                                              1786
England                                                                             1755
Argentina                                                                           1766
Portugal                                                                            1660
Uruguay                                                                             1635
Denmark                                                                             1653

12 rows selected.

SQL> SELECT
  2      national_team_association,
  3      MAX(national_team_points)
  4  FROM national_teams
  5  GROUP BY national_team_association;

NATIONAL_TEAM_ASSOCIATION MAX(NATIONAL_TEAM_POINTS)
------------------------- -------------------------
UEFA                                        1828.45
CONCACAF                                    1647.91
CONMEBOL                                    1823.42
AFC                                         1572.89
OFC                                         1161.66
CAF                                         1587.78

6 rows selected.

SQL> SELECT UNIQUE national_team_association FROM national_teams;

NATIONAL_TEAM_ASSOCIATION
-------------------------
UEFA
CONCACAF
CONMEBOL
AFC
OFC
CAF

6 rows selected.

SQL> SELECT * FROM leagues;

 LEAGUE_ID NATIONAL_TEAM_ID LEAGUE_NAME
---------- ---------------- --------------------------------------------------
         1                8 Premier League
         2                7 Ligue 1 Conforama
         3               10 Liga NOS
         4                2 Pro League
         5                1 Serie A
         6                9 Primera Division
         7                3 Liga MX
         8                6 Ligue 1 Douanes
         9                4 Persian Gulf Pro League
        10                5 National League
        11               12 Superliga
        12               11 Liga Profesional

12 rows selected.

SQL> SELECT league_name FROM leagues;

LEAGUE_NAME
--------------------------------------------------
Premier League
Ligue 1 Conforama
Liga NOS
Pro League
Serie A
Primera Division
Liga MX
Ligue 1 Douanes
Persian Gulf Pro League
National League
Superliga
Liga Profesional

12 rows selected.

SQL> SELECT league_name
  2  FROM leagues
  3  WHERE national_team_id < 8;

LEAGUE_NAME
--------------------------------------------------
Ligue 1 Conforama
Pro League
Serie A
Liga MX
Ligue 1 Douanes
Persian Gulf Pro League
National League

7 rows selected.

SQL> SELECT league_name
  2  FROM leagues
  3  ORDER BY national_team_id ASC;

LEAGUE_NAME
--------------------------------------------------
Serie A
Pro League
Liga MX
Persian Gulf Pro League
National League
Ligue 1 Douanes
Ligue 1 Conforama
Premier League
Primera Division
Liga NOS
Liga Profesional
Superliga

12 rows selected.

SQL> SELECT * FROM clubs;

CLUB_ID LEAGUE_ID CLUB_NAME                                          CLUB_STADIUM
------- --------- -------------------------------------------------- --------------------------------------------------
      1         2 Paris Saint-Germain                                Parc Des Princes
      2         6 Boca Juniors                                       La Bombonera
      3         1 Arsenal                                            Emirates Stadium
      4         3 SL Benfica                                         Estadio da Luz
      5        10 Auckland City FC                                   Kiwitea Street
      6         1 Everton                                            Goodison Park
      7         3 FC Porto                                           Estadio do Dragao
      8         9 Persepolis                                         Azadi Soccer Field
      9         7 Tigres UANL                                        University Stadium
     10         1 Manchester City                                    Etihad Stadium
     11         5 Atletico Mineiro                                   Estadio Governador
     12         6 River Plate                                        Estadio Monumental
     13         4 Club Brugge                                        Jan Breydelstadion
     14         1 Manchester United                                  Old Trafford
     15         7 Monterrey FC                                       Estadio Bancomer
     16        11 Brondby IF                                         Idraetsforening
     17        12 Atletico Penarol                                   Estadio Campeon del Siglo

17 rows selected.

SQL> SELECT club_name FROM clubs;

CLUB_NAME
--------------------------------------------------
Paris Saint-Germain
Boca Juniors
Arsenal
SL Benfica
Auckland City FC
Everton
FC Porto
Persepolis
Tigres UANL
Manchester City
Atletico Mineiro
River Plate
Club Brugge
Manchester United
Monterrey FC
Brondby IF
Atletico Penarol

17 rows selected.

SQL> SELECT club_name
  2  FROM clubs
  3  WHERE league_id = 1;

CLUB_NAME
--------------------------------------------------
Arsenal
Everton
Manchester City
Manchester United

SQL> SELECT club_name
  2  FROM clubs
  3  ORDER BY league_id ASC;

CLUB_NAME
--------------------------------------------------
Everton
Manchester City
Manchester United
Arsenal
Paris Saint-Germain
FC Porto
SL Benfica
Club Brugge
Atletico Mineiro
River Plate
Boca Juniors
Tigres UANL
Monterrey FC
Persepolis
Auckland City FC
Brondby IF
Atletico Penarol

17 rows selected.

SQL> SELECT * FROM players;

PLAYER_ID CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
--------- ------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
        1       3                7 Alexandre Lacazette                                        85         30 Chip Shot                                          Solid Player
        2       6                8 Dominic Calvert-Lewin                                      81         25 Power Header                                       Poacher
        3       2                9 Cristian Pavon                                             78         26 Clinical Finisher                                  Crosser
        4       1                7 Kylian Mbappe                                              91         23 Speed Dribbler                                     Speedster
        5       7                4 Mehdi Taremi                                               79         29 Strength                                           Flair
        6      10                2 Kevin De Bruyne                                            91         30 Playmaker                                          Engine
        7       4               10 Rafa Silva                                                 82         28 Outside Foot Shot                                  Speed Dribbler
        8       5                5 Cameron Howieson                                           70         27 Tackler                                            Team Player
        9      14               10 Cristiano Ronaldo                                          91         36 Long Shot Taker                                    Aerial Threat
       10       1                9 Lionel Messi                                               93         34 One Club Player                                    Free Kick Specialist
       11      15                3 Hector Moreno                                              77         33 Leadership                                         Injury Prone
       12      10               10 Ruben Dias                                                 88         24 Tactician                                          Power Header
       13       8                4 Vahid Amiri                                                72         33 Set Play Specialist                                Bicycle Kicks
       14       1                1 Neymar Jr                                                  91         30 Technical Dribbler                                 Acrobat
       15      10                1 Ederson                                                    89         27 Comes for Crosses                                  Long Passer
       16      17               11 Agustin Martinez                                           77         20 Finesse Shot                                       Second Wind
       17      16               12 Simon Hedlund                                              78         29 Early Crosser                                      Swerve Pass

17 rows selected.

SQL> SELECT player_name FROM players;

PLAYER_NAME
--------------------------------------------------
Alexandre Lacazette
Dominic Calvert-Lewin
Cristian Pavon
Kylian Mbappe
Mehdi Taremi
Kevin De Bruyne
Rafa Silva
Cameron Howieson
Cristiano Ronaldo
Lionel Messi
Hector Moreno
Ruben Dias
Vahid Amiri
Neymar Jr
Ederson
Agustin Martinez
Simon Hedlund

17 rows selected.

SQL> SELECT player_name
  2  FROM players
  3  WHERE player_ovr > 80;

PLAYER_NAME
--------------------------------------------------
Alexandre Lacazette
Dominic Calvert-Lewin
Kylian Mbappe
Kevin De Bruyne
Rafa Silva
Cristiano Ronaldo
Lionel Messi
Ruben Dias
Neymar Jr
Ederson

10 rows selected.

SQL> SELECT player_name
  2  FROM players
  3  WHERE player_age < 30;

PLAYER_NAME
--------------------------------------------------
Dominic Calvert-Lewin
Cristian Pavon
Kylian Mbappe
Mehdi Taremi
Rafa Silva
Cameron Howieson
Ruben Dias
Ederson
Agustin Martinez
Simon Hedlund

10 rows selected.

SQL> SELECT player_name
  2  FROM players
  3  ORDER BY player_ovr DESC;

PLAYER_NAME
--------------------------------------------------
Lionel Messi
Neymar Jr
Kylian Mbappe
Cristiano Ronaldo
Kevin De Bruyne
Ederson
Ruben Dias
Alexandre Lacazette
Rafa Silva
Dominic Calvert-Lewin
Mehdi Taremi
Cristian Pavon
Simon Hedlund
Hector Moreno
Agustin Martinez
Vahid Amiri
Cameron Howieson

17 rows selected.

SQL> SELECT player_name
  2  FROM players
  3  ORDER BY player_age ASC;

PLAYER_NAME
--------------------------------------------------
Agustin Martinez
Kylian Mbappe
Ruben Dias
Dominic Calvert-Lewin
Cristian Pavon
Cameron Howieson
Ederson
Rafa Silva
Simon Hedlund
Mehdi Taremi
Kevin De Bruyne
Neymar Jr
Alexandre Lacazette
Vahid Amiri
Hector Moreno
Lionel Messi
Cristiano Ronaldo

17 rows selected.

SQL> SELECT
  2      club_id,
  3      MAX(player_ovr)
  4  FROM players
  5  GROUP BY club_id;

   CLUB_ID MAX(PLAYER_OVR)
---------- ---------------
         6              81
        14              91
         1              93
         7              79
        15              77
         2              78
         8              72
        17              77
        10              91
         4              82
         5              70
         3              85
        16              78

13 rows selected.

SQL> SELECT
  2      player_name,
  3      TRUNC(player_ovr, -1)
  4  FROM players;

PLAYER_NAME                                        TRUNC(PLAYER_OVR, -1)
-------------------------------------------------- ---------------------
Alexandre Lacazette                                                   80
Dominic Calvert-Lewin                                                 80
Cristian Pavon                                                        70
Kylian Mbappe                                                         90
Mehdi Taremi                                                          70
Kevin De Bruyne                                                       90
Rafa Silva                                                            80
Cameron Howieson                                                      70
Cristiano Ronaldo                                                     90
Lionel Messi                                                          90
Hector Moreno                                                         70
Ruben Dias                                                            80
Vahid Amiri                                                           70
Neymar Jr                                                             90
Ederson                                                               80
Agustin Martinez                                                      70
Simon Hedlund                                                         70

17 rows selected.

SQL> SELECT * FROM sponsors;

SPONSOR_ID NATIONAL_TEAM_ID    CLUB_ID  PLAYER_ID SPONSOR_NAME
---------- ---------------- ---------- ---------- --------------------------------------------------
         1                8          7          6 Adidas
         2                7          3          9 Nike
         3                1          5         14 Puma
         4                9         12          7 Spotify
         5                2          9          5 Red Bull
         6               12         16         17 Bet25
         7               11         17         16 Nissan

7 rows selected.

SQL> SELECT sponsor_name FROM sponsors;

SPONSOR_NAME
--------------------------------------------------
Adidas
Nike
Puma
Spotify
Red Bull
Bet25
Nissan

7 rows selected.

SQL> SELECT sponsor_name
  2  FROM sponsors
  3  WHERE player_id > 7;

SPONSOR_NAME
--------------------------------------------------
Nike
Puma
Bet25
Nissan

SQL> SELECT sponsor_name
  2  FROM sponsors
  3  ORDER BY national_team_id ASC;

SPONSOR_NAME
--------------------------------------------------
Puma
Red Bull
Nike
Adidas
Spotify
Nissan
Bet25

7 rows selected.

SQL> SELECT
  2  CASE
  3      WHEN player_age < 25 THEN 'under 25'
  4      WHEN player_age BETWEEN 25 AND 30 THEN 'from 25 to 30'
  5      ELSE 'over 30'
  6  END AS player_age,
  7  MIN(player_ovr) AS MIN_OVR
  8  FROM players
  9  GROUP BY
 10  CASE
 11      WHEN player_age < 25 THEN 'under 25'
 12      WHEN player_age BETWEEN 25 AND 30 THEN 'from 25 to 30'
 13      ELSE 'over 30'
 14  END;

PLAYER_AGE       MIN_OVR
------------- ----------
over 30               72
from 25 to 30         70
under 25              77

SQL> SELECT
  2  CASE
  3      WHEN player_age < 25 THEN 'under 25'
  4      WHEN player_age BETWEEN 25 AND 30 THEN 'from 25 to 30'
  5      ELSE 'over 30'
  6  END AS player_age,
  7  TRUNC(AVG(player_ovr)) AS AVG_OVR
  8  FROM players
  9  GROUP BY
 10  CASE
 11      WHEN player_age < 25 THEN 'under 25'
 12      WHEN player_age BETWEEN 25 AND 30 THEN 'from 25 to 30'
 13      ELSE 'over 30'
 14  END;

PLAYER_AGE       AVG_OVR
------------- ----------
over 30               83
from 25 to 30         82
under 25              85

SQL> SELECT
  2  CASE
  3      WHEN player_age < 25 THEN 'under 25'
  4      WHEN player_age BETWEEN 25 AND 30 THEN 'from 25 to 30'
  5      ELSE 'over 30'
  6  END AS player_age,
  7  MAX(player_ovr) AS MAX_OVR
  8  FROM players
  9  GROUP BY
 10  CASE
 11      WHEN player_age < 25 THEN 'under 25'
 12      WHEN player_age BETWEEN 25 AND 30 THEN 'from 25 to 30'
 13      ELSE 'over 30'
 14  END;

PLAYER_AGE       MAX_OVR
------------- ----------
over 30               93
from 25 to 30         91
under 25              91

SQL> SELECT
  2      (player_age_group * 5) || '-' || (player_age_group * 5 + 4) AS player_age_group,
  3      MIN(player_ovr) AS min_player_ovr
  4  FROM (
  5      SELECT
  6          TRUNC(player_age / 5) AS player_age_group,
  7          player_ovr
  8      FROM (
  9          SELECT
 10              player_age,
 11              MIN(player_ovr) AS player_ovr
 12          FROM players
 13          GROUP BY player_age
 14          ORDER BY player_age
 15      )
 16  )
 17  GROUP BY player_age_group
 18  ORDER BY player_age_group;

PLAYER_AGE_GROUP                                                                 MIN_PLAYER_OVR
-------------------------------------------------------------------------------- --------------
20-24                                                                                        77
25-29                                                                                        70
30-34                                                                                        72
35-39                                                                                        91

SQL> SELECT
  2      (player_age_group * 5) || '-' || (player_age_group * 5 + 4) AS player_age_group,
  3      TRUNC(AVG(player_ovr)) AS avg_player_ovr
  4  FROM (
  5      SELECT
  6          TRUNC(player_age / 5) AS player_age_group,
  7          player_ovr
  8      FROM (
  9          SELECT
 10              player_age,
 11              TRUNC(AVG(player_ovr)) AS player_ovr
 12          FROM players
 13          GROUP BY player_age
 14          ORDER BY player_age
 15      )
 16  )
 17  GROUP BY player_age_group
 18  ORDER BY player_age_group;

PLAYER_AGE_GROUP                                                                 AVG_PLAYER_OVR
-------------------------------------------------------------------------------- --------------
20-24                                                                                        85
25-29                                                                                        79
30-34                                                                                        85
35-39                                                                                        91

SQL> SELECT
  2      (player_age_group * 5) || '-' || (player_age_group * 5 + 4) AS player_age_group,
  3      MAX(player_ovr) AS max_player_ovr
  4  FROM (
  5      SELECT
  6          TRUNC(player_age / 5) AS player_age_group,
  7          player_ovr
  8      FROM (
  9          SELECT
 10              player_age,
 11              MAX(player_ovr) AS player_ovr
 12          FROM players
 13          GROUP BY player_age
 14          ORDER BY player_age
 15      )
 16  )
 17  GROUP BY player_age_group
 18  ORDER BY player_age_group;

PLAYER_AGE_GROUP                                                                 MAX_PLAYER_OVR
-------------------------------------------------------------------------------- --------------
20-24                                                                                        91
25-29                                                                                        89
30-34                                                                                        93
35-39                                                                                        91

SQL> SELECT sysdate FROM dual;

SYSDATE
---------
01-APR-22

SQL> COMMIT;

Commit complete.

SQL> EXIT;
Disconnected from Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0
```