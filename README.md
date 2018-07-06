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
** Elements: **
- users
- gamePlay
- mainMissions
- additionalMissions
- conflictSides
- rulesOfEngagement
- regulations
- limitations

** Users: **
Following fields:
```bash
- login (unique)
- password (hashed)
- email (unique)
- groupMember
- priviliges (enum: player, leader, administrator, organiser)
```
** GamePlay **
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


