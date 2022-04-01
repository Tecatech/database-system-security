-- This is a control file for the players table
LOAD DATA
INFILE 'C:\Users\Admin\Documents\data\Players.csv'
BADFILE 'C:\app\Admin\product\18.0.0\oradata\XE\Players.bad'
DISCARDFILE 'C:\app\Admin\product\18.0.0\oradata\XE\Players.dsc'
INTO TABLE players
APPEND
FIELDS TERMINATED BY ';'
TRAILING NULLCOLS
(
  player_id,
  club_id,
  national_team_id,
  player_name,
  player_ovr,
  player_age,
  player_trait,
  player_speciality
)