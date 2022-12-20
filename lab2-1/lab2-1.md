```sql
PS C:\Users\Admin> sqlplus system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1"

SQL*Plus: Release 18.0.0.0.0 - Production on Tue Dec 13 02:29:51 2022
Version 18.4.0.0.0

Copyright (c) 1982, 2018, Oracle.  All rights reserved.

Last Successful login time: Sat Dec 10 2022 22:58:13 +03:00

Connected to:
Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0

SQL> SELECT
  2      instance_name,
  3      con_id,
  4      version
  5  FROM v$instance;

INSTANCE_NAME        CON_ID VERSION
---------------- ---------- -----------------
xe                        0 18.0.0.0.0

SQL> SHOW pdbs;

    CON_ID CON_NAME                       OPEN MODE  RESTRICTED
---------- ------------------------------ ---------- ----------
         2 PDB$SEED                       READ ONLY  NO
         3 XEPDB1                         READ WRITE NO
SQL> ALTER SESSION SET CONTAINER = xepdb1;

Session altered.

SQL> SHOW con_name;

CON_NAME
------------------------------
XEPDB1
SQL> SELECT username
  2  FROM dba_users
  3  WHERE LOWER(username) LIKE 'tecatech%';

USERNAME
--------------------------------------------------------------------------------
TECATECH_LAB1_4

SQL> CREATE USER tecatech_lab2_1
  2      IDENTIFIED BY beta
  3      DEFAULT TABLESPACE users
  4      TEMPORARY TABLESPACE temp
  5      QUOTA 100M ON users;

User created.

SQL> SELECT username
  2  FROM dba_users
  3  WHERE LOWER(username) LIKE 'tecatech%';

USERNAME
--------------------------------------------------------------------------------
TECATECH_LAB2_1
TECATECH_LAB1_4

SQL> GRANT
  2      SELECT ANY TABLE,
  3      INSERT ANY TABLE,
  4      UPDATE ANY TABLE,
  5      DELETE ANY TABLE
  6  TO tecatech_lab2_1;

Grant succeeded.

SQL> GRANT CREATE SESSION TO tecatech_lab2_1;

Grant succeeded.

SQL> CONNECT tecatech_lab2_1/beta@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> SELECT * FROM players;
SELECT * FROM players
              *
ERROR at line 1:
ORA-00942: table or view does not exist

SQL> SELECT * FROM tecatech_lab1_4.players;

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

SQL> EXIT;
Disconnected from Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0
PS C:\Users\Admin> sqlplus system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1"

SQL*Plus: Release 18.0.0.0.0 - Production on Tue Dec 13 02:29:51 2022
Version 18.4.0.0.0

Copyright (c) 1982, 2018, Oracle.  All rights reserved.

Last Successful login time: Sat Dec 10 2022 22:58:13 +03:00

Connected to:
Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0

SQL> ALTER SESSION SET CONTAINER = xepdb1;

Session altered.

SQL> SHOW con_name;

CON_NAME
------------------------------
XEPDB1
SQL> CONNECT tecatech_lab1_4/alpha@"DESKTOP-VA4QSE1:1521/xepdb1";
Connected.
SQL> UPDATE players
  2      SET player_ovr = 81
  3      WHERE player_name = 'Mehdi Taremi';

1 row updated.

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
       10       8                9 Mehdi Taremi                                               81         29 Strength                                           Flair

10 rows selected.

SQL> CONNECT tecatech_lab2_1/beta@"DESKTOP-VA4QSE1:1521/xepdb1";
Connected.
SQL> SELECT * FROM tecatech_lab1_4.players;

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

SQL> ROLLBACK;

Rollback complete.

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

SQL> SELECT * FROM tecatech_lab1_4.players;

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

SQL> UPDATE players
  2      SET player_trait = 'Finesse Shot'
  3      WHERE player_name = 'Lionel Messi';

1 row updated.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM players;

PLAYER_ID CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
--------- ------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
        1       5                4 Lionel Messi                                               93         34 Finesse Shot                                       Free Kick Specialist
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

SQL> SELECT * FROM tecatech_lab1_4.players;

PLAYER_ID CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
--------- ------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
        1       5                4 Lionel Messi                                               93         34 Finesse Shot                                       Free Kick Specialist
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

SQL> SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

Transaction set.

SQL> UPDATE players
  2      SET player_ovr = 86
  3      WHERE player_name = 'Raheem Sterling';

1 row updated.

SQL> UPDATE tecatech_lab1_4.players
  2      SET player_ovr = 88
  3      WHERE player_name = 'Raheem Sterling';

SQL> COMMIT;

Commit complete.

SQL> UPDATE tecatech_lab1_4.players
  2      SET player_ovr = 88
  3      WHERE player_name = 'Raheem Sterling';

1 row updated.

SQL> COMMIT;

Commit complete.

SQL> UPDATE players
  2      SET club_id = 6
  3      WHERE player_name = 'Cristiano Ronaldo';

1 row updated.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM players;

PLAYER_ID CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
--------- ------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
        1       5                4 Lionel Messi                                               93         34 Finesse Shot                                       Free Kick Specialist
        2       6                6 Cristiano Ronaldo                                          91         36 Long Shot Taker                                    Aerial Threat
        3       5                2 Neymar Jr                                                  91         30 Technical Dribbler                                 Acrobat
        4       5                3 Kylian Mbappe                                              91         23 Speed Dribbler                                     Speedster
        5       4                1 Kevin De Bruyne                                            91         30 Playmaker                                          Engine
        6       4                2 Ederson                                                    89         27 Comes for Crosses                                  Long Passer
        7       5                2 Marquinhos                                                 88         27 Leadership                                         Tackler
        8       4                6 Ruben Dias                                                 88         24 Power Header                                       Solid Player
        9       4                5 Raheem Sterling                                            88         26 Clinical Finisher                                  Team Player
       10       8                9 Mehdi Taremi                                               79         29 Strength                                           Flair

10 rows selected.

SQL> SELECT * FROM tecatech_lab1_4.players;

PLAYER_ID CLUB_ID NATIONAL_TEAM_ID PLAYER_NAME                                        PLAYER_OVR PLAYER_AGE PLAYER_TRAIT                                       PLAYER_SPECIALITY
--------- ------- ---------------- -------------------------------------------------- ---------- ---------- -------------------------------------------------- ----------------------------------------
        1       5                4 Lionel Messi                                               93         34 Finesse Shot                                       Free Kick Specialist
        2       6                6 Cristiano Ronaldo                                          91         36 Long Shot Taker                                    Aerial Threat
        3       5                2 Neymar Jr                                                  91         30 Technical Dribbler                                 Acrobat
        4       5                3 Kylian Mbappe                                              91         23 Speed Dribbler                                     Speedster
        5       4                1 Kevin De Bruyne                                            91         30 Playmaker                                          Engine
        6       4                2 Ederson                                                    89         27 Comes for Crosses                                  Long Passer
        7       5                2 Marquinhos                                                 88         27 Leadership                                         Tackler
        8       4                6 Ruben Dias                                                 88         24 Power Header                                       Solid Player
        9       4                5 Raheem Sterling                                            88         26 Clinical Finisher                                  Team Player
       10       8                9 Mehdi Taremi                                               79         29 Strength                                           Flair

10 rows selected.

SQL> EXIT;
Disconnected from Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0
```