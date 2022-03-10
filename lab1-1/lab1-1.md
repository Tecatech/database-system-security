```sql
SQL> ALTER SESSION SET "_ORACLE_SCRIPT" = true;

Session altered.

SQL> CREATE USER tecatech_lab1 IDENTIFIED BY 7113;

User created.

SQL> GRANT CREATE SESSION, CREATE TABLE to tecatech_lab1;

Grant succeeded.

SQL> CONNECT tecatech_lab1
Enter password:
Connected.
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
  6  player_ovr NUMBER(2, 0) NOT NULL,
  7  player_age NUMBER(2, 0) NOT NULL,
  8  player_trait NVARCHAR2(50) NOT NULL,
  9  player_speciality NVARCHAR2(40) NOT NULL,
 10  PRIMARY KEY (player_id),
 11  FOREIGN KEY (club_id) REFERENCES clubs(club_id),
 12  FOREIGN KEY (national_team_id) REFERENCES national_teams(national_team_id)
 13  );

Table created.

SQL> CREATE TABLE sponsors(
  2  sponsor_id NUMBER(2, 0) NOT NULL,
  3  national_team_id NUMBER(3, 0) NOT NULL,
  4  club_id NUMBER(5, 0) NOT NULL,
  5  player_id NUMBER(6, 0) NOT NULL,
  6  sponsor_name NVARCHAR2(50) NOT NULL,
  7  PRIMARY KEY (sponsor_id),
  8  FOREIGN KEY (national_team_id) REFERENCES national_teams(national_team_id),
  9  FOREIGN KEY (club_id) REFERENCES clubs(club_id),
 10  FOREIGN KEY (player_id) REFERENCES players(player_id)
 11  );

Table created.

SQL> CONNECT system
Enter password:
Connected.
SQL> GRANT UNLIMITED TABLESPACE TO tecatech_lab1;

Grant succeeded.

SQL> CONNECT tecatech_lab1
Enter password:
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
  7  INTO leagues(league_id, national_team_id, league_name) VALUES (6, 4, 'Primera Division')
  8  INTO leagues(league_id, national_team_id, league_name) VALUES (7, 7, 'Liga MX')
  9  SELECT * FROM dual;

7 rows created.

SQL> INSERT ALL
  2  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (1, 1, 'Arsenal', 'Emirates Stadium')
  3  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (2, 1, 'Everton', 'Goodison Park')
  4  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (3, 1, 'Manchester United', 'Old Trafford')
  5  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (4, 1, 'Manchester City', 'Etihad Stadium')
  6  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (5, 2, 'Paris Saint-Germain', 'Parc des Princes')
  7  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (6, 3, 'SL Benfica', 'Estadio da Luz')
  8  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (7, 4, 'FC Porto', 'Estadio do Dragao')
  9  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (8, 5, 'Atletico Mineiro', 'Estadio Governador')
 10  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (9, 6, 'Boca Juniors', 'La Bombonera')
 11  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (10, 6, 'River Plate', 'Estadio Monumental')
 12  INTO clubs(club_id, league_id, club_name, club_stadium) VALUES (11, 7, 'Tigres UANL', 'University Stadium')
 13  SELECT * FROM dual;

11 rows created.

SQL> INSERT ALL
  2  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (1, 5, 4, 'Lionel Messi', 93, 34, 'Playmaker', 'Free Kick Specialist')
  3  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (2, 3, 6, 'Cristiano Ronaldo', 91, 36, 'Long Shot Taker', 'Aerial Threat')
  4  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (3, 5, 2, 'Neymar Jr', 91, 30, 'Technical Dribbler', 'Acrobat')
  5  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (4, 5, 3, 'Kylian Mbappe', 91, 23, 'Speed Dribbler', 'Speedster')
  6  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (5, 4, 1, 'Kevin De Bruyne', 91, 30, 'Playmaker', 'Engine')
  7  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (6, 4, 2, 'Ederson', 89, 27, 'Comes for Crosses', 'Long Passer')
  8  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (7, 5, 2, 'Marquinhos', 88, 27, 'Leadership', 'Tackler')
  9  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (8, 4, 6, 'Ruben Dias', 88, 24, 'Power Header', 'Solid Player')
 10  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (9, 4, 5, 'Raheem Sterling', 87, 26, 'Speed Dribbler', 'Acrobat')
 11  INTO players(player_id, club_id, national_team_id, player_name, player_ovr, player_age, player_trait, player_speciality) VALUES (10, 7, 9, 'Mehdi Taremi', 79, 29, 'Technical Dribbler', 'Flair')
 12  SELECT * FROM dual;

10 rows created.

SQL> INSERT ALL
  2  INTO sponsors(sponsor_id, national_team_id, club_id, player_id, sponsor_name) VALUES (1, 1, 9, 1, 'Adidas')
  3  INTO sponsors(sponsor_id, national_team_id, club_id, player_id, sponsor_name) VALUES (2, 2, 5, 2, 'Nike')
  4  INTO sponsors(sponsor_id, national_team_id, club_id, player_id, sponsor_name) VALUES (3, 8, 8, 3, 'Puma')
  5  SELECT * FROM dual;

3 rows created.

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
        6                4 Primera Division
        7                7 Liga MX

7 rows selected.

SQL> SELECT * FROM clubs;

CLUB_ID LEAGUE_ID CLUB_NAME                                          CLUB_STADIUM
------- --------- -------------------------------------------------- --------------------------------------------------
      1         1 Arsenal                                            Emirates Stadium
      2         1 Everton                                            Goodison Park
      3         1 Manchester United                                  Old Trafford
      4         1 Manchester City                                    Etihad Stadium
      5         2 Paris Saint-Germain                                Parc Des Princes
      6         3 SL Benfica                                         Estadio da Luz
      7         4 FC Porto                                           Estadio do Dragao
      8         5 Atletico Mineiro                                   Estadio Governador
      9         6 Boca Juniors                                       La Bombonera
     10         6 River Plate                                        Estadio Monumental
     11         7 Tigres UANL                                        University Stadium

11 rows selected.

SQL> SELECT * FROM players;

PLAYER_ID CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
--------- ------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
        1       5                4 Lionel Messi                                               93         34 Playmaker                                          Free Kick Specialist
        2       3                6 Cristiano Ronaldo                                          91         36 Long Shot Taker                                    Aerial Threat
        3       5                2 Neymar Jr                                                  91         30 Technical Dribbler                                 Acrobat
        4       5                3 Kylian Mbappe                                              91         23 Speed Dribbler                                     Speedster
        5       4                1 Kevin De Bruyne                                            91         30 Playmaker                                          Engine
        6       4                2 Ederson                                                    89         27 Comes for Crosses                                  Long Passer
        7       5                2 Marquinhos                                                 88         27 Leadership                                         Tackler
        8       4                6 Ruben Dias                                                 88         24 Power Header                                       Solid Player
        9       4                5 Raheem Sterling                                            87         26 Speed Dribbler                                     Acrobat
       10       7                9 Mehdi Taremi                                               79         29 Technical Dribbler                                 Flair

10 rows selected.

SQL> SELECT * FROM sponsors;

SPONSOR_ID NATIONAL_TEAM_ID CLUB_ID PLAYER_ID SPONSOR_NAME
---------- ---------------- ------- --------- --------------------------------------------------
         1                1       9         1 Adidas
         2                2       5         2 Nike
         3                8       8         3 Puma

SQL>
```