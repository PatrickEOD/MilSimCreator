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

INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-12 21:12:43", "Test tweet 1 Janek", "1");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-12 21:13:43", "Test tweet 2 Janek", "1");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-12 21:14:43", "Test tweet 3 Janek", "1");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-12 21:15:43", "Test tweet 4 Janek", "1");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-14 21:16:43", "Test tweet 5 Janek", "1");

INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-13 21:12:43", "Test tweet 1 Szoni", "2");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-13 21:12:55", "Test tweet 2 Szoni", "2");

INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-13 21:12:55", "Test tweet 1 Medyk", "3");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-14 07:44:00", "Test tweet 2 Medyk", "3");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-15 19:18:34", "Test tweet 3 Medyk", "3");

INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-12 21:11:00", "Test tweet 1 Pabieda", "4");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-14 13:00:40", "Test tweet 2 Pabieda", "4");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-16 10:13:12", "Test tweet 3 Pabieda", "4");

INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-12 21:11:00", "Test tweet 1 Milus", "5");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-13 13:55:40", "Test tweet 2 Milus", "5");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-13 21:55:15", "Test tweet 3 Milus", "5");

INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-12 21:11:00", "Test tweet 1 SPAJDA", "6");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-12 21:12:40", "Test tweet 2 SPAJDA", "6");
INSERT INTO tweets (created, text, user_id) VALUES ("2013-04-13 12:13:12", "Test tweet 3 SPAJDA", "6");

INSERT INTO comments (created, text, tweet_id, user_id) VALUES ("2005-04-16 23:00:00", "test comment 1 Janek", "13", "1")
INSERT INTO comments (created, text, tweet_id, user_id) VALUES ("2005-04-17 20:12:43", "test comment 2 Janek", "13", "1")


