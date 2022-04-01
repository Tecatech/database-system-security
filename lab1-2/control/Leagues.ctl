-- This is a control file for the leagues table
LOAD DATA
INFILE 'C:\Users\Admin\Documents\data\Leagues.csv'
BADFILE 'C:\app\Admin\product\18.0.0\oradata\XE\Leagues.bad'
DISCARDFILE 'C:\app\Admin\product\18.0.0\oradata\XE\Leagues.dsc'
INTO TABLE leagues
APPEND
FIELDS TERMINATED BY ';'
TRAILING NULLCOLS
(
  league_id,
  national_team_id,
  league_name
)