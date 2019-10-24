create database baseball;
USE baseball;
create table teams(
 teamID INT NOT NULL auto_increment,
 teamLocation VARCHAR(255) ,
 teamMascot VARCHAR((255) ,
 teamAbbr VARCHAR((255) ,
 league ENUM('NL','AL'),
 division ENUM('west','east','central'),
 createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
 updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP,
deletedAt DATETIME, 
 PRIMARY KEY(teamID)
 );
 
 
 create table players(
 playerID INT NOT Null auto_increment,
 teamID INT,
 firstName VARCHAR(255),
 lastName VARCHAR(255),
 position ENUM('SP','1B','2B','3B','CF','LF', 'RF','C','SS'),
 throws ENUM('R','L','B'),
 hits ENUM('R','L','B'),
 createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
 updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP,
 deletedAt DATETIME,
PRIMARY KEY(playerID),
FOREIGN KEY(teamID) references teams(teamID)
 );
  
create table games(
gameID INT not null auto_increment,
teamID INT,
startTime timestamp,
homeTeam INT,
awayTeam INT,
homeScore INT,
awayScore INT,
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP,
  deletedAt DATETIME,
PRIMARY KEY(gameID),
FOREIGN KEY(homeTeam) references teams(teamID),
FOREIGN KEY(awayTeam) references teams(teamID)
);

create table hitterStats(
playerID INT NOT NULL,
gameID INT not null,
teamsID INT,
atBats INT default 0,
runs INT default 0,
hits INT default 0,
doubles INT default 0,
triples INT default 0,
homeRuns INT default 0,
runsBattedIn INT default 0,
walks INT default 0,
strikeOut INT default 0,
steals INT default 0,
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP,
deletedAt DATETIME,

PRIMARY KEY(playerID,gameID),
FOREIGN KEY(playerID) references players(playerID),
FOREIGN KEY(gameID) references games(gameID)
 FOREIGN KEY(teamID) references teams(teamID)


);

create table pitcherStats(
playerID INT not null,
gameID INT not null,
 teamsID INT,
wins tinyint default 0,
innerPitched decimal(2,1),
hits INT default 0,
runs int default 0,
earnedRuns INT default 0,
strikeOuts INT default 0,
walks INT default 0,
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP,
deletedAt DATETIME,
PRIMARY KEY(playerID,gameID),
FOREIGN KEY(playerID) references players(playerID),
FOREIGN KEY(gameID) references games(gameID)
 FOREIGN KEY(teamID) references teams(teamID)

);

