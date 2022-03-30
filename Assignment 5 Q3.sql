CREATE USER IF NOT EXISTS falcon@localhost IDENTIFIED BY "cap" PASSWORD EXPIRE INTERVAL 60 DAY;
CREATE USER IF NOT EXISTS bucky_barnes@localhost IDENTIFIED BY "longing_rusted_seventeen" PASSWORD EXPIRE INTERVAL 60 DAY;
CREATE USER IF NOT EXISTS john_walker@localhost IDENTIFIED BY "battlestar" PASSWORD EXPIRE INTERVAL 60 DAY;
CREATE USER IF NOT EXISTS flag_smasher@localhost IDENTIFIED BY "Karli" PASSWORD EXPIRE INTERVAL 60 DAY;
RENAME USER falcon@localhost TO captain_america@localhost;
SET PASSWORD FOR captain_america@localhost = "redwing";
DROP USER IF EXISTS john_walker@localhost;