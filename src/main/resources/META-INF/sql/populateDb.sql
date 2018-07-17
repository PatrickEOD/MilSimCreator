INSERT INTO users (login, password, email, primaryWeapon, backupWeapon, groupMember, created, active) VALUES ("Janek", "$2a$10$wWh7p81HHTDgAurUosNBOuJS/H82OvdjG0gAQsOosOJz2ogonmnyi", "janek.kos@wp.pl", "ASSAULT", "ASSAULT", "PRETORIANS", "2005-04-12 21:12:43", true);
INSERT INTO User_priviliges (User_id, priviliges) VALUES (1, "ADMINISTRATOR")

INSERT INTO users (login, password, email, primaryWeapon, backupWeapon, groupMember, created, active) VALUES ("Szoni", "$2a$10$wWh7p81HHTDgAurUosNBOuJS/H82OvdjG0gAQsOosOJz2ogonmnyi", "szoni.tank@wp.pl", "ASSAULT", "ASSAULT", "PRETORIANS", "2005-05-10 12:08:11", true);
INSERT INTO User_priviliges (User_id, priviliges) VALUES (2, "ORGANISATOR")
INSERT INTO users (login, password, email, primaryWeapon, backupWeapon, groupMember, created, active) VALUES ("Medyk", "$2a$10$wWh7p81HHTDgAurUosNBOuJS/H82OvdjG0gAQsOosOJz2ogonmnyi", "medyk.dentysta@wp.pl", "ASSAULT", "SUPPORT", "PRETORIANS", "2001-11-02 08:09:00", true);
INSERT INTO User_priviliges (User_id, priviliges) VALUES (3, "ORGANISATOR")

INSERT INTO users (login, password, email, primaryWeapon, backupWeapon, groupMember, created, active) VALUES ("Pabieda", "$2a$10$wWh7p81HHTDgAurUosNBOuJS/H82OvdjG0gAQsOosOJz2ogonmnyi", "luska@wp.pl", "ASSAULT", "SUPPORT", "OSA", "2012-06-30 17:35:21", true);
INSERT INTO User_priviliges (User_id, priviliges) VALUES (4, "USER")
INSERT INTO users (login, password, email, primaryWeapon, backupWeapon, groupMember, created, active) VALUES ("Milus", "$2a$10$wWh7p81HHTDgAurUosNBOuJS/H82OvdjG0gAQsOosOJz2ogonmnyi", "milus@wp.pl", "SUPPORT", "ASSAULT", "ASGWawa", "2012-05-27 18:30:37", true);
INSERT INTO User_priviliges (User_id, priviliges) VALUES (5, "USER")
INSERT INTO users (login, password, email, primaryWeapon, backupWeapon, groupMember, created, active) VALUES ("SPAJDA", "$2a$10$wWh7p81HHTDgAurUosNBOuJS/H82OvdjG0gAQsOosOJz2ogonmnyi", "SPAIDA@wp.pl", "SNIPER", "SUPPORT", "OSA", "2012-06-30 17:35:21", true);
INSERT INTO User_priviliges (User_id, priviliges) VALUES (6, "USER")

INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-12 21:12:43", "Test tweet 1", "1");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-12 21:13:43", "Test tweet 2", "1");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-12 21:14:43", "Test tweet 3", "1");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-12 21:15:43", "Test tweet 4", "1");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-12 21:16:43", "Test tweet 5", "1");


