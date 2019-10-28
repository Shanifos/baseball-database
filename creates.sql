create database baseball;
USE baseball;
create table teams(
 teamID INT NOT NULL auto_increment,
 teamLocation varchar(255) ,
 teamMascot varchar(255) ,
 teamAbbr varchar(255) ,
 league enum('NL','AL'),
 division enum('west','east','central'),
 createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
 updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
deletedAt DATETIME, 
 primary key(teamID)
 );
 
 
 create table players(
 playerID INT NOT Null auto_increment,
 teamID int,
 firstName VARCHAR(255),
 lastName VARCHAR(255),
 position ENUM('SP','1B','2B','3B','CF','LF', 'RF','C','SS'),
 throws ENUM('R','L','B'),
 hits ENUM('R','L','B'),
 createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
 updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
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
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ,
  deletedAt DATETIME,
PRIMARY KEY(gameID),
FOREIGN KEY(homeTeam) references teams(teamID),
FOREIGN KEY(awayTeam) references teams(teamID)
);

create table hitterStats(
playerID INT NOT NULL,
gameID int not null,
atBats int default 0,
runs int default 0,
hits int default 0,
doubles int default 0,
triples int default 0,
homeRuns int default 0,
runsBattedIn int default 0,
walks int default 0,
strikeOut int default 0,
steals int default 0,
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
deletedAt DATETIME,

primary key(playerID,gameID),
foreign key(playerID) references players(playerID),
foreign key(gameID) references games(gameID)

);

create table pitcherStats(
playerID int not null,
gameID int not null,
wins int default 0,
innerPitched int default 0,
hits int default 0,
runs int default 0,
earnedRuns int default 0,
strikeOuts int default 0,
walks int default 0,
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
deletedAt DATETIME,
primary key(playerID,gameID),
foreign key(playerID) references players(playerID),
foreign key(gameID) references games(gameID)
);

