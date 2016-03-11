# NWHL FANTASY LEAGUE

##### A fantasy league app built with Java

#### By Brad London, Abbigail Rolling, Daren Schaad, Tyler Suderman

##  Description:
This app was built in four days by Epicodus Java student to simulate a multi-player web app. NWHL fantasy allows a user (General Manager) to create an account, league, and team. Other General Managers can join leagues with teams of their own until the draft starts, at which point the General Managers take turns drafting players from the NWHL 2015/2016 season. After the draft a General Manager can select starters (players whose stats will be taken into consideration for fantasy standings), move through weeks of games (corresponding with weeks of play in the 2015/2016 season), and view player and team standings (created using a formula written by Brad London). This is an Epicodus Java Course final Project.

## Installation Instructions

Clone this repository:
```
$ cd ~/Desktop
$ git clone https://github.com/londonb/nwhl_fantasy_league.git
$ cd nwhl_fantasy_league
```

Open terminal and run Postgres:
```
$ postgres
```

Open a new tab in terminal and create the `nwhl_fantasy` database:
```
$ psql
$ CREATE DATABASE nwhl_fantasy;
$ psql nwhl_fantasy < fantasy.sql
```

Navigate back to the directory where this repository has been cloned and run gradle:
```
$ gradle run
```
## Known Bugs
Although the functionality exists for this app to run from multiple platforms with multiple users, currently the draft and view-standings user flow can only be accessed from a single computer. In this way the project functions as a simulator of an actual fantasy app used during a season in real time.

## Technologies Used

* HTML
* CSS/Bootstrap
* Postgresql
* Java
* Gradle
* Spark
* jUnit
* Velocity
* Fluentlenium

### License

Licensed under the GPL.

Copyright (c) 2016 **Tyler, Abbigail, Daren, Brad**
