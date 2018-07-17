# MilSimCreator
Web App for setting up Military Symulations (ASG type game-play)

## Description
MilSimCreator is a web application created for ASG players willing to take part in legal, ogranized ASG game-play with plot
inspired by real-life operations and related to previously carried out MilSims.

Main purposes:
- automate and make easier to organize MilSim gameplay;
- provide control over data of large amount of MilSim participants;
- provide efficient delegation of tasks for gameplay administrator team;
- enable ASG teams to gather in larger groups in one place and plan strategies during setting up the gameplay;
- management for position of each squad member.

Thanks to this app ASG teams can collect an appropriate equipment within given MilSim regulations,
organize teams, headquarters staff and each squad equipment, main duties, tasks as well as areas of operation.

## Specification
**Elements:**
- users
- tweets
- gamePlay
- mainMissions
- additionalMissions
- conflictSides
- rulesOfEngagement
- regulations
- limitations

**Users:**

Following fields:
```bash
- login (unique)
- password (hashed)
- email (unique)
- groupMember
- priviliges (enum: player, leader, administrator, organiser)
- primaryWeapon (enum: assault, support, sniper)
- backupWeapon (enum: assault, support, sniper)
- created (sql Timestamp, for administrator and organisator only)
- active (boolean);
```
- [x] User: validation
- [x] User: log in & log out
- [x] User: registration
- [ ] User: when registering new user, if field groupMember is filled, new record should be saved in related to groupMember db table for $
- [ ] User: timeline of availability for user with priviliges Organizator and Administrator for managing ogranizator stuff to support task execution

**Tweets:**

Following fields:
```bash
- text (requred)
- user
- created (sql Timestamp)
```
- [x] Tweet: validation
- [x] Tweet: delete function avaliable only for tweet author
- [x] Tweet: separate page for viewing user's tweets
- [ ] Tweet: comments for each tweet

**GamePlay**

Following fields:
```bash
- title
- storyline
- description
- location (map handling)
- regulations (may be many, relation to regulations entity)
- rulesOfEngagement(may be many, relaton to rulesOfEngagement entity)
- conflictSides (may be many, relation to conflictSides entity)
- mainMissions (may be many, relation to mainMissions entity)
- additionalMissions (may be many, relation to additionalMissions)
```

**Additional Missions:**

Following fields:
```bash
- milsim_id (may be many, assigned to a specific milsim)
- description (String)
- timeline (String)
- assignation
```

## Views
View | Characteristics
---- | ---------------
login.jsp | [x] Login and password fields<br/> [x] Link to registration page
register.jsp | [x] Basic user details available for user to register<br/> [x]At create set user privilites as 'USER'<br/>[x] At create set user as 'ACTIVE'
HomePage.jsp | [x] Table of user's team members<br/>[ ] Table of users in corresponding side of conflict<br/>[ ] MilSim info<br/>[ ] Tweets with comments<br/>[ ] Missions list with content<br/>[ ] Table with formed division<br/>[ ] Links to milsim details
user/add.jsp | [x] Basic user details available for users and administrator<br/>[x] Ability to ban user only for administrator<br/>[ ] Ability to add/change privilites to user only for administrator
user/edit.jsp | [x] Basic user details available for users and administrator<br/>[x] Link to separate page for change password only, available for user and administrator<br/>[ ] Ability to ban user only for administrator<br/>[ ] Ability to add/change priviliges 
to user only for administrator
user/editPass.jsp | [x] OldPassword confirmation<br/>[x] NewPassword confirmation
user/list.jsp | [x] All entity fields available as columns<br/>[x] Available for administrator<br/>[x] Change password and delete user only for administrator
user/tweets.jsp | [x] List of user tweets
admin/adminPanel.jsp | [ ] Ability to create new milsim<br/>[ ] List of organizator members<br/>[ ] List of milsims with status ended/planned<br/>[ ] Ability to create new missions<br/>[ ] Ability to assing member to take care of mission<br/>[ ] Users list

## Functions
```bash
1. Enabled login (login, register, change password)
2. Different features available depending on user priviliges
```

## Technologies

> Java JSP

> Java JSTL

> EL

> Maven

> MySQL

> Spring MVC

> Spring Data

> Hibernate Core

> Hibernate Validator

> Spring Security

## To do in future

- [ ] HTML/CSS + javaScrpt customization to webPages
- [ ] JSP/HTML: cover with bootstrap
- [ ] JSP/HTML: translation files for all messages to be easily switchable for different languages
- [ ] Switch between different languages for all views
- [ ] Password feature: adding requirement to password complexity
- [ ] Registration feature: enable auto login after registration

