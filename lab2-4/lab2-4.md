```sql
PS C:\Users\Admin> sqlplus system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1"

SQL*Plus: Release 18.0.0.0.0 - Production on Sat Jan 7 03:45:52 2023
Version 18.4.0.0.0

Copyright (c) 1982, 2018, Oracle.  All rights reserved.

Last Successful login time: Sat Jan 07 2023 03:45:13 +03:00

Connected to:
Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0

SQL> CREATE USER tecatech_lab2_4
  2      IDENTIFIED BY gamma
  3      DEFAULT TABLESPACE users
  4      TEMPORARY TABLESPACE temp
  5      QUOTA 100M ON users;

User created.

SQL> GRANT
  2      CREATE SESSION,
  3      CREATE TABLE
  4  TO tecatech_lab2_4;

Grant succeeded.

SQL> CONNECT tecatech_lab2_4/gamma@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> CREATE TABLE timestamps(
  2      timestamp_id NUMBER(4, 0) NOT NULL,
  3      day NUMBER(2, 0),
  4      month NUMBER(2, 0),
  5      year NUMBER(4, 0),
  6      PRIMARY KEY (timestamp_id)
  7  );

Table created.

SQL> GRANT
  2      SELECT,
  3      INSERT,
  4      UPDATE,
  5      DELETE
  6  ON timestamps
  7  TO tecatech_lab1_4;

Grant succeeded.

SQL> CONNECT tecatech_lab1_4/alpha@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> INSERT ALL
  2      INTO tecatech_lab2_4.timestamps(timestamp_id, day, month, year) VALUES (1, 10, 6, 2022)
  3      INTO tecatech_lab2_4.timestamps(timestamp_id, day, month, year) VALUES (2, 31, 8, 2022)
  4      INTO tecatech_lab2_4.timestamps(timestamp_id, day, month, year) VALUES (3, 1, 1, 2023)
  5      INTO tecatech_lab2_4.timestamps(timestamp_id, day, month, year) VALUES (4, 31, 1, 2023)
  6      INTO tecatech_lab2_4.timestamps(timestamp_id, day, month, year) VALUES (5, 10, 6, 2023)
  7  SELECT * FROM dual;

5 rows created.

SQL> SELECT * FROM tecatech_lab2_4.timestamps;

TIMESTAMP_ID        DAY      MONTH       YEAR
------------ ---------- ---------- ----------
           1         10          6       2022
           2         31          8       2022
           3          1          1       2023
           4         31          1       2023
           5         10          6       2023

SQL> DROP TABLE tecatech_lab2_4.timestamps;
DROP TABLE tecatech_lab2_4.timestamps
                           *
ERROR at line 1:
ORA-01031: insufficient privileges

SQL> CONNECT system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> CREATE USER manager IDENTIFIED BY default;

User created.

SQL> GRANT CREATE SESSION TO manager;

Grant succeeded.

SQL> ALTER USER tecatech_lab2_4 GRANT CONNECT THROUGH manager;

User altered.

SQL> CONNECT manager[tecatech_lab2_4]/default@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> SELECT * FROM timestamps;

TIMESTAMP_ID        DAY      MONTH       YEAR
------------ ---------- ---------- ----------
           1         10          6       2022
           2         31          8       2022
           3          1          1       2023
           4         31          1       2023
           5         10          6       2023

SQL> CONNECT system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> ALTER USER tecatech_lab2_4 ACCOUNT LOCK;

User altered.

SQL> CONNECT manager[tecatech_lab2_4]/default@"DESKTOP-UG7SO1F:1521/xepdb1";
ERROR:
ORA-28000: the account is locked.

Warning: You are no longer connected to ORACLE.
SQL> CONNECT system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> DROP USER tecatech_lab2_4 CASCADE;

User dropped.

SQL> CREATE USER tecatech_lab2_4
  2      NO AUTHENTICATION
  3      DEFAULT TABLESPACE users
  4      TEMPORARY TABLESPACE temp
  5      QUOTA 100M ON users;

User created.

SQL> GRANT
  2      CREATE SESSION,
  3      CREATE TABLE
  4  TO tecatech_lab2_4;

Grant succeeded.

SQL> ALTER USER tecatech_lab2_4 GRANT CONNECT THROUGH manager;

User altered.

SQL> COLUMN username FORMAT A32;
SQL> COLUMN account_status FORMAT A16;
SQL> COLUMN authentication_type FORMAT A32;
SQL> SELECT
  2      username,
  3      account_status,
  4      authentication_type
  5  FROM dba_users
  6  WHERE username = 'TECATECH_LAB2_4';

USERNAME                         ACCOUNT_STATUS   AUTHENTICATION_TYPE
-------------------------------- ---------------- --------------------------------
TECATECH_LAB2_4                  OPEN             NONE

SQL> CONNECT tecatech_lab2_4/gamma@"DESKTOP-UG7SO1F:1521/xepdb1";
ERROR:
ORA-01017: invalid username/password; logon denied.

Warning: You are no longer connected to ORACLE.
SQL> CONNECT manager[tecatech_lab2_4]/default@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> CREATE TABLE timestamps(
  2      timestamp_id NUMBER(4, 0) NOT NULL,
  3      day NUMBER(2, 0),
  4      month NUMBER(2, 0),
  5      year NUMBER(4, 0),
  6      PRIMARY KEY (timestamp_id)
  7  );

Table created.

SQL> GRANT
  2      SELECT,
  3      INSERT,
  4      UPDATE,
  5      DELETE
  6  ON timestamps
  7  TO tecatech_lab1_4;

Grant succeeded.

SQL> CONNECT tecatech_lab1_4/alpha@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> INSERT ALL
  2      INTO tecatech_lab2_4.timestamps(timestamp_id, day, month, year) VALUES (1, 10, 6, 2022)
  3      INTO tecatech_lab2_4.timestamps(timestamp_id, day, month, year) VALUES (2, 31, 8, 2022)
  4      INTO tecatech_lab2_4.timestamps(timestamp_id, day, month, year) VALUES (3, 1, 1, 2023)
  5      INTO tecatech_lab2_4.timestamps(timestamp_id, day, month, year) VALUES (4, 31, 1, 2023)
  6      INTO tecatech_lab2_4.timestamps(timestamp_id, day, month, year) VALUES (5, 10, 6, 2023)
  7  SELECT * FROM dual;

5 rows created.

SQL> SELECT * FROM tecatech_lab2_4.timestamps;

TIMESTAMP_ID        DAY      MONTH       YEAR
------------ ---------- ---------- ----------
           1         10          6       2022
           2         31          8       2022
           3          1          1       2023
           4         31          1       2023
           5         10          6       2023

SQL> DROP TABLE tecatech_lab2_4.timestamps;
DROP TABLE tecatech_lab2_4.timestamps
                           *
ERROR at line 1:
ORA-01031: insufficient privileges

SQL> CONNECT manager[tecatech_lab2_4]/default@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> SELECT * FROM timestamps;

TIMESTAMP_ID        DAY      MONTH       YEAR
------------ ---------- ---------- ----------
           1         10          6       2022
           2         31          8       2022
           3          1          1       2023
           4         31          1       2023
           5         10          6       2023

SQL> CONNECT system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> ALTER USER tecatech_lab2_4 ACCOUNT LOCK;

User altered.

SQL> CONNECT manager[tecatech_lab2_4]/default@"DESKTOP-UG7SO1F:1521/xepdb1";
ERROR:
ORA-28000: the account is locked.

Warning: You are no longer connected to ORACLE.
SQL> CONNECT system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> DROP USER tecatech_lab2_4 CASCADE;

User dropped.

SQL> CREATE USER tecatech_lab2_4
  2      IDENTIFIED BY gamma
  3      DEFAULT TABLESPACE users
  4      TEMPORARY TABLESPACE temp
  5      QUOTA 100M ON users;

User created.

SQL> GRANT
  2      CREATE SESSION,
  3      CREATE TABLE
  4  TO tecatech_lab2_4;

Grant succeeded.

SQL> CONNECT tecatech_lab2_4/gamma@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> CREATE TABLE timestamps(
  2      timestamp_id NUMBER(4, 0) NOT NULL,
  3      day NUMBER(2, 0),
  4      month NUMBER(2, 0),
  5      year NUMBER(4, 0),
  6      PRIMARY KEY (timestamp_id)
  7  );

Table created.

SQL> GRANT
  2      SELECT,
  3      INSERT,
  4      UPDATE,
  5      DELETE
  6  ON timestamps
  7  TO tecatech_lab1_4;

Grant succeeded.

SQL> CONNECT tecatech_lab1_4/alpha@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> INSERT ALL
  2      INTO tecatech_lab2_4.timestamps(timestamp_id, day, month, year) VALUES (1, 10, 6, 2022)
  3      INTO tecatech_lab2_4.timestamps(timestamp_id, day, month, year) VALUES (2, 31, 8, 2022)
  4      INTO tecatech_lab2_4.timestamps(timestamp_id, day, month, year) VALUES (3, 1, 1, 2023)
  5      INTO tecatech_lab2_4.timestamps(timestamp_id, day, month, year) VALUES (4, 31, 1, 2023)
  6      INTO tecatech_lab2_4.timestamps(timestamp_id, day, month, year) VALUES (5, 10, 6, 2023)
  7  SELECT * FROM dual;

5 rows created.

SQL> SELECT * FROM tecatech_lab2_4.timestamps;

TIMESTAMP_ID        DAY      MONTH       YEAR
------------ ---------- ---------- ----------
           1         10          6       2022
           2         31          8       2022
           3          1          1       2023
           4         31          1       2023
           5         10          6       2023

SQL> DROP TABLE tecatech_lab2_4.timestamps;
DROP TABLE tecatech_lab2_4.timestamps
                           *
ERROR at line 1:
ORA-01031: insufficient privileges

SQL> CONNECT system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> SELECT
  2      username,
  3      sysdba,
  4      sysoper,
  5      sysasm,
  6      sysbackup,
  7      sysdg,
  8      syskm
  9  FROM v$pwfile_users
 10  WHERE username = 'TECATECH_LAB2_4';

no rows selected

SQL> ALTER USER tecatech_lab2_4 NO AUTHENTICATION;

User altered.

SQL> ALTER USER tecatech_lab2_4 GRANT CONNECT THROUGH manager;

User altered.

SQL> COLUMN username FORMAT A32;
SQL> COLUMN account_status FORMAT A16;
SQL> COLUMN authentication_type FORMAT A32;
SQL> SELECT
  2      username,
  3      account_status,
  4      authentication_type
  5  FROM dba_users
  6  WHERE username = 'TECATECH_LAB2_4';

USERNAME                         ACCOUNT_STATUS   AUTHENTICATION_TYPE
-------------------------------- ---------------- --------------------------------
TECATECH_LAB2_4                  OPEN             NONE

SQL> CONNECT tecatech_lab2_4/gamma@"DESKTOP-UG7SO1F:1521/xepdb1";
ERROR:
ORA-01017: invalid username/password; logon denied.

Warning: You are no longer connected to ORACLE.
SQL> CONNECT manager[tecatech_lab2_4]/default@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> SELECT * FROM timestamps;

TIMESTAMP_ID        DAY      MONTH       YEAR
------------ ---------- ---------- ----------
           1         10          6       2022
           2         31          8       2022
           3          1          1       2023
           4         31          1       2023
           5         10          6       2023

SQL> CONNECT system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
SQL> ALTER USER tecatech_lab2_4 ACCOUNT LOCK;

User altered.

SQL> CONNECT manager[tecatech_lab2_4]/default@"DESKTOP-UG7SO1F:1521/xepdb1";
ERROR:
ORA-28000: the account is locked.

Warning: You are no longer connected to ORACLE.
SQL> EXIT;
Disconnected from Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0
PS C:\Users\Admin> type C:\app\Admin\product\18.0.0\dbhomeXE\network\admin\sqlnet.ora
# sqlnet.ora Network Configuration File: C:\app\Admin\product\18.0.0\dbhomeXE\NETWORK\ADMIN\sqlnet.ora
# Generated by Oracle configuration tools.

# This file is actually generated by netca. But if customers choose to
# install "Software Only", this file wont exist and without the native
# authentication, they will not be able to connect to the database on NT.

SQLNET.AUTHENTICATION_SERVICES= (NTS)

NAMES.DIRECTORY_PATH= (TNSNAMES, EZCONNECT)

PS C:\Users\Admin> sqlplus system/tecatech@"DESKTOP-UG7SO1F:1521/xepdb1"

SQL*Plus: Release 18.0.0.0.0 - Production on Sat Jan 7 18:22:48 2023
Version 18.4.0.0.0

Copyright (c) 1982, 2018, Oracle.  All rights reserved.

Last Successful login time: Sat Jan 07 2023 17:48:25 +03:00

Connected to:
Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0

SQL> SHOW con_name;

CON_NAME
------------------------------
XEPDB1
SQL> SHOW PARAMETER os_authent_prefix;

NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
os_authent_prefix                    string      OPS$
SQL> CREATE USER "OPS$DESKTOP-UG7SO1F\TECATECH_LAB2_4" IDENTIFIED EXTERNALLY;

User created.

SQL> GRANT CREATE SESSION TO "OPS$DESKTOP-UG7SO1F\TECATECH_LAB2_4";

Grant succeeded.

SQL> EXIT;
Disconnected from Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0
PS C:\Users\TECATECH_LAB2_4> sqlplus /@"DESKTOP-UG7SO1F:1521/xepdb1"

SQL*Plus: Release 18.0.0.0.0 - Production on Sat Jan 7 18:50:04 2023
Version 18.4.0.0.0

Copyright (c) 1982, 2018, Oracle.  All rights reserved.

Connected to:
Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0

SQL> SHOW USER;
USER is "OPS$DESKTOP-UG7SO1F\TECATECH_LAB2_4"
SQL> EXIT;
Disconnected from Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0
PS C:\Users\Admin> sqlplus administrator/default@"DESKTOP-UG7SO1F:1521/xepdb1"

SQL*Plus: Release 18.0.0.0.0 - Production on Sat Jan 7 20:23:49 2023
Version 18.4.0.0.0

Copyright (c) 1982, 2018, Oracle.  All rights reserved.

Last Successful login time: Fri Dec 30 2022 03:57:23 +03:00

Connected to:
Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0

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
Gabriel Jesus                                      Arsenal                                            England                                                              84         25
Enzo Fernandez                                     SL Benfica                                         Argentina                                                            80         21

10 rows selected.

SQL> GRANT CREATE SESSION TO manager;

Grant succeeded.

SQL> CREATE ROLE app_manager_role IDENTIFIED BY password;

Role created.

SQL> GRANT SELECT ON administrator.career_mode TO app_manager_role;

Grant succeeded.

SQL> GRANT app_manager_role TO manager;

Grant succeeded.

SQL> CONNECT manager/default@"DESKTOP-UG7SO1F:1521/xepdb1";
Connected.
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
Gabriel Jesus                                      Arsenal                                            England                                                              84         25
Enzo Fernandez                                     SL Benfica                                         Argentina                                                            80         21

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
SELECT * FROM administrator.clubs
                            *
ERROR at line 1:
ORA-00942: table or view does not exist

SQL> SELECT * FROM administrator.players;
SELECT * FROM administrator.players
                            *
ERROR at line 1:
ORA-00942: table or view does not exist

SQL> EXIT;
Disconnected from Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0
```