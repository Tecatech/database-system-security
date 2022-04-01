-- This is a control file for the national_teams table
LOAD DATA
INFILE 'C:\Users\Admin\Documents\data\Teams.csv'
BADFILE 'C:\app\Admin\product\18.0.0\oradata\XE\Teams.bad'
DISCARDFILE 'C:\app\Admin\product\18.0.0\oradata\XE\Teams.dsc'
INTO TABLE national_teams
APPEND
FIELDS TERMINATED BY ';'
TRAILING NULLCOLS
(
  national_team_id,
  national_team_name,
  national_team_points,
  national_team_association
)