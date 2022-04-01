-- This is a control file for the clubs table
LOAD DATA
INFILE 'C:\Users\Admin\Documents\data\Clubs.csv'
BADFILE 'C:\app\Admin\product\18.0.0\oradata\XE\Clubs.bad'
DISCARDFILE 'C:\app\Admin\product\18.0.0\oradata\XE\Clubs.dsc'
INTO TABLE clubs
APPEND
FIELDS TERMINATED BY ';'
TRAILING NULLCOLS
(
  club_id,
  league_id,
  club_name,
  club_stadium
)