-- This is a control file for the sponsors table
LOAD DATA
INFILE 'C:\Users\Admin\Documents\data\Sponsors.csv'
BADFILE 'C:\app\Admin\product\18.0.0\oradata\XE\Sponsors.bad'
DISCARDFILE 'C:\app\Admin\product\18.0.0\oradata\XE\Sponsors.dsc'
INTO TABLE sponsors
APPEND
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  sponsor_id,
  national_team_id,
  player_id,
  club_id,
  sponsor_name
)