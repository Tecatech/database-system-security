```sql
PS C:\Users\Admin> sqlplus system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1"

SQL*Plus: Release 18.0.0.0.0 - Production on Mon Dec 19 01:05:11 2022
Version 18.4.0.0.0

Copyright (c) 1982, 2018, Oracle.  All rights reserved.

Last Successful login time: Fri Dec 16 2022 02:32:48 +03:00

Connected to:
Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0

SQL> SHOW con_name;

CON_NAME
------------------------------
XEPDB1
SQL> GRANT AUDIT_ADMIN TO system;

Grant succeeded.

SQL> GRANT AUDIT_VIEWER TO administrator;

Grant succeeded.

SQL> CREATE AUDIT POLICY admin_pol
  2      ACTIONS
  3          SELECT ON administrator.players,
  4          INSERT ON administrator.players,
  5          UPDATE ON administrator.players,
  6          DELETE ON administrator.players,
  7          ALL ON administrator.clubs
  8      ROLES
  9          CONNECT,
 10          DBA
 11      CONTAINER = CURRENT;

Audit policy created.

SQL> AUDIT POLICY admin_pol BY administrator;

Audit succeeded.

SQL> CREATE AUDIT POLICY table_pol
  2      PRIVILEGES
  3          CREATE ANY TABLE,
  4          DROP ANY TABLE
  5      ACTIONS
  6          SELECT ON administrator.players,
  7          INSERT ON administrator.players,
  8          UPDATE ON administrator.players,
  9          DELETE ON administrator.players,
 10          ALL ON administrator.clubs
 11      CONTAINER = CURRENT;

Audit policy created.

SQL> AUDIT POLICY table_pol BY USERS WITH GRANTED ROLE app_manager_role;

Audit succeeded.

SQL> CONNECT administrator/default@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> SELECT * FROM clubs;

   CLUB_ID  LEAGUE_ID CLUB_NAME                                          CLUB_STADIUM
---------- ---------- -------------------------------------------------- --------------------------------------------------
         1          1 Arsenal                                            Emirates Stadium
         2          1 Everton                                            Goodison Park
         3          1 Manchester United                                  Old Trafford
         4          1 Manchester City                                    Etihad Stadium
         5          2 Paris Saint-Germain                                Stade de France
         6          2 Olympique de Marseille                             Stade Velodrome
         7          3 SL Benfica                                         Estadio da Luz
         8          3 FC Porto                                           Estadio do Dragao
         9          4 Club Brugge KV                                     Jan Breydel Stadium
        10          5 Atletico Mineiro                                   Estadio Governador

10 rows selected.

SQL> INSERT ALL
  2      INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (11, 4, 'KAA Gent', 'Ghelamco Arena')
  3      INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (12, 5, 'Flamengo', 'Estadio do Maracana')
  4  SELECT * FROM dual;

2 rows created.

SQL> SELECT * FROM clubs;

   CLUB_ID  LEAGUE_ID CLUB_NAME                                          CLUB_STADIUM
---------- ---------- -------------------------------------------------- --------------------------------------------------
         1          1 Arsenal                                            Emirates Stadium
         2          1 Everton                                            Goodison Park
         3          1 Manchester United                                  Old Trafford
         4          1 Manchester City                                    Etihad Stadium
         5          2 Paris Saint-Germain                                Parc des Princes
         6          2 Olympique de Marseille                             Stade Velodrome
         7          3 SL Benfica                                         Estadio da Luz
         8          3 FC Porto                                           Estadio do Dragao
         9          4 Club Brugge KV                                     Jan Breydel Stadium
        10          5 Atletico Mineiro                                   Estadio Governador
        11          4 KAA Gent                                           Ghelamco Arena
        12          5 Flamengo                                           Estadio do Maracana

12 rows selected.

SQL> UPDATE clubs
  2      SET club_stadium = 'Parc des Princes'
  3      WHERE club_id = 5;

1 row updated.

SQL> SELECT * FROM clubs;

   CLUB_ID  LEAGUE_ID CLUB_NAME                                          CLUB_STADIUM
---------- ---------- -------------------------------------------------- --------------------------------------------------
         1          1 Arsenal                                            Emirates Stadium
         2          1 Everton                                            Goodison Park
         3          1 Manchester United                                  Old Trafford
         4          1 Manchester City                                    Etihad Stadium
         5          2 Paris Saint-Germain                                Parc des Princes
         6          2 Olympique de Marseille                             Stade Velodrome
         7          3 SL Benfica                                         Estadio da Luz
         8          3 FC Porto                                           Estadio do Dragao
         9          4 Club Brugge KV                                     Jan Breydel Stadium
        10          5 Atletico Mineiro                                   Estadio Governador

10 rows selected.

SQL> DELETE
  2      FROM clubs
  3      WHERE club_name = 'Atletico Mineiro';

1 row deleted.

SQL> SELECT * FROM clubs;

   CLUB_ID  LEAGUE_ID CLUB_NAME                                          CLUB_STADIUM
---------- ---------- -------------------------------------------------- --------------------------------------------------
         1          1 Arsenal                                            Emirates Stadium
         2          1 Everton                                            Goodison Park
         3          1 Manchester United                                  Old Trafford
         4          1 Manchester City                                    Etihad Stadium
         5          2 Paris Saint-Germain                                Parc des Princes
         6          2 Olympique de Marseille                             Stade Velodrome
         7          3 SL Benfica                                         Estadio da Luz
         8          3 FC Porto                                           Estadio do Dragao
         9          4 Club Brugge KV                                     Jan Breydel Stadium
        11          4 KAA Gent                                           Ghelamco Arena
        12          5 Flamengo                                           Estadio do Maracana

11 rows selected.

SQL> SELECT * FROM players;

 PLAYER_ID    CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
---------- ---------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
         1          5                4 Lionel Messi                                               93         34 One Club Player                                    Free Kick Specialist
         2          3                6 Cristiano Ronaldo                                          91         36 Long Shot Taker                                    Aerial Threat
         3          5                2 Neymar Jr                                                  91         30 Technical Dribbler                                 Acrobat
         4          5                3 Kylian Mbappe                                              91         23 Speed Dribbler                                     Speedster
         5          4                1 Kevin De Bruyne                                            90         30 Playmaker                                          Engine
         6          4                2 Ederson                                                    89         27 Comes for Crosses                                  Long Passer
         7          5                2 Marquinhos                                                 88         27 Leadership                                         Tackler
         8          4                6 Ruben Dias                                                 88         24 Power Header                                       Solid Player
         9          4                5 Raheem Sterling                                            87         26 Clinical Finisher                                  Team Player
        10          8                9 Mehdi Taremi                                               79         29 Strength                                           Flair

10 rows selected.

SQL> INSERT ALL
  2      INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (11, 1, 2, 'Gabriel Jesus', 84, 25, 'First Time Shot', 'Complete Forward')
  3      INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (12, 7, 4, 'Enzo Fernandez', 78, 21, 'Fancy Passes', 'Tactician')
  4  SELECT * FROM dual;

2 rows created.

SQL> SELECT * FROM players;

 PLAYER_ID    CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
---------- ---------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
         1          5                4 Lionel Messi                                               93         34 One Club Player                                    Free Kick Specialist
         2          3                6 Cristiano Ronaldo                                          91         36 Long Shot Taker                                    Aerial Threat
         3          5                2 Neymar Jr                                                  91         30 Technical Dribbler                                 Acrobat
         4          5                3 Kylian Mbappe                                              91         23 Speed Dribbler                                     Speedster
         5          4                1 Kevin De Bruyne                                            91         30 Playmaker                                          Engine
         6          4                2 Ederson                                                    89         27 Comes for Crosses                                  Long Passer
         7          5                2 Marquinhos                                                 88         27 Leadership                                         Tackler
         8          4                6 Ruben Dias                                                 88         24 Power Header                                       Solid Player
         9          4                5 Raheem Sterling                                            87         26 Clinical Finisher                                  Team Player
        10          8                9 Mehdi Taremi                                               79         29 Strength                                           Flair
        11          1                2 Gabriel Jesus                                              84         25 First Time Shot                                    Complete Forward
        12          7                4 Enzo Fernandez                                             78         21 Fancy Passes                                       Tactician

12 rows selected.

SQL> UPDATE players
  2      SET player_ovr = 91
  3      WHERE player_name = 'Kevin De Bruyne';

1 row updated.

SQL> SELECT * FROM players;

 PLAYER_ID    CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
---------- ---------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
         1          5                4 Lionel Messi                                               93         34 One Club Player                                    Free Kick Specialist
         2          3                6 Cristiano Ronaldo                                          91         36 Long Shot Taker                                    Aerial Threat
         3          5                2 Neymar Jr                                                  91         30 Technical Dribbler                                 Acrobat
         4          5                3 Kylian Mbappe                                              91         23 Speed Dribbler                                     Speedster
         5          4                1 Kevin De Bruyne                                            91         30 Playmaker                                          Engine
         6          4                2 Ederson                                                    89         27 Comes for Crosses                                  Long Passer
         7          5                2 Marquinhos                                                 88         27 Leadership                                         Tackler
         8          4                6 Ruben Dias                                                 88         24 Power Header                                       Solid Player
         9          4                5 Raheem Sterling                                            87         26 Clinical Finisher                                  Team Player
        10          8                9 Mehdi Taremi                                               79         29 Strength                                           Flair

10 rows selected.

SQL> DELETE
  2      FROM players
  3      WHERE player_name = 'Mehdi Taremi';

1 row deleted.

SQL> SELECT * FROM players;

 PLAYER_ID    CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
---------- ---------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
         1          5                4 Lionel Messi                                               93         34 One Club Player                                    Free Kick Specialist
         2          3                6 Cristiano Ronaldo                                          91         36 Long Shot Taker                                    Aerial Threat
         3          5                2 Neymar Jr                                                  91         30 Technical Dribbler                                 Acrobat
         4          5                3 Kylian Mbappe                                              91         23 Speed Dribbler                                     Speedster
         5          4                1 Kevin De Bruyne                                            91         30 Playmaker                                          Engine
         6          4                2 Ederson                                                    89         27 Comes for Crosses                                  Long Passer
         7          5                2 Marquinhos                                                 88         27 Leadership                                         Tackler
         8          4                6 Ruben Dias                                                 88         24 Power Header                                       Solid Player
         9          4                5 Raheem Sterling                                            87         26 Clinical Finisher                                  Team Player
        11          1                2 Gabriel Jesus                                              84         25 First Time Shot                                    Complete Forward
        12          7                4 Enzo Fernandez                                             78         21 Fancy Passes                                       Tactician

11 rows selected.

SQL> GRANT AUDIT_VIEWER TO manager;

Grant succeeded.

SQL> CREATE TABLE timestamps(
  2      timestamp_id NUMBER(4, 0) NOT NULL,
  3      day NUMBER(2, 0),
  4      month NUMBER(2, 0),
  5      year NUMBER(4, 0),
  6      PRIMARY KEY (timestamp_id)
  7  );

Table created.

SQL> CONNECT system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> SELECT
  2      dbusername,
  3      event_timestamp,
  4      action_name,
  5      object_name,
  6      sql_text,
  7      unified_audit_policies
  8  FROM unified_audit_trail
  9  WHERE dbusername = 'ADMINISTRATOR'
 10  ORDER BY event_timestamp;

DBUSERNAME                                                                                                                       EVENT_TIMESTAMP                                                             ACTION_NAME                                                      OBJECT_NAME                                                                                                                      SQL_TEXT                                                                                                                                                                             UNIFIED_AUDIT_POLICIES
-------------------------------------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------- ---------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ADMINISTRATOR                                                                                                                    19-DEC-22 02.50.30.163000 AM                                                LOGON                                                                                                                                                                                                                                                                                                                                                                                  ORA_LOGON_FAILURES, ADMIN_POL
ADMINISTRATOR                                                                                                                    19-DEC-22 02.51.16.410000 AM                                                SELECT                                                           CLUBS                                                                                                                            SELECT * FROM clubs                                                                                                                                                                  ADMIN_POL
ADMINISTRATOR                                                                                                                    19-DEC-22 02.53.13.733000 AM                                                INSERT                                                           CLUBS                                                                                                                            INSERT ALL    INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (11, 4, 'KAA Gent', 'Ghelamco Arena')                                                                   ADMIN_POL
ADMINISTRATOR                                                                                                                    19-DEC-22 02.54.22.531000 AM                                                SELECT                                                           CLUBS                                                                                                                            SELECT * FROM clubs                                                                                                                                                                  ADMIN_POL
ADMINISTRATOR                                                                                                                    19-DEC-22 02.55.35.962000 AM                                                UPDATE                                                           CLUBS                                                                                                                            UPDATE clubs    SET club_stadium = 'Parc des Princes'    WHERE club_id = 5                                                                                                           ADMIN_POL
ADMINISTRATOR                                                                                                                    19-DEC-22 02.56.24.039000 AM                                                SELECT                                                           CLUBS                                                                                                                            SELECT * FROM clubs                                                                                                                                                                  ADMIN_POL
ADMINISTRATOR                                                                                                                    19-DEC-22 02.57.49.878000 AM                                                DELETE                                                           CLUBS                                                                                                                            DELETE    FROM clubs    WHERE club_name = 'Atletico Mineiro'                                                                                                                         ADMIN_POL
ADMINISTRATOR                                                                                                                    19-DEC-22 02.58.39.041000 AM                                                SELECT                                                           CLUBS                                                                                                                            SELECT * FROM clubs                                                                                                                                                                  ADMIN_POL
ADMINISTRATOR                                                                                                                    19-DEC-22 02.58.50.916000 AM                                                SELECT                                                           PLAYERS                                                                                                                          SELECT * FROM players                                                                                                                                                                ADMIN_POL
ADMINISTRATOR                                                                                                                    19-DEC-22 02.59.33.486000 AM                                                INSERT                                                           PLAYERS                                                                                                                          INSERT ALL    INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality)                                               ADMIN_POL
ADMINISTRATOR                                                                                                                    19-DEC-22 03.00.44.355000 AM                                                SELECT                                                           PLAYERS                                                                                                                          SELECT * FROM players                                                                                                                                                                ADMIN_POL
ADMINISTRATOR                                                                                                                    19-DEC-22 03.01.48.876000 AM                                                UPDATE                                                           PLAYERS                                                                                                                          UPDATE players    SET player_ovr = 91    WHERE player_name = 'Kevin De Bruyne'                                                                                                       ADMIN_POL
ADMINISTRATOR                                                                                                                    19-DEC-22 03.02.17.934000 AM                                                SELECT                                                           PLAYERS                                                                                                                          SELECT * FROM players                                                                                                                                                                ADMIN_POL
ADMINISTRATOR                                                                                                                    19-DEC-22 03.02.56.323000 AM                                                DELETE                                                           PLAYERS                                                                                                                          DELETE    FROM players    WHERE player_name = 'Mehdi Taremi'                                                                                                                         ADMIN_POL
ADMINISTRATOR                                                                                                                    19-DEC-22 03.03.37.401000 AM                                                SELECT                                                           PLAYERS                                                                                                                          SELECT * FROM players                                                                                                                                                                ADMIN_POL
ADMINISTRATOR                                                                                                                    19-DEC-22 03.03.52.025000 AM                                                GRANT                                                                                                                                                                                             GRANT AUDIT_VIEWER TO manager                                                                                                                                                        ORA_ACCOUNT_MGMT, ORA_SECURECONFIG, ADMIN_POL

16 rows selected.

SQL> CONNECT manager/default@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> SET ROLE app_manager_role IDENTIFIED BY password;

Role set.

SQL> CREATE TABLE timestamps(
  2      timestamp_id NUMBER(4, 0) NOT NULL,
  3      day NUMBER(2, 0),
  4      month NUMBER(2, 0),
  5      year NUMBER(4, 0),
  6      PRIMARY KEY (timestamp_id)
  7  );

Table created.

SQL> DROP TABLE administrator.timestamps;

Table dropped.

SQL> SELECT * FROM administrator.clubs;

   CLUB_ID  LEAGUE_ID CLUB_NAME                                          CLUB_STADIUM
---------- ---------- -------------------------------------------------- --------------------------------------------------
         1          1 Arsenal                                            Emirates Stadium
         2          1 Everton                                            Goodison Park
         3          1 Manchester United                                  Old Trafford
         4          1 Manchester City                                    Etihad Stadium
         5          2 Paris Saint-Germain                                Parc des Princes
         6          2 Olympique de Marseille                             Stade Velodrome
         7          3 SL Benfica                                         Estadio da Luz
         8          3 FC Porto                                           Estadio do Dragao
         9          4 Club Brugge KV                                     Jan Breydel Stadium
        11          4 KAA Gent                                           Ghelamco Arena
        12          5 Flamengo                                           Estadio do Maracana

11 rows selected.

SQL> INSERT ALL
  2      INTO administrator.clubs(club_id, league_id, club_name, club_stadium) VALUES (13, 5, 'Atletico Mineiro', 'Estadio Governador')
  3  SELECT * FROM dual;

1 row created.

SQL> SELECT * FROM administrator.clubs;

   CLUB_ID  LEAGUE_ID CLUB_NAME                                          CLUB_STADIUM
---------- ---------- -------------------------------------------------- --------------------------------------------------
         1          1 Arsenal                                            Emirates Stadium
         2          1 Everton                                            Goodison Park
         3          1 Manchester United                                  Old Trafford
         4          1 Manchester City                                    Etihad Stadium
         5          2 Paris Saint-Germain                                Parc des Princes
         6          2 Olympique de Marseille                             Stade Velodrome
         7          3 SL Benfica                                         Estadio da Luz
         8          3 FC Porto                                           Estadio do Dragao
         9          4 Club Brugge KV                                     Jan Breydel Stadium
        11          4 KAA Gent                                           Ghelamco Arena
        12          5 Flamengo                                           Estadio do Maracana
        13          5 Atletico Mineiro                                   Estadio Governador

12 rows selected.

SQL> UPDATE administrator.clubs
  2      SET club_stadium = 'Estadio do Sport Lisboa'
  3      WHERE club_id = 7;

1 row updated.

SQL> SELECT * FROM administrator.clubs;

   CLUB_ID  LEAGUE_ID CLUB_NAME                                          CLUB_STADIUM
---------- ---------- -------------------------------------------------- --------------------------------------------------
         1          1 Arsenal                                            Emirates Stadium
         2          1 Everton                                            Goodison Park
         3          1 Manchester United                                  Old Trafford
         4          1 Manchester City                                    Etihad Stadium
         5          2 Paris Saint-Germain                                Parc des Princes
         6          2 Olympique de Marseille                             Stade Velodrome
         7          3 SL Benfica                                         Estadio do Sport Lisboa
         8          3 FC Porto                                           Estadio do Dragao
         9          4 Club Brugge KV                                     Jan Breydel Stadium
        11          4 KAA Gent                                           Ghelamco Arena
        12          5 Flamengo                                           Estadio do Maracana
        13          5 Atletico Mineiro                                   Estadio Governador

12 rows selected.

SQL> DELETE
  2      FROM administrator.clubs
  3      WHERE club_name = 'Atletico Mineiro';

1 row deleted.

SQL> SELECT * FROM administrator.clubs;

   CLUB_ID  LEAGUE_ID CLUB_NAME                                          CLUB_STADIUM
---------- ---------- -------------------------------------------------- --------------------------------------------------
         1          1 Arsenal                                            Emirates Stadium
         2          1 Everton                                            Goodison Park
         3          1 Manchester United                                  Old Trafford
         4          1 Manchester City                                    Etihad Stadium
         5          2 Paris Saint-Germain                                Parc des Princes
         6          2 Olympique de Marseille                             Stade Velodrome
         7          3 SL Benfica                                         Estadio do Sport Lisboa
         8          3 FC Porto                                           Estadio do Dragao
         9          4 Club Brugge KV                                     Jan Breydel Stadium
        11          4 KAA Gent                                           Ghelamco Arena
        12          5 Flamengo                                           Estadio do Maracana

11 rows selected.

SQL> SELECT * FROM administrator.players;

 PLAYER_ID    CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
---------- ---------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
         1          5                4 Lionel Messi                                               93         34 One Club Player                                    Free Kick Specialist
         2          3                6 Cristiano Ronaldo                                          91         36 Long Shot Taker                                    Aerial Threat
         3          5                2 Neymar Jr                                                  91         30 Technical Dribbler                                 Acrobat
         4          5                3 Kylian Mbappe                                              91         23 Speed Dribbler                                     Speedster
         5          4                1 Kevin De Bruyne                                            91         30 Playmaker                                          Engine
         6          4                2 Ederson                                                    89         27 Comes for Crosses                                  Long Passer
         7          5                2 Marquinhos                                                 88         27 Leadership                                         Tackler
         8          4                6 Ruben Dias                                                 88         24 Power Header                                       Solid Player
         9          4                5 Raheem Sterling                                            87         26 Clinical Finisher                                  Team Player
        11          1                2 Gabriel Jesus                                              84         25 First Time Shot                                    Complete Forward
        12          7                4 Enzo Fernandez                                             78         21 Fancy Passes                                       Tactician

11 rows selected.

SQL> INSERT ALL
  2      INTO administrator.players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (13, 6, 3, 'Valentine Rongier', 78, 28, 'Finesse Shot', 'Complete Midfielder')
  3  SELECT * FROM dual;

1 row created.

SQL> SELECT * FROM administrator.players;

 PLAYER_ID    CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
---------- ---------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
         1          5                4 Lionel Messi                                               93         34 One Club Player                                    Free Kick Specialist
         2          3                6 Cristiano Ronaldo                                          91         36 Long Shot Taker                                    Aerial Threat
         3          5                2 Neymar Jr                                                  91         30 Technical Dribbler                                 Acrobat
         4          5                3 Kylian Mbappe                                              91         23 Speed Dribbler                                     Speedster
         5          4                1 Kevin De Bruyne                                            91         30 Playmaker                                          Engine
         6          4                2 Ederson                                                    89         27 Comes for Crosses                                  Long Passer
         7          5                2 Marquinhos                                                 88         27 Leadership                                         Tackler
         8          4                6 Ruben Dias                                                 88         24 Power Header                                       Solid Player
         9          4                5 Raheem Sterling                                            87         26 Clinical Finisher                                  Team Player
        11          1                2 Gabriel Jesus                                              84         25 First Time Shot                                    Complete Forward
        12          7                4 Enzo Fernandez                                             78         21 Fancy Passes                                       Tactician
        13          6                3 Valentine Rongier                                          78         28 Finesse Shot                                       Complete Midfielder

12 rows selected.

SQL> UPDATE administrator.players
  2      SET player_ovr = 80
  3      WHERE player_name = 'Enzo Fernandez';

1 row updated.

SQL> SELECT * FROM administrator.players;

 PLAYER_ID    CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
---------- ---------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
         1          5                4 Lionel Messi                                               93         34 One Club Player                                    Free Kick Specialist
         2          3                6 Cristiano Ronaldo                                          91         36 Long Shot Taker                                    Aerial Threat
         3          5                2 Neymar Jr                                                  91         30 Technical Dribbler                                 Acrobat
         4          5                3 Kylian Mbappe                                              91         23 Speed Dribbler                                     Speedster
         5          4                1 Kevin De Bruyne                                            91         30 Playmaker                                          Engine
         6          4                2 Ederson                                                    89         27 Comes for Crosses                                  Long Passer
         7          5                2 Marquinhos                                                 88         27 Leadership                                         Tackler
         8          4                6 Ruben Dias                                                 88         24 Power Header                                       Solid Player
         9          4                5 Raheem Sterling                                            87         26 Clinical Finisher                                  Team Player
        11          1                2 Gabriel Jesus                                              84         25 First Time Shot                                    Complete Forward
        12          7                4 Enzo Fernandez                                             80         21 Fancy Passes                                       Tactician
        13          6                3 Valentine Rongier                                          78         28 Finesse Shot                                       Complete Midfielder

12 rows selected.

SQL> DELETE
  2      FROM administrator.players
  3      WHERE player_name = 'Raheem Sterling';

1 row deleted.

SQL> SELECT * FROM administrator.players;

 PLAYER_ID    CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
---------- ---------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
         1          5                4 Lionel Messi                                               93         34 One Club Player                                    Free Kick Specialist
         2          3                6 Cristiano Ronaldo                                          91         36 Long Shot Taker                                    Aerial Threat
         3          5                2 Neymar Jr                                                  91         30 Technical Dribbler                                 Acrobat
         4          5                3 Kylian Mbappe                                              91         23 Speed Dribbler                                     Speedster
         5          4                1 Kevin De Bruyne                                            91         30 Playmaker                                          Engine
         6          4                2 Ederson                                                    89         27 Comes for Crosses                                  Long Passer
         7          5                2 Marquinhos                                                 88         27 Leadership                                         Tackler
         8          4                6 Ruben Dias                                                 88         24 Power Header                                       Solid Player
        11          1                2 Gabriel Jesus                                              84         25 First Time Shot                                    Complete Forward
        12          7                4 Enzo Fernandez                                             80         21 Fancy Passes                                       Tactician
        13          6                3 Valentine Rongier                                          78         28 Finesse Shot                                       Complete Midfielder

11 rows selected.

SQL> SELECT
  2      dbusername,
  3      event_timestamp,
  4      action_name,
  5      object_name,
  6      sql_text,
  7      system_privilege_used,
  8      unified_audit_policies
  9  FROM unified_audit_trail
 10  WHERE dbusername = 'MANAGER'
 11  ORDER BY event_timestamp;

DBUSERNAME                                                                                                                       EVENT_TIMESTAMP                                                             ACTION_NAME                                                      OBJECT_NAME                                                                                                                      SQL_TEXT                                                                                                                                                                             SYSTEM_PRIVILEGE_USED                                                                                                                                                                UNIFIED_AUDIT_POLICIES
-------------------------------------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------- ---------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
MANAGER                                                                                                                          19-DEC-22 03.05.00.091000 AM                                                SET ROLE                                                                                                                                                                                          SET ROLE app_manager_role IDENTIFIED BY *                                                                                                                                                                                                                                                                                                                                 ORA_SECURECONFIG
MANAGER                                                                                                                          19-DEC-22 03.05.47.652000 AM                                                CREATE TABLE                                                     TIMESTAMPS                                                                                                                       CREATE TABLE timestamps(    timestamp_id NUMBER(4, 0) NOT NULL,    day NUMBER(2, 0),    month NUMBER(2, 0),    year NUMBER(4, 0),    PRIMARY KEY (timestamp_id) )                    CREATE ANY TABLE                                                                                                                                                                     ORA_SECURECONFIG, TABLE_POL
MANAGER                                                                                                                          19-DEC-22 03.06.02.115000 AM                                                DROP TABLE                                                       TIMESTAMPS                                                                                                                       DROP TABLE administrator.timestamps                                                                                                                                                  DROP ANY TABLE                                                                                                                                                                       ORA_SECURECONFIG, TABLE_POL
MANAGER                                                                                                                          19-DEC-22 03.06.19.060000 AM                                                SELECT                                                           CLUBS                                                                                                                            SELECT * FROM administrator.clubs                                                                                                                                                                                                                                                                                                                                         ADMIN_POL, TABLE_POL
MANAGER                                                                                                                          19-DEC-22 03.07.25.254000 AM                                                INSERT                                                           CLUBS                                                                                                                            INSERT ALL    INTO administrator.clubs(club_id, league_id, club_name, club_stadium) VALUES (13, 5, 'Atletico Mineiro', 'Estadio Governador')                                                                                                                                                                                                                              ADMIN_POL, TABLE_POL
MANAGER                                                                                                                          19-DEC-22 03.08.14.990000 AM                                                SELECT                                                           CLUBS                                                                                                                            SELECT * FROM administrator.clubs                                                                                                                                                                                                                                                                                                                                         ADMIN_POL, TABLE_POL
MANAGER                                                                                                                          19-DEC-22 03.09.38.612000 AM                                                UPDATE                                                           CLUBS                                                                                                                            UPDATE administrator.clubs    SET club_stadium = 'Estadio do Sport Lisboa'    WHERE club_id = 7                                                                                                                                                                                                                                                                           ADMIN_POL, TABLE_POL
MANAGER                                                                                                                          19-DEC-22 03.10.23.192000 AM                                                SELECT                                                           CLUBS                                                                                                                            SELECT * FROM administrator.clubs                                                                                                                                                                                                                                                                                                                                         ADMIN_POL, TABLE_POL
MANAGER                                                                                                                          19-DEC-22 03.10.51.899000 AM                                                DELETE                                                           CLUBS                                                                                                                            DELETE    FROM administrator.clubs    WHERE club_name = 'Atletico Mineiro'                                                                                                                                                                                                                                                                                                ADMIN_POL, TABLE_POL
MANAGER                                                                                                                          19-DEC-22 03.11.36.602000 AM                                                SELECT                                                           CLUBS                                                                                                                            SELECT * FROM administrator.clubs                                                                                                                                                                                                                                                                                                                                         ADMIN_POL, TABLE_POL
MANAGER                                                                                                                          19-DEC-22 03.11.57.548000 AM                                                SELECT                                                           PLAYERS                                                                                                                          SELECT * FROM administrator.players                                                                                                                                                                                                                                                                                                                                       ADMIN_POL, TABLE_POL
MANAGER                                                                                                                          19-DEC-22 03.12.31.009000 AM                                                INSERT                                                           PLAYERS                                                                                                                          INSERT ALL    INTO administrator.players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality)                                                                                                                                                                                                                      ADMIN_POL, TABLE_POL
MANAGER                                                                                                                          19-DEC-22 03.13.46.908000 AM                                                SELECT                                                           PLAYERS                                                                                                                          SELECT * FROM administrator.players                                                                                                                                                                                                                                                                                                                                       ADMIN_POL, TABLE_POL
MANAGER                                                                                                                          19-DEC-22 03.14.18.948000 AM                                                UPDATE                                                           PLAYERS                                                                                                                          UPDATE administrator.players    SET player_ovr = 80    WHERE player_name = 'Enzo Fernandez'                                                                                                                                                                                                                                                                               ADMIN_POL, TABLE_POL
MANAGER                                                                                                                          19-DEC-22 03.14.43.288000 AM                                                SELECT                                                           PLAYERS                                                                                                                          SELECT * FROM administrator.players                                                                                                                                                                                                                                                                                                                                       ADMIN_POL, TABLE_POL
MANAGER                                                                                                                          19-DEC-22 03.15.58.289000 AM                                                DELETE                                                           PLAYERS                                                                                                                          DELETE    FROM administrator.players    WHERE player_name = 'Raheem Sterling'                                                                                                                                                                                                                                                                                             ADMIN_POL, TABLE_POL
MANAGER                                                                                                                          19-DEC-22 03.16.34.481000 AM                                                SELECT                                                           PLAYERS                                                                                                                          SELECT * FROM administrator.players                                                                                                                                                                                                                                                                                                                                       ADMIN_POL, TABLE_POL

17 rows selected.

SQL> CONNECT system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> BEGIN
  2      DBMS_AUDIT_MGMT.INIT_CLEANUP(
  3          AUDIT_TRAIL_TYPE => DBMS_AUDIT_MGMT.AUDIT_TRAIL_ALL,
  4          DEFAULT_CLEANUP_INTERVAL => 12
  5      );
  6  END;
  7  /

PL/SQL procedure successfully completed.

SQL> SELECT COUNT(*) FROM unified_audit_trail;

  COUNT(*)
----------
         5

SQL> BEGIN
  2      DBMS_AUDIT_MGMT.CLEAN_AUDIT_TRAIL(
  3          AUDIT_TRAIL_TYPE => DBMS_AUDIT_MGMT.AUDIT_TRAIL_ALL,
  4          USE_LAST_ARCH_TIMESTAMP => FALSE
  5      );
  6  END;
  7  /

PL/SQL procedure successfully completed.

SQL> SELECT COUNT(*) FROM unified_audit_trail;

  COUNT(*)
----------
         5

SQL> AUDIT policy ORA_ACCOUNT_MGMT;

Audit succeeded.

SQL> AUDIT policy ORA_LOGON_FAILURES;

Audit succeeded.

SQL> AUDIT policy ORA_SECURECONFIG;

Audit succeeded.

SQL> SELECT
  2      dbusername,
  3      event_timestamp,
  4      action_name,
  5      object_name,
  6      sql_text,
  7      unified_audit_policies
  8  FROM unified_audit_trail
  9  ORDER BY event_timestamp;

DBUSERNAME                                                                                                                       EVENT_TIMESTAMP                                                             ACTION_NAME                                                      OBJECT_NAME                                                                                                                      SQL_TEXT                                                                                                                                                                             UNIFIED_AUDIT_POLICIES
-------------------------------------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------- ---------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SYSTEM                                                                                                                           19-DEC-22 04.34.50.874000 AM                                                EXECUTE                                                          DBMS_AUDIT_MGMT                                                                                                                  BEGIN    DBMS_AUDIT_MGMT.INIT_CLEANUP(        AUDIT_TRAIL_TYPE => DBMS_AUDIT_MGMT.AUDIT_TRAIL_ALL,        DEFAULT_CLEANUP_INTERVAL => 12    ); END
SYSTEM                                                                                                                           19-DEC-22 04.35.05.384000 AM                                                EXECUTE                                                          DBMS_AUDIT_MGMT                                                                                                                  BEGIN    DBMS_AUDIT_MGMT.CLEAN_AUDIT_TRAIL(        AUDIT_TRAIL_TYPE => DBMS_AUDIT_MGMT.AUDIT_TRAIL_ALL,        USE_LAST_ARCH_TIMESTAMP => FALSE    ); END
SYSTEM                                                                                                                           19-DEC-22 04.37.00.097000 AM                                                AUDIT                                                            ORA_ACCOUNT_MGMT                                                                                                                 AUDIT policy ORA_ACCOUNT_MGMT                                                                                                                                                        ORA_SECURECONFIG
SYSTEM                                                                                                                           19-DEC-22 04.37.01.380000 AM                                                AUDIT                                                            ORA_LOGON_FAILURES                                                                                                               AUDIT policy ORA_ACCOUNT_MGMT                                                                                                                                                        ORA_SECURECONFIG
SYSTEM                                                                                                                           19-DEC-22 04.37.02.132000 AM                                                AUDIT                                                            ORA_SECURECONFIG                                                                                                                 AUDIT policy ORA_ACCOUNT_MGMT                                                                                                                                                        ORA_SECURECONFIG

5 rows selected.

SQL> EXIT;
Disconnected from Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0
```