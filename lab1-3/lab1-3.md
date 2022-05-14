```sql
PS C:\Users\Admin> sqlplus tecatech_lab1_1/alpha@"DESKTOP-VA4QSE1:1521/xepdb1"

SQL*Plus: Release 18.0.0.0.0 - Production on Wed Apr 27 10:24:44 2022
Version 18.4.0.0.0

Copyright (c) 1982, 2018, Oracle.  All rights reserved.

Last Successful login time: Wed Apr 27 2022 10:22:24 +03:00

Connected to:
Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0

SQL> SELECT * FROM players WHERE national_team_id IN (SELECT national_team_id FROM national_teams WHERE national_team_points > 1700);

 PLAYER_ID    CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
---------- ---------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
        14          1                1 Neymar Jr                                                  91         30 Technical Dribbler                                 Acrobat
        15         10                1 Ederson                                                    89         27 Comes for Crosses                                  Long Passer
         6         10                2 Kevin De Bruyne                                            91         30 Playmaker                                          Engine
         4          1                7 Kylian Mbappe                                              91         23 Speed Dribbler                                     Speedster
         1          3                7 Alexandre Lacazette                                        85         30 Chip Shot                                          Solid Player
         2          6                8 Dominic Calvert-Lewin                                      81         25 Power Header                                       Poacher
        10          1                9 Lionel Messi                                               93         34 One Club Player                                    Free Kick Specialist
         3          2                9 Cristian Pavon                                             78         26 Clinical Finisher                                  Crosser

8 rows selected.

SQL> SELECT * FROM players WHERE national_team_id IN (SELECT national_team_id FROM national_teams WHERE national_team_association = 'UEFA');

 PLAYER_ID    CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
---------- ---------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
         6         10                2 Kevin De Bruyne                                            91         30 Playmaker                                          Engine
         4          1                7 Kylian Mbappe                                              91         23 Speed Dribbler                                     Speedster
         1          3                7 Alexandre Lacazette                                        85         30 Chip Shot                                          Solid Player
         2          6                8 Dominic Calvert-Lewin                                      81         25 Power Header                                       Poacher
         9         14               10 Cristiano Ronaldo                                          91         36 Long Shot Taker                                    Aerial Threat
        12         10               10 Ruben Dias                                                 88         24 Tactician                                          Power Header
         7          4               10 Rafa Silva                                                 82         28 Outside Foot Shot                                  Speed Dribbler
        17         16               12 Simon Hedlund                                              78         29 Early Crosser                                      Swerve Pass

8 rows selected.

SQL> SELECT * FROM sponsors WHERE player_id IN (SELECT player_id FROM players WHERE player_ovr > 80);

SPONSOR_ID NATIONAL_TEAM_ID    CLUB_ID  PLAYER_ID SPONSOR_NAME
---------- ---------------- ---------- ---------- --------------------------------------------------
         1                8          7          6 Adidas
         4                9         12          7 Spotify
         2                7          3          9 Nike
         3                1          5         14 Puma

SQL> SELECT player_name, (
  2  SELECT ROUND(player_ovr * (
  3  SELECT national_team_points / (
  4  SELECT AVG(national_team_points) AS national_team_coefficient
  5  FROM national_teams) AS national_team_coefficient
  6  FROM national_teams
  7  WHERE national_team_id = players.national_team_id))
  8  FROM dual) AS player_ovr_upgrade
  9  FROM players
 10  ORDER BY player_ovr_upgrade DESC;

PLAYER_NAME                                        PLAYER_OVR_UPGRADE
-------------------------------------------------- ------------------
Neymar Jr                                                         100
Kevin De Bruyne                                                   100
Lionel Messi                                                       99
Ederson                                                            98
Kylian Mbappe                                                      98
Alexandre Lacazette                                                92
Cristiano Ronaldo                                                  91
Ruben Dias                                                         88
Dominic Calvert-Lewin                                              86
Cristian Pavon                                                     83
Rafa Silva                                                         82
Simon Hedlund                                                      78
Hector Moreno                                                      77
Agustin Martinez                                                   76
Mehdi Taremi                                                       75
Vahid Amiri                                                        74
Cameron Howieson                                                   69

17 rows selected.

SQL> SELECT national_teams.national_team_name, leagues.league_name FROM national_teams, leagues WHERE national_teams.national_team_id = leagues.national_team_id;

NATIONAL_TEAM_NAME                                           LEAGUE_NAME
------------------------------------------------------------ --------------------------------------------------
Brazil                                                       Serie A
Belgium                                                      Pro League
Mexico                                                       Liga MX
IR Iran                                                      Persian Gulf Pro League
New Zealand                                                  National League
Senegal                                                      Ligue 1 Douanes
France                                                       Ligue 1 Conforama
England                                                      Premier League
Argentina                                                    Primera Division
Portugal                                                     Liga NOS
Uruguay                                                      Liga Profesional
Denmark                                                      Superliga

12 rows selected.

SQL> SELECT national_teams.national_team_name, players.player_name FROM national_teams, players WHERE national_teams.national_team_id = players.national_team_id;

NATIONAL_TEAM_NAME                                           PLAYER_NAME
------------------------------------------------------------ --------------------------------------------------
Brazil                                                       Neymar Jr
Brazil                                                       Ederson
Belgium                                                      Kevin De Bruyne
Mexico                                                       Hector Moreno
IR Iran                                                      Mehdi Taremi
IR Iran                                                      Vahid Amiri
New Zealand                                                  Cameron Howieson
France                                                       Kylian Mbappe
France                                                       Alexandre Lacazette
England                                                      Dominic Calvert-Lewin
Argentina                                                    Lionel Messi
Argentina                                                    Cristian Pavon
Portugal                                                     Cristiano Ronaldo
Portugal                                                     Ruben Dias
Portugal                                                     Rafa Silva
Uruguay                                                      Agustin Martinez
Denmark                                                      Simon Hedlund

17 rows selected.

SQL> SELECT leagues.league_name, clubs.club_name FROM leagues, clubs WHERE leagues.league_id = clubs.league_id;

LEAGUE_NAME                                        CLUB_NAME
-------------------------------------------------- --------------------------------------------------
Premier League                                     Everton
Premier League                                     Manchester City
Premier League                                     Manchester United
Premier League                                     Arsenal
Ligue 1 Conforama                                  Paris Saint-Germain
Liga NOS                                           FC Porto
Liga NOS                                           SL Benfica
Pro League                                         Club Brugge
Serie A                                            Atletico Mineiro
Primera Division                                   River Plate
Primera Division                                   Boca Juniors
Liga MX                                            Tigres UANL
Liga MX                                            Monterrey FC
Persian Gulf Pro League                            Persepolis
National League                                    Auckland City FC
Superliga                                          Brondby IF
Liga Profesional                                   Atletico Penarol

17 rows selected.

SQL> SELECT clubs.club_name, players.player_name FROM clubs, players WHERE clubs.club_id = players.club_id;

CLUB_NAME                                          PLAYER_NAME
-------------------------------------------------- --------------------------------------------------
Paris Saint-Germain                                Lionel Messi
Paris Saint-Germain                                Neymar Jr
Paris Saint-Germain                                Kylian Mbappe
Boca Juniors                                       Cristian Pavon
Arsenal                                            Alexandre Lacazette
SL Benfica                                         Rafa Silva
Auckland City FC                                   Cameron Howieson
Everton                                            Dominic Calvert-Lewin
FC Porto                                           Mehdi Taremi
Persepolis                                         Vahid Amiri
Manchester City                                    Kevin De Bruyne
Manchester City                                    Ederson
Manchester City                                    Ruben Dias
Manchester United                                  Cristiano Ronaldo
Monterrey FC                                       Hector Moreno
Brondby IF                                         Simon Hedlund
Atletico Penarol                                   Agustin Martinez

17 rows selected.

SQL> SELECT national_team1.national_team_name, national_team2.national_team_name, national_team1.national_team_association
  2  FROM national_teams national_team1, national_teams national_team2
  3  WHERE national_team1.national_team_name != national_team2.national_team_name
  4  AND national_team1.national_team_association = national_team2.national_team_association;

NATIONAL_TEAM_NAME                                           NATIONAL_TEAM_NAME                                           NATIONAL_TEAM_ASSOCIATION
------------------------------------------------------------ ------------------------------------------------------------ -------------------------
Argentina                                                    Brazil                                                       CONMEBOL
Uruguay                                                      Brazil                                                       CONMEBOL
France                                                       Belgium                                                      UEFA
England                                                      Belgium                                                      UEFA
Portugal                                                     Belgium                                                      UEFA
Denmark                                                      Belgium                                                      UEFA
England                                                      France                                                       UEFA
Portugal                                                     France                                                       UEFA
Denmark                                                      France                                                       UEFA
Portugal                                                     England                                                      UEFA
Denmark                                                      England                                                      UEFA
Uruguay                                                      Argentina                                                    CONMEBOL
Denmark                                                      Portugal                                                     UEFA

13 rows selected.

SQL> SELECT league1.league_name, (
  2  league2.league_name, (
  3  SELECT national_team_name FROM national_teams WHERE national_team_id = league1.national_team_id) AS national_team_name
  4  FROM leagues league1, leagues league2
  5  WHERE league1.league_name != league2.league_name
  6  AND league1.national_team_id = league2.national_team_id;

no rows selected

SQL> SELECT club1.club_name,
  2  club2.club_name, (
  3  SELECT league_name FROM leagues WHERE league_id = club1.league_id) AS league_name
  4  FROM clubs club1, clubs club2
  5  WHERE club1.club_id != club2.club_id
  6  AND club1.league_id = club2.league_id;

CLUB_NAME                                          CLUB_NAME                                          LEAGUE_NAME
-------------------------------------------------- -------------------------------------------------- --------------------------------------------------
River Plate                                        Boca Juniors                                       Primera Division
Everton                                            Arsenal                                            Premier League
Everton                                            Manchester City                                    Premier League
Arsenal                                            Manchester United                                  Premier League
FC Porto                                           SL Benfica                                         Liga NOS
Everton                                            Manchester United                                  Premier League
Arsenal                                            Manchester City                                    Premier League
Manchester City                                    Manchester United                                  Premier League
Monterrey FC                                       Tigres UANL                                        Liga MX

9 rows selected.

SQL> SELECT player1.player_name, (
  2  player2.player_name, (
  3  SELECT club_name FROM clubs WHERE club_id = player1.club_id) AS club_name
  4  FROM players player1, players player2
  5  WHERE player1.player_id != player2.player_id
  6  AND player1.club_id = player2.club_id;

PLAYER_NAME                                        PLAYER_NAME                                        CLUB_NAME
-------------------------------------------------- -------------------------------------------------- --------------------------------------------------
Lionel Messi                                       Kylian Mbappe                                      Paris Saint-Germain
Lionel Messi                                       Neymar Jr                                          Paris Saint-Germain
Kevin De Bruyne                                    Ederson                                            Manchester City
Kylian Mbappe                                      Neymar Jr                                          Paris Saint-Germain
Kevin De Bruyne                                    Ruben Dias                                         Manchester City
Ederson                                            Ruben Dias                                         Manchester City

6 rows selected.

SQL> SELECT player1.player_name, (
  2  player2.player_name, (
  3  SELECT national_team_name FROM national_teams WHERE national_team_id = player1.national_team_id) AS national_team_name
  4  FROM players player1, players player2
  5  WHERE player1.player_id != player2.player_id
  6  AND player1.national_team_id = player2.national_team_id;

PLAYER_NAME                                        PLAYER_NAME                                        NATIONAL_TEAM_NAME
-------------------------------------------------- -------------------------------------------------- --------------------------------------------------
Kylian Mbappe                                      Alexandre Lacazette                                France
Lionel Messi                                       Cristian Pavon                                     Argentina
Mehdi Taremi                                       Vahid Amiri                                        IR Iran
Cristiano Ronaldo                                  Rafa Silva                                         Portugal
Cristiano Ronaldo                                  Ruben Dias                                         Portugal
Ruben Dias                                         Rafa Silva                                         Portugal
Neymar Jr                                          Ederson                                            Brazil

7 rows selected.

SQL> SELECT league_id,
  2  national_team_id,
  3  league_name,
  4  RPAD('.', (LEVEL - 1) * 2, '.') || league_id AS tree,
  5  LEVEL,
  6  CONNECT_BY_ROOT league_id AS root_id,
  7  LTRIM(SYS_CONNECT_BY_PATH(league_id, '-'), '-') AS path,
  8  CONNECT_BY_ISLEAF AS leaf,
  9  CONNECT_BY_ISCYCLE AS cycle
 10  FROM leagues
 11  START WITH league_id = 1
 12  CONNECT BY NOCYCLE PRIOR league_id = national_team_id
 13  ORDER SIBLINGS BY league_id;

 LEAGUE_ID NATIONAL_TEAM_ID LEAGUE_NAME                                        TREE                                                                                  LEVEL    ROOT_ID PATH                                                                                   LEAF      CYCLE
---------- ---------------- -------------------------------------------------- -------------------------------------------------------------------------------- ---------- ---------- -------------------------------------------------------------------------------- ---------- ----------
         1                8 Premier League                                     1                                                                                         1          1 1                                                                                         0          0
         5                1 Serie A                                            ..5                                                                                       2          1 1-5                                                                                       0          0
        10                5 National League                                    ....10                                                                                    3          1 1-5-10                                                                                    0          0
         3               10 Liga NOS                                           ......3                                                                                   4          1 1-5-10-3                                                                                  0          0
         7                3 Liga MX                                            ........7                                                                                 5          1 1-5-10-3-7                                                                                0          0
         2                7 Ligue 1 Conforama                                  ..........2                                                                               6          1 1-5-10-3-7-2                                                                              0          0
         4                2 Pro League                                         ............4                                                                             7          1 1-5-10-3-7-2-4                                                                            0          0
         9                4 Persian Gulf Pro League                            ..............9                                                                           8          1 1-5-10-3-7-2-4-9                                                                          0          0
         6                9 Primera Division                                   ................6                                                                         9          1 1-5-10-3-7-2-4-9-6                                                                        0          0
         8                6 Ligue 1 Douanes                                    ..................8                                                                      10          1 1-5-10-3-7-2-4-9-6-8                                                                      1          1

10 rows selected.

SQL> SELECT club_id,
  2  league_id,
  3  club_name,
  4  RPAD('.', (LEVEL - 1) * 2, '.') || club_id AS tree,
  5  LEVEL,
  6  CONNECT_BY_ROOT club_id AS root_id,
  7  LTRIM(SYS_CONNECT_BY_PATH(club_id, '-'), '-') AS path,
  8  CONNECT_BY_ISLEAF AS leaf,
  9  CONNECT_BY_ISCYCLE AS cycle
 10  FROM clubs
 11  START WITH club_id = 1
 12  CONNECT BY NOCYCLE PRIOR club_id = league_id
 13  ORDER SIBLINGS BY club_id;

   CLUB_ID  LEAGUE_ID CLUB_NAME                                          TREE                                                                                  LEVEL    ROOT_ID PATH                                                                                   LEAF      CYCLE
---------- ---------- -------------------------------------------------- -------------------------------------------------------------------------------- ---------- ---------- -------------------------------------------------------------------------------- ---------- ----------
         1          2 Paris Saint-Germain                                1                                                                                         1          1 1                                                                                         0          0
         3          1 Arsenal                                            ..3                                                                                       2          1 1-3                                                                                       0          0
         4          3 SL Benfica                                         ....4                                                                                     3          1 1-3-4                                                                                     0          0
        13          4 Club Brugge                                        ......13                                                                                  4          1 1-3-4-13                                                                                  1          0
         7          3 FC Porto                                           ....7                                                                                     3          1 1-3-7                                                                                     0          0
         9          7 Tigres UANL                                        ......9                                                                                   4          1 1-3-7-9                                                                                   0          0
         8          9 Persepolis                                         ........8                                                                                 5          1 1-3-7-9-8                                                                                 1          0
        15          7 Monterrey FC                                       ......15                                                                                  4          1 1-3-7-15                                                                                  1          0
         6          1 Everton                                            ..6                                                                                       2          1 1-6                                                                                       0          0
         2          6 Boca Juniors                                       ....2                                                                                     3          1 1-6-2                                                                                     1          1
        12          6 River Plate                                        ....12                                                                                    3          1 1-6-12                                                                                    0          0
        17         12 Atletico Penarol                                   ......17                                                                                  4          1 1-6-12-17                                                                                 1          0
        10          1 Manchester City                                    ..10                                                                                      2          1 1-10                                                                                      0          0
         5         10 Auckland City FC                                   ....5                                                                                     3          1 1-10-5                                                                                    0          0
        11          5 Atletico Mineiro                                   ......11                                                                                  4          1 1-10-5-11                                                                                 0          0
        16         11 Brondby IF                                         ........16                                                                                5          1 1-10-5-11-16                                                                              1          0
        14          1 Manchester United                                  ..14                                                                                      2          1 1-14                                                                                      1          0

17 rows selected.

SQL> SELECT national_team_name,
  2  national_team_points,
  3  MAX(national_team_points)
  4  OVER()
  5  AS max_national_team_points
  6  FROM national_teams
  7  ORDER BY national_team_points DESC;

NATIONAL_TEAM_NAME                                           NATIONAL_TEAM_POINTS MAX_NATIONAL_TEAM_POINTS
------------------------------------------------------------ -------------------- ------------------------
Belgium                                                                   1828.45                  1828.45
Brazil                                                                    1823.42                  1828.45
France                                                                    1786.15                  1828.45
Argentina                                                                 1766.99                  1828.45
England                                                                   1755.52                  1828.45
Portugal                                                                  1660.25                  1828.45
Denmark                                                                   1653.66                  1828.45
Mexico                                                                    1647.91                  1828.45
Uruguay                                                                   1635.73                  1828.45
Senegal                                                                   1587.78                  1828.45
IR Iran                                                                   1572.89                  1828.45
New Zealand                                                               1161.66                  1828.45

12 rows selected.

SQL> SELECT national_team_name,
  2  national_team_points,
  3  MAX(national_team_points)
  4  OVER(PARTITION BY national_team_association)
  5  AS max_national_team_points
  6  FROM national_teams
  7  ORDER BY national_team_points DESC;

NATIONAL_TEAM_NAME                                           NATIONAL_TEAM_POINTS MAX_NATIONAL_TEAM_POINTS
------------------------------------------------------------ -------------------- ------------------------
Belgium                                                                   1828.45                  1828.45
Brazil                                                                    1823.42                  1823.42
France                                                                    1786.15                  1828.45
Argentina                                                                 1766.99                  1823.42
England                                                                   1755.52                  1828.45
Portugal                                                                  1660.25                  1828.45
Denmark                                                                   1653.66                  1828.45
Mexico                                                                    1647.91                  1647.91
Uruguay                                                                   1635.73                  1823.42
Senegal                                                                   1587.78                  1587.78
IR Iran                                                                   1572.89                  1572.89
New Zealand                                                               1161.66                  1161.66

12 rows selected.

SQL> SELECT player_name,
  2  player_ovr,
  3  player_age,
  4  TRUNC(AVG(player_age))
  5  OVER()
  6  AS avg_player_age
  7  FROM players
  8  ORDER BY player_ovr DESC;

PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE AVG_PLAYER_AGE
-------------------------------------------------- ---------- ---------- --------------
Lionel Messi                                               93         34             28
Neymar Jr                                                  91         30             28
Kylian Mbappe                                              91         23             28
Cristiano Ronaldo                                          91         36             28
Kevin De Bruyne                                            91         30             28
Ederson                                                    89         27             28
Ruben Dias                                                 88         24             28
Alexandre Lacazette                                        85         30             28
Rafa Silva                                                 82         28             28
Dominic Calvert-Lewin                                      81         25             28
Mehdi Taremi                                               79         29             28
Cristian Pavon                                             78         26             28
Simon Hedlund                                              78         29             28
Hector Moreno                                              77         33             28
Agustin Martinez                                           77         20             28
Vahid Amiri                                                72         33             28
Cameron Howieson                                           70         27             28

17 rows selected.

SQL> SELECT player_name,
  2  club_id,
  3  player_ovr,
  4  player_age,
  5  AVG(player_age)
  6  OVER(PARTITION BY club_id)
  7  AS avg_player_age
  8  FROM players
  9  ORDER BY player_ovr DESC;

PLAYER_NAME                                           CLUB_ID PLAYER_OVR PLAYER_AGE AVG_PLAYER_AGE
-------------------------------------------------- ---------- ---------- ---------- --------------
Lionel Messi                                                1         93         34             29
Neymar Jr                                                   1         91         30             29
Kylian Mbappe                                               1         91         23             29
Cristiano Ronaldo                                          14         91         36             36
Kevin De Bruyne                                            10         91         30             27
Ederson                                                    10         89         27             27
Ruben Dias                                                 10         88         24             27
Alexandre Lacazette                                         3         85         30             30
Rafa Silva                                                  4         82         28             28
Dominic Calvert-Lewin                                       6         81         25             25
Mehdi Taremi                                                7         79         29             29
Cristian Pavon                                              2         78         26             26
Simon Hedlund                                              16         78         29             29
Agustin Martinez                                           17         77         20             20
Hector Moreno                                              15         77         33             33
Vahid Amiri                                                 8         72         33             33
Cameron Howieson                                            5         70         27             27

17 rows selected.

SQL> SELECT player_name,
  2  player_ovr,
  3  player_age,
  4  MIN(player_ovr)
  5  OVER()
  6  AS min_player_ovr
  7  FROM players
  8  ORDER BY player_ovr DESC;

PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE MIN_PLAYER_OVR
-------------------------------------------------- ---------- ---------- --------------
Lionel Messi                                               93         34             70
Neymar Jr                                                  91         30             70
Kylian Mbappe                                              91         23             70
Cristiano Ronaldo                                          91         36             70
Kevin De Bruyne                                            91         30             70
Ederson                                                    89         27             70
Ruben Dias                                                 88         24             70
Alexandre Lacazette                                        85         30             70
Rafa Silva                                                 82         28             70
Dominic Calvert-Lewin                                      81         25             70
Mehdi Taremi                                               79         29             70
Cristian Pavon                                             78         26             70
Simon Hedlund                                              78         29             70
Hector Moreno                                              77         33             70
Agustin Martinez                                           77         20             70
Vahid Amiri                                                72         33             70
Cameron Howieson                                           70         27             70

17 rows selected.

SQL> SELECT player_name,
  2  national_team_id,
  3  player_ovr,
  4  player_age,
  5  MIN(player_ovr)
  6  OVER(PARTITION BY national_team_id)
  7  AS min_player_ovr
  8  FROM players
  9  ORDER BY player_ovr DESC;

PLAYER_NAME                                        NATIONAL_TEAM_ID PLAYER_OVR PLAYER_AGE MIN_PLAYER_OVR
-------------------------------------------------- ---------------- ---------- ---------- --------------
Lionel Messi                                                      9         93         34             78
Neymar Jr                                                         1         91         30             89
Kevin De Bruyne                                                   2         91         30             91
Cristiano Ronaldo                                                10         91         36             82
Kylian Mbappe                                                     7         91         23             85
Ederson                                                           1         89         27             89
Ruben Dias                                                       10         88         24             82
Alexandre Lacazette                                               7         85         30             85
Rafa Silva                                                       10         82         28             82
Dominic Calvert-Lewin                                             8         81         25             81
Mehdi Taremi                                                      4         79         29             72
Simon Hedlund                                                    12         78         29             78
Cristian Pavon                                                    9         78         26             78
Hector Moreno                                                     3         77         33             77
Agustin Martinez                                                 11         77         20             77
Vahid Amiri                                                       4         72         33             72
Cameron Howieson                                                  5         70         27             70

17 rows selected.

SQL> SELECT national_team_name,
  2  national_team_points,
  3  LAG(national_team_points, 1, NULL)
  4  OVER(ORDER BY national_team_points)
  5  AS previous_national_team_points
  6  FROM national_teams;

NATIONAL_TEAM_NAME                                           NATIONAL_TEAM_POINTS PREVIOUS_NATIONAL_TEAM_POINTS
------------------------------------------------------------ -------------------- -----------------------------
New Zealand                                                               1161.66
IR Iran                                                                   1572.89                       1161.66
Senegal                                                                   1587.78                       1572.89
Uruguay                                                                   1635.73                       1587.78
Mexico                                                                    1647.91                       1635.73
Denmark                                                                   1653.66                       1647.91
Portugal                                                                  1660.25                       1653.66
England                                                                   1755.52                       1660.25
Argentina                                                                 1766.99                       1755.52
France                                                                    1786.15                       1766.99
Brazil                                                                    1823.42                       1786.15
Belgium                                                                   1828.45                       1823.42

12 rows selected.

SQL> SELECT national_team_name,
  2  national_team_points,
  3  LAG(national_team_points, 1, NULL)
  4  OVER(
  5  PARTITION BY national_team_association
  6  ORDER BY national_team_points DESC)
  7  AS next_national_team_points
  8  FROM national_teams;

NATIONAL_TEAM_NAME                                           NATIONAL_TEAM_POINTS NEXT_NATIONAL_TEAM_POINTS
------------------------------------------------------------ -------------------- -------------------------
IR Iran                                                                   1572.89
Senegal                                                                   1587.78
Mexico                                                                    1647.91
Brazil                                                                    1823.42
Argentina                                                                 1766.99                   1823.42
Uruguay                                                                   1635.73                   1766.99
New Zealand                                                               1161.66
Belgium                                                                   1828.45
France                                                                    1786.15                   1828.45
England                                                                   1755.52                   1786.15
Portugal                                                                  1660.25                   1755.52
Denmark                                                                   1653.66                   1660.25

12 rows selected.

SQL> SELECT player_name,
  2  club_id,
  3  player_ovr,
  4  player_trait,
  5  LAG(player_trait, 1, NULL)
  6  OVER(
  7  PARTITION BY club_id
  8  ORDER BY player_ovr DESC)
  9  AS next_player_trait
 10  FROM players;

PLAYER_NAME                                           CLUB_ID PLAYER_OVR PLAYER_TRAIT                                       NEXT_PLAYER_TRAIT
-------------------------------------------------- ---------- ---------- -------------------------------------------------- --------------------------------------------------
Lionel Messi                                                1         93 One Club Player
Neymar Jr                                                   1         91 Technical Dribbler                                 One Club Player
Kylian Mbappe                                               1         91 Speed Dribbler                                     Technical Dribbler
Cristian Pavon                                              2         78 Clinical Finisher
Alexandre Lacazette                                         3         85 Chip Shot
Rafa Silva                                                  4         82 Outside Foot Shot
Cameron Howieson                                            5         70 Tackler
Dominic Calvert-Lewin                                       6         81 Power Header
Mehdi Taremi                                                7         79 Strength
Vahid Amiri                                                 8         72 Set Play Specialist
Kevin De Bruyne                                            10         91 Playmaker
Ederson                                                    10         89 Comes for Crosses                                  Playmaker
Ruben Dias                                                 10         88 Tactician                                          Comes for Crosses
Cristiano Ronaldo                                          14         91 Long Shot Taker
Hector Moreno                                              15         77 Leadership
Simon Hedlund                                              16         78 Early Crosser
Agustin Martinez                                           17         77 Finesse Shot

17 rows selected.

SQL> SELECT player_name,
  2  national_team_id,
  3  player_ovr,
  4  player_speciality,
  5  LAG(player_speciality, 1, NULL)
  6  OVER(
  7  PARTITION BY national_team_id
  8  ORDER BY player_ovr DESC)
  9  AS next_player_speciality
 10  FROM players;

PLAYER_NAME                                        NATIONAL_TEAM_ID PLAYER_OVR PLAYER_SPECIALITY                        NEXT_PLAYER_SPECIALITY
-------------------------------------------------- ---------------- ---------- ---------------------------------------- ----------------------------------------
Neymar Jr                                                         1         91 Acrobat
Ederson                                                           1         89 Long Passer                              Acrobat
Kevin De Bruyne                                                   2         91 Engine
Hector Moreno                                                     3         77 Injury Prone
Mehdi Taremi                                                      4         79 Flair
Vahid Amiri                                                       4         72 Bicycle Kicks                            Flair
Cameron Howieson                                                  5         70 Team Player
Kylian Mbappe                                                     7         91 Speedster
Alexandre Lacazette                                               7         85 Solid Player                             Speedster
Dominic Calvert-Lewin                                             8         81 Poacher
Lionel Messi                                                      9         93 Free Kick Specialist
Cristian Pavon                                                    9         78 Crosser                                  Free Kick Specialist
Cristiano Ronaldo                                                10         91 Aerial Threat
Ruben Dias                                                       10         88 Power Header                             Aerial Threat
Rafa Silva                                                       10         82 Speed Dribbler                           Power Header
Agustin Martinez                                                 11         77 Second Wind
Simon Hedlund                                                    12         78 Swerve Pass

17 rows selected.

SQL> SELECT national_team_name,
  2  national_team_association,
  3  SUM(national_team_points)
  4  OVER(
  5  PARTITION BY national_team_association
  6  ORDER BY national_team_points
  7  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  8  AS national_team_association_points
  9  FROM national_teams;

NATIONAL_TEAM_NAME                                           NATIONAL_TEAM_ASSOCIATION NATIONAL_TEAM_ASSOCIATION_POINTS
------------------------------------------------------------ ------------------------- --------------------------------
IR Iran                                                      AFC                                                1572.89
Senegal                                                      CAF                                                1587.78
Mexico                                                       CONCACAF                                           1647.91
Uruguay                                                      CONMEBOL                                           1635.73
Argentina                                                    CONMEBOL                                           3402.72
Brazil                                                       CONMEBOL                                           5226.14
New Zealand                                                  OFC                                                1161.66
Denmark                                                      UEFA                                               1653.66
Portugal                                                     UEFA                                               3313.91
England                                                      UEFA                                               5069.43
France                                                       UEFA                                               6855.58
Belgium                                                      UEFA                                               8684.03

12 rows selected.

SQL> SELECT national_team_association,
  2  MAX(national_team_association_points)
  3  AS max_national_team_association_points
  4  FROM (
  5  SELECT national_team_name,
  6  national_team_association,
  7  SUM(national_team_points)
  8  OVER(
  9  PARTITION BY national_team_association
 10  ORDER BY national_team_points
 11  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
 12  AS national_team_association_points
 13  FROM national_teams)
 14  GROUP BY national_team_association;

NATIONAL_TEAM_ASSOCIATION MAX_NATIONAL_TEAM_ASSOCIATION_POINTS
------------------------- ------------------------------------
AFC                                                    1572.89
CAF                                                    1587.78
CONCACAF                                               1647.91
CONMEBOL                                               5226.14
OFC                                                    1161.66
UEFA                                                   8684.03

6 rows selected.

SQL> SELECT player_name,
  2  club_id,
  3  TRUNC(AVG(player_ovr))
  4  OVER(
  5  PARTITION BY club_id
  6  ORDER BY player_ovr
  7  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  8  AS avg_player_club_ovr
  9  FROM players
 10  ORDER BY club_id;

PLAYER_NAME                                           CLUB_ID AVG_PLAYER_CLUB_OVR
-------------------------------------------------- ---------- -------------------
Neymar Jr                                                   1                  91
Kylian Mbappe                                               1                  91
Lionel Messi                                                1                  92
Cristian Pavon                                              2                  78
Alexandre Lacazette                                         3                  85
Rafa Silva                                                  4                  82
Cameron Howieson                                            5                  70
Dominic Calvert-Lewin                                       6                  81
Mehdi Taremi                                                7                  79
Vahid Amiri                                                 8                  72
Ruben Dias                                                 10                  88
Ederson                                                    10                  89
Kevin De Bruyne                                            10                  90
Cristiano Ronaldo                                          14                  91
Hector Moreno                                              15                  77
Simon Hedlund                                              16                  78
Agustin Martinez                                           17                  77

17 rows selected.

SQL> SELECT national_team_id,
  2  TRUNC(AVG(player_national_team_ovr))
  3  AS avg_player_national_team_ovr
  4  FROM (
  5  SELECT player_name,
  6  national_team_id,
  7  AVG(player_ovr)
  8  OVER(
  9  PARTITION BY national_team_id
 10  ORDER BY player_ovr
 11  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
 12  AS player_national_team_ovr
 13  FROM players)
 14  GROUP BY national_team_id;

NATIONAL_TEAM_ID AVG_PLAYER_NATIONAL_TEAM_OVR
---------------- ----------------------------
               1                           90
               2                           91
               3                           77
               4                           74
               5                           70
               7                           87
               8                           81
               9                           82
              10                           85
              11                           77
              12                           78

11 rows selected.

SQL> SELECT 3 FROM dual
  2  INTERSECT
  3  SELECT 3f FROM dual;

         3
----------
  3.0E+000

SQL> SELECT national_team_id,
  2  national_team_name,
  3  CAST('' AS NVARCHAR2(50)) AS league_name
  4  FROM national_teams
  5  UNION
  6  SELECT national_team_id,
  7  CAST('' AS NVARCHAR2(60)) AS national_team_name,
  8  league_name
  9  FROM leagues;

NATIONAL_TEAM_ID NATIONAL_TEAM_NAME                                           LEAGUE_NAME
---------------- ------------------------------------------------------------ --------------------------------------------------
               1 Brazil
               1                                                              Serie A
               2 Belgium
               2                                                              Pro League
               3 Mexico
               3                                                              Liga MX
               4 IR Iran
               4                                                              Persian Gulf Pro League
               5 New Zealand
               5                                                              National League
               6 Senegal
               6                                                              Ligue 1 Douanes
               7 France
               7                                                              Ligue 1 Conforama
               8 England
               8                                                              Premier League
               9 Argentina
               9                                                              Primera Division
              10 Portugal
              10                                                              Liga NOS
              11 Uruguay
              11                                                              Liga Profesional
              12 Denmark
              12                                                              Superliga

24 rows selected.

SQL> SELECT national_team_id,
  2  national_team_name,
  3  CAST('' AS NVARCHAR2(50)) AS player_name
  4  FROM national_teams
  5  UNION
  6  SELECT national_team_id,
  7  CAST('' AS NVARCHAR2(60)) AS national_team_name,
  8  player_name
  9  FROM players;

NATIONAL_TEAM_ID NATIONAL_TEAM_NAME                                           PLAYER_NAME
---------------- ------------------------------------------------------------ --------------------------------------------------
               1 Brazil
               1                                                              Neymar Jr
               1                                                              Ederson
               2 Belgium
               2                                                              Kevin De Bruyne
               3 Mexico
               3                                                              Hector Moreno
               4 IR Iran
               4                                                              Mehdi Taremi
               4                                                              Vahid Amiri
               5 New Zealand
               5                                                              Cameron Howieson
               6 Senegal
               7 France
               7                                                              Kylian Mbappe
               7                                                              Alexandre Lacazette
               8 England
               8                                                              Dominic Calvert-Lewin
               9 Argentina
               9                                                              Lionel Messi
               9                                                              Cristian Pavon
              10 Portugal
              10                                                              Cristiano Ronaldo
              10                                                              Ruben Dias
              10                                                              Rafa Silva
              11 Uruguay
              11                                                              Agustin Martinez
              12 Denmark
              12                                                              Simon Hedlund

29 rows selected.

SQL> SELECT national_team_id,
  2  national_team_name,
  3  CAST('' AS NVARCHAR2(50)) AS sponsor_name
  4  FROM national_teams
  5  UNION
  6  SELECT national_team_id,
  7  CAST('' AS NVARCHAR2(60)) AS national_team_name,
  8  sponsor_name
  9  FROM sponsors;

NATIONAL_TEAM_ID NATIONAL_TEAM_NAME                                           SPONSOR_NAME
---------------- ------------------------------------------------------------ --------------------------------------------------
               1 Brazil
               1                                                              Puma
               2 Belgium
               2                                                              Red Bull
               3 Mexico
               4 IR Iran
               5 New Zealand
               6 Senegal
               7 France
               7                                                              Nike
               8 England
               8                                                              Adidas
               9 Argentina
               9                                                              Spotify
              10 Portugal
              11 Uruguay
              11                                                              Nissan
              12 Denmark
              12                                                              Bet25

19 rows selected.

SQL> SELECT league_id,
  2  league_name,
  3  CAST('' AS NVARCHAR2(50)) AS club_name
  4  FROM leagues
  5  UNION
  6  SELECT league_id,
  7  CAST('' AS NVARCHAR2(50)) AS league_name,
  8  club_name
  9  FROM clubs;

 LEAGUE_ID LEAGUE_NAME                                        CLUB_NAME
---------- -------------------------------------------------- --------------------------------------------------
         1 Premier League
         1                                                    Arsenal
         1                                                    Everton
         1                                                    Manchester City
         1                                                    Manchester United
         2 Ligue 1 Conforama
         2                                                    Paris Saint-Germain
         3 Liga NOS
         3                                                    FC Porto
         3                                                    SL Benfica
         4 Pro League
         4                                                    Club Brugge
         5 Serie A
         5                                                    Atletico Mineiro
         6 Primera Division
         6                                                    Boca Juniors
         6                                                    River Plate
         7 Liga MX
         7                                                    Monterrey FC
         7                                                    Tigres UANL
         8 Ligue 1 Douanes
         9 Persian Gulf Pro League
         9                                                    Persepolis
        10 National League
        10                                                    Auckland City FC
        11 Superliga
        11                                                    Brondby IF
        12 Liga Profesional
        12                                                    Atletico Penarol

29 rows selected.

SQL> SELECT club_id,
  2  club_name,
  3  CAST('' AS NVARCHAR2(50)) AS player_name
  4  FROM clubs
  5  UNION ALL
  6  SELECT club_id,
  7  CAST('' AS NVARCHAR2(50)) AS club_name,
  8  player_name
  9  FROM players
 10  ORDER BY club_id;

   CLUB_ID CLUB_NAME                                          PLAYER_NAME
---------- -------------------------------------------------- --------------------------------------------------
         1 Paris Saint-Germain
         1                                                    Lionel Messi
         1                                                    Neymar Jr
         1                                                    Kylian Mbappe
         2 Boca Juniors
         2                                                    Cristian Pavon
         3 Arsenal
         3                                                    Alexandre Lacazette
         4 SL Benfica
         4                                                    Rafa Silva
         5 Auckland City FC
         5                                                    Cameron Howieson
         6 Everton
         6                                                    Dominic Calvert-Lewin
         7 FC Porto
         7                                                    Mehdi Taremi
         8 Persepolis
         8                                                    Vahid Amiri
         9 Tigres UANL
        10 Manchester City
        10                                                    Kevin De Bruyne
        10                                                    Ederson
        10                                                    Ruben Dias
        11 Atletico Mineiro
        12 River Plate
        13 Club Brugge
        14 Manchester United
        14                                                    Cristiano Ronaldo
        15 Monterrey FC
        15                                                    Hector Moreno
        16 Brondby IF
        16                                                    Simon Hedlund
        17 Atletico Penarol
        17                                                    Agustin Martinez

34 rows selected.

SQL> SELECT club_id,
  2  club_name,
  3  CAST('' AS NVARCHAR2(50)) AS sponsor_name
  4  FROM clubs
  5  UNION ALL
  6  SELECT club_id,
  7  CAST('' AS NVARCHAR2(50)) AS club_name,
  8  sponsor_name
  9  FROM sponsors
 10  ORDER BY club_id;

   CLUB_ID CLUB_NAME                                          SPONSOR_NAME
---------- -------------------------------------------------- --------------------------------------------------
         1 Paris Saint-Germain
         2 Boca Juniors
         3 Arsenal
         3                                                    Nike
         4 SL Benfica
         5 Auckland City FC
         5                                                    Puma
         6 Everton
         7 FC Porto
         7                                                    Adidas
         8 Persepolis
         9 Tigres UANL
         9                                                    Red Bull
        10 Manchester City
        11 Atletico Mineiro
        12 River Plate
        12                                                    Spotify
        13 Club Brugge
        14 Manchester United
        15 Monterrey FC
        16 Brondby IF
        16                                                    Bet25
        17 Atletico Penarol
        17                                                    Nissan

24 rows selected.

SQL> SELECT player_id,
  2  player_name,
  3  CAST('' AS NVARCHAR2(50)) AS sponsor_name
  4  FROM players
  5  UNION ALL
  6  SELECT player_id,
  7  CAST('' AS NVARCHAR2(50)) AS player_name,
  8  sponsor_name
  9  FROM sponsors
 10  ORDER BY player_id;

 PLAYER_ID PLAYER_NAME                                        SPONSOR_NAME
---------- -------------------------------------------------- --------------------------------------------------
         1 Alexandre Lacazette
         2 Dominic Calvert-Lewin
         3 Cristian Pavon
         4 Kylian Mbappe
         5 Mehdi Taremi
         5                                                    Red Bull
         6 Kevin De Bruyne
         6                                                    Adidas
         7 Rafa Silva
         7                                                    Spotify
         8 Cameron Howieson
         9 Cristiano Ronaldo
         9                                                    Nike
        10 Lionel Messi
        11 Hector Moreno
        12 Ruben Dias
        13 Vahid Amiri
        14 Neymar Jr
        14                                                    Puma
        15 Ederson
        16 Agustin Martinez
        16                                                    Nissan
        17 Simon Hedlund
        17                                                    Bet25

24 rows selected.

SQL> SELECT national_team_id,
  2  national_team_name,
  3  CAST('' AS NVARCHAR2(50)) AS league_name
  4  FROM national_teams
  5  INTERSECT
  6  SELECT national_team_id,
  7  CAST('' AS NVARCHAR2(60)) AS national_team_name,
  8  league_name
  9  FROM leagues;

no rows selected

SQL> SELECT national_team_id,
  2  national_team_name,
  3  CAST('' AS NVARCHAR2(50)) AS league_name
  4  FROM national_teams
  5  MINUS
  6  SELECT national_team_id,
  7  CAST('' AS NVARCHAR2(60)) AS national_team_name,
  8  league_name
  9  FROM leagues;

NATIONAL_TEAM_ID NATIONAL_TEAM_NAME                                           LEAGUE_NAME
---------------- ------------------------------------------------------------ --------------------------------------------------
               1 Brazil
               2 Belgium
               3 Mexico
               4 IR Iran
               5 New Zealand
               6 Senegal
               7 France
               8 England
               9 Argentina
              10 Portugal
              11 Uruguay
              12 Denmark

12 rows selected.

SQL> SELECT national_team_id,
  2  CAST('' AS NVARCHAR2(60)) AS national_team_name,
  3  league_name
  4  FROM leagues
  5  MINUS
  6  SELECT national_team_id,
  7  national_team_name,
  8  CAST('' AS NVARCHAR2(50)) AS league_name
  9  FROM national_teams;

NATIONAL_TEAM_ID NATIONAL_TEAM_NAME                                           LEAGUE_NAME
---------------- ------------------------------------------------------------ --------------------------------------------------
               1                                                              Serie A
               2                                                              Pro League
               3                                                              Liga MX
               4                                                              Persian Gulf Pro League
               5                                                              National League
               6                                                              Ligue 1 Douanes
               7                                                              Ligue 1 Conforama
               8                                                              Premier League
               9                                                              Primera Division
              10                                                              Liga NOS
              11                                                              Liga Profesional
              12                                                              Superliga

12 rows selected.

SQL> SELECT national_teams.national_team_id,
  2  national_teams.national_team_name,
  3  sponsors.sponsor_name
  4  FROM national_teams
  5  LEFT OUTER JOIN sponsors
  6  ON national_teams.national_team_id = sponsors.national_team_id;

NATIONAL_TEAM_ID NATIONAL_TEAM_NAME                                           SPONSOR_NAME
---------------- ------------------------------------------------------------ --------------------------------------------------
               1 Brazil                                                       Puma
               2 Belgium                                                      Red Bull
               3 Mexico
               4 IR Iran
               5 New Zealand
               6 Senegal
               7 France                                                       Nike
               8 England                                                      Adidas
               9 Argentina                                                    Spotify
              10 Portugal
              11 Uruguay                                                      Nissan
              12 Denmark                                                      Bet25

12 rows selected.

SQL> SELECT players.club_id,
  2  players.player_name,
  3  clubs.club_name
  4  FROM clubs
  5  RIGHT OUTER JOIN players
  6  ON clubs.club_id = players.club_id;

   CLUB_ID PLAYER_NAME                                        CLUB_NAME
---------- -------------------------------------------------- --------------------------------------------------
         1 Lionel Messi                                       Paris Saint-Germain
         1 Kylian Mbappe                                      Paris Saint-Germain
         1 Neymar Jr                                          Paris Saint-Germain
         2 Cristian Pavon                                     Boca Juniors
         3 Alexandre Lacazette                                Arsenal
         4 Rafa Silva                                         SL Benfica
         5 Cameron Howieson                                   Auckland City FC
         6 Dominic Calvert-Lewin                              Everton
         7 Mehdi Taremi                                       FC Porto
         8 Vahid Amiri                                        Persepolis
        10 Kevin De Bruyne                                    Manchester City
        10 Ederson                                            Manchester City
        10 Ruben Dias                                         Manchester City
        14 Cristiano Ronaldo                                  Manchester United
        15 Hector Moreno                                      Monterrey FC
        16 Simon Hedlund                                      Brondby IF
        17 Agustin Martinez                                   Atletico Penarol

17 rows selected.

SQL> SELECT
  2  national_teams.national_team_name,
  3  leagues.league_name,
  4  clubs.club_name,
  5  players.player_name,
  6  players.player_ovr
  7  FROM
  8  national_teams,
  9  leagues,
 10  clubs,
 11  players
 12  WHERE
 13  national_teams.national_team_id = leagues.national_team_id
 14  AND
 15  leagues.league_id = clubs.league_id
 16  AND
 17  clubs.club_id = players.club_id
 18  ORDER BY players.player_ovr DESC;

NATIONAL_TEAM_NAME                                           LEAGUE_NAME                                        CLUB_NAME                                          PLAYER_NAME                                        PLAYER_OVR
------------------------------------------------------------ -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- ----------
France                                                       Ligue 1 Conforama                                  Paris Saint-Germain                                Lionel Messi                                               93
France                                                       Ligue 1 Conforama                                  Paris Saint-Germain                                Neymar Jr                                                  91
France                                                       Ligue 1 Conforama                                  Paris Saint-Germain                                Kylian Mbappe                                              91
England                                                      Premier League                                     Manchester United                                  Cristiano Ronaldo                                          91
England                                                      Premier League                                     Manchester City                                    Kevin De Bruyne                                            91
England                                                      Premier League                                     Manchester City                                    Ederson                                                    89
England                                                      Premier League                                     Manchester City                                    Ruben Dias                                                 88
England                                                      Premier League                                     Arsenal                                            Alexandre Lacazette                                        85
Portugal                                                     Liga NOS                                           SL Benfica                                         Rafa Silva                                                 82
England                                                      Premier League                                     Everton                                            Dominic Calvert-Lewin                                      81
Portugal                                                     Liga NOS                                           FC Porto                                           Mehdi Taremi                                               79
Argentina                                                    Primera Division                                   Boca Juniors                                       Cristian Pavon                                             78
Denmark                                                      Superliga                                          Brondby IF                                         Simon Hedlund                                              78
Mexico                                                       Liga MX                                            Monterrey FC                                       Hector Moreno                                              77
Uruguay                                                      Liga Profesional                                   Atletico Penarol                                   Agustin Martinez                                           77
IR Iran                                                      Persian Gulf Pro League                            Persepolis                                         Vahid Amiri                                                72
New Zealand                                                  National League                                    Auckland City FC                                   Cameron Howieson                                           70

17 rows selected.

SQL> WITH
  2  summary AS (
  3  SELECT national_teams.national_team_name, leagues.league_name, clubs.club_name, players.player_name, players.player_ovr
  4  FROM national_teams, leagues, clubs, players
  5  WHERE national_teams.national_team_id = leagues.national_team_id AND leagues.league_id = clubs.league_id AND clubs.club_id = players.club_id
  6  ORDER BY players.player_ovr DESC),
  7  helper AS (
  8  SELECT DISTINCT NULL leaf, NULL child, NULL parent, national_team_name root FROM summary WHERE national_team_name = 'Belgium'
  9  UNION ALL
 10  SELECT DISTINCT NULL leaf, NULL child, national_team_name parent, league_name root FROM summary
 11  UNION ALL
 12  SELECT DISTINCT NULL leaf, national_team_name child, league_name parent, club_name root FROM summary
 13  UNION ALL
 14  SELECT DISTINCT national_team_name leaf, league_name child, club_name parent, player_name root FROM summary),
 15  cte AS (
 16  SELECT leaf, child, parent, root,
 17  RPAD('  ', (LEVEL - 1) * 2, '  ') || root AS tree,
 18  LEVEL,
 19  CONNECT_BY_ROOT root,
 20  LTRIM(SYS_CONNECT_BY_PATH(root, ' | '), ' | ') AS path
 21  FROM helper
 22  CONNECT BY PRIOR root = parent)
 23  SELECT * FROM cte;

LEAF                                                         CHILD                                                        PARENT                                                       ROOT                                                         TREE                                                                                  LEVEL ROOT                                                         PATH                                                                            
------------------------------------------------------------ ------------------------------------------------------------ ------------------------------------------------------------ ------------------------------------------------------------ -------------------------------------------------------------------------------- ---------- ------------------------------------------------------------ --------------------------------------------------------------------------------
                                                                                                                                                                                       Belgium                                                      Belgium                                                                                   1 Belgium                                                      Belgium                                                                         
                                                                                                                          Belgium                                                      Pro League                                                     Pro League                                                                              2 Belgium                                                      Belgium | Pro League
                                                             Belgium                                                      Pro League                                                   Club Brugge                                                      Club Brugge                                                                           3 Belgium                                                      Belgium | Pro League | Club Brugge
                                                                                                                                                                                       Brazil                                                       Brazil                                                                                    1 Brazil                                                       Brazil | Serie A
                                                                                                                          Brazil                                                       Serie A                                                        Serie A                                                                                 2 Brazil                                                       Brazil | Serie A
                                                             Brazil                                                       Serie A                                                      Atletico Mineiro                                                 Atletico Mineiro                                                                      3 Brazil                                                       Brazil | Serie A | Atletico Mineiro
                                                                                                                                                                                       France                                                       France                                                                                    1 France                                                       France
                                                                                                                          France                                                       Ligue 1 Conforama                                              Ligue 1 Conforama                                                                       2 France                                                       France | Ligue 1 Conforama
                                                             France                                                       Ligue 1 Conforama                                            Paris Saint-Germain                                              Paris Saint-Germain                                                                   3 France                                                       France | Ligue 1 Conforama | Paris Saint-Germain
France                                                       Ligue 1 Conforama                                            Paris Saint-Germain                                          Lionel Messi                                                       Lionel Messi                                                                        4 France                                                       France | Ligue 1 Conforama | Paris Saint-Germain | Lionel Messi
France                                                       Ligue 1 Conforama                                            Paris Saint-Germain                                          Neymar Jr                                                          Neymar Jr                                                                           4 France                                                       France | Ligue 1 Conforama | Paris Saint-Germain | Neymar Jr
France                                                       Ligue 1 Conforama                                            Paris Saint-Germain                                          Kylian Mbappe                                                      Kylian Mbappe                                                                       4 France                                                       France | Ligue 1 Conforama | Paris Saint-Germain | Kylian Mbappe
                                                                                                                                                                                       Argentina                                                    Argentina                                                                                 1 Argentina                                                    Argentina
                                                                                                                          Argentina                                                    Primera Division                                               Primera Division                                                                        2 Argentina                                                    Argentina | Primera Division
                                                             Argentina                                                    Primera Division                                             Boca Juniors                                                     Boca Juniors                                                                          3 Argentina                                                    Argentina | Primera Division | Boca Juniors
Argentina                                                    Primera Division                                             Boca Juniors                                                 Cristian Pavon                                                     Cristian Pavon                                                                      4 Argentina                                                    Argentina | Primera Division | Boca Juniors | Cristian Pavon
                                                             Argentina                                                    Primera Division                                             River Plate                                                      River Plate                                                                           3 Argentina                                                    Argentina | Primera Division | River Plate
                                                                                                                                                                                       England                                                      England                                                                                   1 England                                                      England
                                                                                                                          England                                                      Premier League                                                 Premier League                                                                          2 England                                                      England | Premier League
                                                             England                                                      Premier League                                               Arsenal                                                          Arsenal                                                                               3 England                                                      England | Premier League | Arsenal
England                                                      Premier League                                               Arsenal                                                      Alexandre Lacazette                                                Alexandre Lacazette                                                                 4 England                                                      England | Premier League | Arsenal | Alexandre Lacazette
                                                             England                                                      Premier League                                               Everton                                                          Everton                                                                               3 England                                                      England | Premier League | Everton
England                                                      Premier League                                               Everton                                                      Dominic Calvert-Lewin                                              Dominic Calvert-Lewin                                                               4 England                                                      England | Premier League | Everton | Dominic Calvert-Lewin
                                                             England                                                      Premier League                                               Manchester City                                                  Manchester City                                                                       3 England                                                      England | Premier League | Manchester City
England                                                      Premier League                                               Manchester City                                              Kevin De Bruyne                                                    Kevin De Bruyne                                                                     4 England                                                      England | Premier League | Manchester City | Kevin De Bruyne
England                                                      Premier League                                               Manchester City                                              Ederson                                                            Ederson                                                                             4 England                                                      England | Premier League | Manchester City | Ederson
England                                                      Premier League                                               Manchester City                                              Ruben Dias                                                         Ruben Dias                                                                          4 England                                                      England | Premier League | Manchester City | Ruben Dias
                                                             England                                                      Premier League                                               Manchester United                                                Manchester United                                                                     3 England                                                      England | Premier League | Manchester United
England                                                      Premier League                                               Manchester United                                            Cristiano Ronaldo                                                  Cristiano Ronaldo                                                                   4 England                                                      England | Premier League | Manchester United | Cristiano Ronaldo
                                                                                                                                                                                       Portugal                                                     Portugal                                                                                  1 Portugal                                                     Portugal
                                                                                                                          Portugal                                                     Liga NOS                                                       Liga NOS                                                                                2 Portugal                                                     Portugal | Liga NOS
                                                             Portugal                                                     Liga NOS                                                     FC Porto                                                         FC Porto                                                                              3 Portugal                                                     Portugal | Liga NOS | FC Porto
Portugal                                                     Liga NOS                                                     FC Porto                                                     Mehdi Taremi                                                       Mehdi Taremi                                                                        4 Portugal                                                     Portugal | Liga NOS | FC Porto | Mehdi Taremi
                                                             Portugal                                                     Liga NOS                                                     SL Benfica                                                       SL Benfica                                                                            3 Portugal                                                     Portugal | Liga NOS | SL Benfica
Portugal                                                     Liga NOS                                                     SL Benfica                                                   Rafa Silva                                                         Rafa Silva                                                                          4 Portugal                                                     Portugal | Liga NOS | SL Benfica | Rafa Silva
                                                                                                                                                                                       Denmark                                                      Denmark                                                                                   1 Denmark                                                      Denmark
                                                                                                                          Denmark                                                      Superliga                                                      Superliga                                                                               2 Denmark                                                      Denmark | Superliga
                                                             Denmark                                                      Superliga                                                    Brondby IF                                                       Brondby IF                                                                            3 Denmark                                                      Denmark | Superliga | Brondby IF
Denmark                                                      Superliga                                                    Brondby IF                                                   Simon Hedlund                                                      Simon Hedlund                                                                       4 Denmark                                                      Denmark | Superliga | Brondby IF | Simon Hedlund
                                                                                                                                                                                       Mexico                                                       Mexico                                                                                    1 Mexico                                                       Mexico
                                                                                                                          Mexico                                                       Liga MX                                                        Liga MX                                                                                 2 Mexico                                                       Mexico | Liga MX
                                                             Mexico                                                       Liga MX                                                      Monterrey FC                                                     Monterrey FC                                                                          3 Mexico                                                       Mexico | Liga MX | Monterrey FC
Mexico                                                       Liga MX                                                      Monterrey FC                                                 Hector Moreno                                                      Hector Moreno                                                                       4 Mexico                                                       Mexico | Liga MX | Monterrey FC | Hector Moreno
                                                             Mexico                                                       Liga MX                                                      Tigres UANL                                                      Tigres UANL                                                                           3 Mexico                                                       Mexico | Liga MX | Tigres UANL
                                                                                                                                                                                       Uruguay                                                      Uruguay                                                                                   1 Uruguay                                                      Uruguay
                                                                                                                          Uruguay                                                      Liga Profesional                                               Liga Profesional                                                                        2 Uruguay                                                      Uruguay | Liga Profesional
                                                             Uruguay                                                      Liga Profesional                                             Atletico Penarol                                                 Atletico Penarol                                                                      3 Uruguay                                                      Uruguay | Liga Profesional | Atletico Penarol
Uruguay                                                      Liga Profesional                                             Atletico Penarol                                             Agustin Martinez                                                   Agustin Martinez                                                                    4 Uruguay                                                      Uruguay | Liga Profesional | Atletico Penarol | Agustin Martinez
                                                                                                                                                                                       Senegal                                                      Senegal                                                                                   1 Senegal                                                      Senegal
                                                                                                                          Senegal                                                      Ligue 1 Douanes                                                Ligue 1 Douanes                                                                         2 Senegal                                                      Senegal | Ligue 1 Douanes
                                                                                                                                                                                       IR Iran                                                      IR Iran                                                                                   1 IR Iran                                                      IR Iran
                                                                                                                          IR Iran                                                      Persian Gulf Pro League                                        Persian Gulf Pro League                                                                 2 IR Iran                                                      IR Iran | Persian Gulf Pro League
                                                             IR Iran                                                      Persian Gulf Pro League                                      Persepolis                                                       Persepolis                                                                            3 IR Iran                                                      IR Iran | Persian Gulf Pro League | Persepolis
IR Iran                                                      Persian Gulf Pro League                                      Persepolis                                                   Vahid Amiri                                                        Vahid Amiri                                                                         4 IR Iran                                                      IR Iran | Persian Gulf Pro League | Persepolis | Vahid Amiri
                                                                                                                                                                                       New Zealand                                                  New Zealand                                                                               1 New Zealand                                                  New Zealand
                                                                                                                          New Zealand                                                  National League                                                National League                                                                         2 New Zealand                                                  New Zealand | National League
                                                             New Zealand                                                  National League                                              Auckland City FC                                                 Auckland City FC                                                                      3 New Zealand                                                  New Zealand | National League | Auckland City FC
New Zealand                                                  National League                                              Auckland City FC                                             Cameron Howieson                                                   Cameron Howieson                                                                    4 New Zealand                                                  New Zealand | National League | Auckland City FC | Cameron Howieson

58 rows selected.

SQL> EXIT
Disconnected from Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0
```