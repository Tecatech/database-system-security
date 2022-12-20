```sql
PS C:\Users\Admin> sqlplus system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1"

SQL*Plus: Release 18.0.0.0.0 - Production on Thu Dec 15 18:23:18 2022
Version 18.4.0.0.0

Copyright (c) 1982, 2018, Oracle.  All rights reserved.

Last Successful login time: Thu Dec 15 2022 17:58:07 +03:00

Connected to:
Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0

SQL> SHOW con_name;

CON_NAME
------------------------------
XEPDB1
SQL> CREATE USER administrator IDENTIFIED BY default;

User created.

SQL> GRANT DBA TO administrator;

Grant succeeded.

SQL> CONNECT administrator/default@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> CREATE TABLE national_teams(
  2      national_team_id NUMBER(3, 0) NOT NULL,
  3      national_team_name NVARCHAR2(60) NOT NULL,
  4      national_team_points NUMBER(6, 2) NOT NULL,
  5      national_team_association NVARCHAR2(10) NOT NULL,
  6      PRIMARY KEY (national_team_id)
  7  );

Table created.

SQL> CREATE TABLE leagues(
  2      league_id NUMBER(3, 0) NOT NULL,
  3      national_team_id NUMBER(3, 0) NOT NULL,
  4      league_name NVARCHAR2(50) NOT NULL,
  5      PRIMARY KEY (league_id),
  6      FOREIGN KEY (national_team_id) REFERENCES national_teams(national_team_id)
  7  );

Table created.

SQL> CREATE TABLE clubs(
  2      club_id NUMBER(5, 0) NOT NULL,
  3      league_id NUMBER(3, 0) NOT NULL,
  4      club_name NVARCHAR2(50) NOT NULL,
  5      club_stadium NVARCHAR2(50) NOT NULL,
  6      PRIMARY KEY (club_id),
  7      FOREIGN KEY (league_id) REFERENCES leagues(league_id)
  8  );

Table created.

SQL> CREATE TABLE players(
  2      player_id NUMBER(6, 0) NOT NULL,
  3      club_id NUMBER(5, 0) NOT NULL,
  4      national_team_id NUMBER(3, 0) NOT NULL,
  5      player_name NVARCHAR2(50) NOT NULL,
  6      player_ovr NUMBER(2, 0) NOT NULL,
  7      player_age NUMBER(2, 0) NOT NULL,
  8      player_trait NVARCHAR2(50) NOT NULL,
  9      player_speciality NVARCHAR2(40) NOT NULL,
 10      PRIMARY KEY (player_id),
 11      FOREIGN KEY (club_id) REFERENCES clubs(club_id),
 12      FOREIGN KEY (national_team_id) REFERENCES national_teams(national_team_id)
 13  );

Table created.

SQL> INSERT ALL
  2      INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (1, 'Belgium', 1828.45, 'UEFA')
  3      INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (2, 'Brazil', 1823.42, 'CONMEBOL')
  4      INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (3, 'France', 1786.15, 'UEFA')
  5      INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (4, 'Argentina', 1766.99, 'CONMEBOL')
  6      INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (5, 'England', 1755.52, 'UEFA')
  7      INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (6, 'Portugal', 1660.25, 'UEFA')
  8      INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (7, 'Mexico', 1647.91, 'CONCACAF')
  9      INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (8, 'Senegal', 1587.78, 'CAF')
 10      INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (9, 'IR Iran', 1572.89, 'AFC')
 11      INTO national_teams(national_team_id, national_team_name, national_team_points, national_team_association) VALUES (10, 'New Zealand', 1161.66, 'OFC')
 12  SELECT * FROM dual;

10 rows created.

SQL> INSERT ALL
  2      INTO leagues(league_id, national_team_id, league_name) VALUES (1, 5, 'Premier League')
  3      INTO leagues(league_id, national_team_id, league_name) VALUES (2, 3, 'Ligue 1 Conforama')
  4      INTO leagues(league_id, national_team_id, league_name) VALUES (3, 6, 'Liga NOS')
  5      INTO leagues(league_id, national_team_id, league_name) VALUES (4, 1, 'Pro League')
  6      INTO leagues(league_id, national_team_id, league_name) VALUES (5, 2, 'Serie A')
  7  SELECT * FROM dual;

5 rows created.

SQL> INSERT ALL
  2      INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (1, 1, 'Arsenal', 'Emirates Stadium')
  3      INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (2, 1, 'Everton', 'Goodison Park')
  4      INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (3, 1, 'Manchester United', 'Old Trafford')
  5      INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (4, 1, 'Manchester City', 'Etihad Stadium')
  6      INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (5, 2, 'Paris Saint-Germain', 'Parc des Princes')
  7      INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (6, 2, 'Olympique de Marseille', 'Stade Velodrome')
  8      INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (7, 3, 'SL Benfica', 'Estadio da Luz')
  9      INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (8, 3, 'FC Porto', 'Estadio do Dragao')
 10      INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (9, 4, 'Club Brugge KV', 'Jan Breydel Stadium')
 11      INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (10, 5, 'Atletico Mineiro', 'Estadio Governador')
 12  SELECT * FROM dual;

10 rows created.

SQL> INSERT ALL
  2      INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (1, 5, 4, 'Lionel Messi', 93, 34, 'One Club Player', 'Free Kick Specialist')
  3      INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (2, 3, 6, 'Cristiano Ronaldo', 91, 36, 'Long Shot Taker', 'Aerial Threat')
  4      INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (3, 5, 2, 'Neymar Jr', 91, 30, 'Technical Dribbler', 'Acrobat')
  5      INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (4, 5, 3, 'Kylian Mbappe', 91, 23, 'Speed Dribbler', 'Speedster')
  6      INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (5, 4, 1, 'Kevin De Bruyne', 91, 30, 'Playmaker', 'Engine')
  7      INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (6, 4, 2, 'Ederson', 89, 27, 'Comes for Crosses', 'Long Passer')
  8      INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (7, 5, 2, 'Marquinhos', 88, 27, 'Leadership', 'Tackler')
  9      INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (8, 4, 6, 'Ruben Dias', 88, 24, 'Power Header', 'Solid Player')
 10      INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (9, 4, 5, 'Raheem Sterling', 87, 26, 'Clinical Finisher', 'Team Player')
 11      INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (10, 8, 9, 'Mehdi Taremi', 79, 29, 'Strength', 'Flair')
 12  SELECT * FROM dual;

10 rows created.

SQL> CREATE VIEW career_mode AS
  2      SELECT
  3          players.player_name AS player,
  4          clubs.club_name AS club,
  5          national_teams.national_team_name AS national_team,
  6          players.player_ovr AS rating,
  7          players.player_age AS age
  8      FROM
  9          players,
 10          clubs,
 11          national_teams
 12      WHERE
 13          players.club_id = clubs.club_id AND
 14          players.national_team_id = national_teams.national_team_id
 15      ORDER BY
 16          rating DESC,
 17          age ASC;

View created.

SQL> SELECT * FROM career_mode;

PLAYER                                             CLUB                                               NATIONAL_TEAM                                                    RATING        AGE
-------------------------------------------------- -------------------------------------------------- ------------------------------------------------------------ ---------- ----------
Lionel Messi                                       Paris Saint-Germain                                Argentina                                                            93         34
Kylian Mbappe                                      Paris Saint-Germain                                France                                                               91         23
Kevin De Bruyne                                    Manchester City                                    Belgium                                                              91         30
Neymar Jr                                          Paris Saint-Germain                                Brazil                                                               91         30
Cristiano Ronaldo                                  Manchester United                                  Portugal                                                             91         36
Ederson                                            Manchester City                                    Brazil                                                               89         27
Ruben Dias                                         Manchester City                                    Portugal                                                             88         24
Marquinhos                                         Paris Saint-Germain                                Brazil                                                               88         27
Raheem Sterling                                    Manchester City                                    England                                                              87         26
Mehdi Taremi                                       FC Porto                                           IR Iran                                                              79         29

10 rows selected.

SQL> CREATE USER client
  2      IDENTIFIED BY default
  3      DEFAULT TABLESPACE users
  4      TEMPORARY TABLESPACE temp
  5      QUOTA 100M ON users;

User created.

SQL> GRANT CREATE SESSION TO client;

Grant succeeded.

SQL> CREATE ROLE app_user_role NOT IDENTIFIED;

Role created.

SQL> GRANT SELECT ON administrator.career_mode TO app_user_role;

Grant succeeded.

SQL> GRANT app_user_role TO client;

Grant succeeded.

SQL> CREATE PROFILE app_user LIMIT
  2      FAILED_LOGIN_ATTEMPTS 2
  3      SESSIONS_PER_USER 1;

Profile created.

SQL> ALTER USER client PROFILE app_user;

User altered.

SQL> CREATE USER manager
  2      IDENTIFIED BY default
  3      DEFAULT TABLESPACE users
  4      TEMPORARY TABLESPACE temp
  5      QUOTA 100M ON users;

User created.

SQL> GRANT CREATE SESSION TO manager;

Grant succeeded.

SQL> CREATE ROLE app_manager_role IDENTIFIED BY password;

Role created.

SQL> GRANT app_user_role TO app_manager_role;

Grant succeeded.

SQL> GRANT
  2      SELECT,
  3      UPDATE (club_stadium)
  4  ON administrator.clubs
  5  TO app_manager_role;

Grant succeeded.

SQL> GRANT
  2      SELECT,
  3      UPDATE (player_ovr)
  4  ON administrator.players
  5  TO app_manager_role;

Grant succeeded.

SQL> GRANT app_manager_role TO manager;

Grant succeeded.

SQL> CREATE PROFILE app_manager LIMIT
  2      FAILED_LOGIN_ATTEMPTS 1
  3      SESSIONS_PER_USER 2;

Profile created.

SQL> ALTER USER manager PROFILE app_manager;

User altered.

SQL> CONNECT client/default@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> SELECT * FROM administrator.career_mode;

PLAYER                                             CLUB                                               NATIONAL_TEAM                                                    RATING        AGE
-------------------------------------------------- -------------------------------------------------- ------------------------------------------------------------ ---------- ----------
Lionel Messi                                       Paris Saint-Germain                                Argentina                                                            93         34
Kylian Mbappe                                      Paris Saint-Germain                                France                                                               91         23
Kevin De Bruyne                                    Manchester City                                    Belgium                                                              91         30
Neymar Jr                                          Paris Saint-Germain                                Brazil                                                               91         30
Cristiano Ronaldo                                  Manchester United                                  Portugal                                                             91         36
Ederson                                            Manchester City                                    Brazil                                                               89         27
Ruben Dias                                         Manchester City                                    Portugal                                                             88         24
Marquinhos                                         Paris Saint-Germain                                Brazil                                                               88         27
Raheem Sterling                                    Manchester City                                    England                                                              87         26
Mehdi Taremi                                       FC Porto                                           IR Iran                                                              79         29

10 rows selected.

SQL> DROP VIEW administrator.career_mode;
DROP VIEW administrator.career_mode
*
ERROR at line 1:
ORA-01031: insufficient privileges

SQL> SELECT * FROM administrator.national_teams;
SELECT * FROM administrator.national_teams
                            *
ERROR at line 1:
ORA-00942: table or view does not exist

SQL> SELECT * FROM administrator.leagues;
SELECT * FROM administrator.leagues
                            *
ERROR at line 1:
ORA-00942: table or view does not exist

SQL> SELECT * FROM administrator.clubs;
SELECT * FROM administrator.clubs
                            *
ERROR at line 1:
ORA-00942: table or view does not exist

SQL> SELECT * FROM administrator.players;
SELECT * FROM administrator.players
                            *
ERROR at line 1:
ORA-00942: table or view does not exist

SQL> CONNECT manager/default@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> SELECT * FROM administrator.career_mode;
SELECT * FROM administrator.career_mode
                            *
ERROR at line 1:
ORA-00942: table or view does not exist

SQL> SET ROLE app_manager_role IDENTIFIED BY password;

Role set.

SQL> SELECT * FROM administrator.career_mode;

PLAYER                                             CLUB                                               NATIONAL_TEAM                                                    RATING        AGE
-------------------------------------------------- -------------------------------------------------- ------------------------------------------------------------ ---------- ----------
Lionel Messi                                       Paris Saint-Germain                                Argentina                                                            93         34
Kylian Mbappe                                      Paris Saint-Germain                                France                                                               91         23
Kevin De Bruyne                                    Manchester City                                    Belgium                                                              91         30
Neymar Jr                                          Paris Saint-Germain                                Brazil                                                               91         30
Cristiano Ronaldo                                  Manchester United                                  Portugal                                                             91         36
Ederson                                            Manchester City                                    Brazil                                                               89         27
Ruben Dias                                         Manchester City                                    Portugal                                                             88         24
Marquinhos                                         Paris Saint-Germain                                Brazil                                                               88         27
Raheem Sterling                                    Manchester City                                    England                                                              87         26
Mehdi Taremi                                       FC Porto                                           IR Iran                                                              79         29

10 rows selected.

SQL> SELECT * FROM administrator.national_teams;
SELECT * FROM administrator.national_teams
                            *
ERROR at line 1:
ORA-00942: table or view does not exist

SQL> SELECT * FROM administrator.leagues;
SELECT * FROM administrator.leagues
                            *
ERROR at line 1:
ORA-00942: table or view does not exist

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
        10          5 Atletico Mineiro                                   Estadio Governador

10 rows selected.

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
        10          8                9 Mehdi Taremi                                               79         29 Strength                                           Flair

10 rows selected.

SQL> UPDATE administrator.clubs
  2      SET club_name = 'FC Base'
  3      WHERE club_id = 1;
UPDATE administrator.clubs
                     *
ERROR at line 1:
ORA-01031: insufficient privileges

SQL> UPDATE administrator.clubs
  2      SET club_stadium = 'Stade de France'
  3      WHERE club_id = 5;

1 row updated.

SQL> SELECT * FROM administrator.clubs;

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

SQL> UPDATE administrator.players
  2      SET player_trait = 'Finesse Shot'
  3      WHERE player_name = 'Lionel Messi';
UPDATE administrator.players
                     *
ERROR at line 1:
ORA-01031: insufficient privileges

SQL> UPDATE administrator.players
  2      SET player_ovr = 90
  3      WHERE player_name = 'Kevin De Bruyne';

1 row updated.

SQL> SELECT * FROM administrator.players;

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

SQL> EXIT;
Disconnected from Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0
PS C:\Users\Admin> sqlplus system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1"

SQL*Plus: Release 18.0.0.0.0 - Production on Fri Dec 16 02:21:36 2022
Version 18.4.0.0.0

Copyright (c) 1982, 2018, Oracle.  All rights reserved.

Last Successful login time: Fri Dec 16 2022 02:04:37 +03:00

Connected to:
Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0

SQL> CONNECT client@"DESKTOP-UG7SO1F:1521/xepdb1";
Enter password:
ERROR:
ORA-01017: invalid username/password; logon denied.

SQL> CONNECT client@"DESKTOP-UG7SO1F:1521/xepdb1";
Enter password:
ERROR:
ORA-01017: invalid username/password; logon denied.

SQL> CONNECT client@"DESKTOP-UG7SO1F:1521/xepdb1";
Enter password:
ERROR:
ORA-28000: the account is locked.

SQL> CONNECT client/default@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> CONNECT client/default@"DESKTOP-UG7SO1F:1521/xepdb1";
ERROR:
ORA-02391: exceeded simultaneous SESSIONS_PER_USER limit.

SQL> CONNECT manager@"DESKTOP-UG7SO1F:1521/xepdb1";
Enter password:
ERROR:
ORA-01017: invalid username/password; logon denied.

SQL> CONNECT manager@"DESKTOP-UG7SO1F:1521/xepdb1";
Enter password:
ERROR:
ORA-28000: the account is locked.

SQL> CONNECT manager/default@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> CONNECT manager/default@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> CONNECT manager/default@"DESKTOP-UG7SO1F:1521/xepdb1";
ERROR:
ORA-02391: exceeded simultaneous SESSIONS_PER_USER limit.

SQL> EXIT;
Disconnected from Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0
```