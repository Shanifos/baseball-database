-- * List all the players for the Red Sox (Full Name, Position, Hits, Throws, Team Abbreviation)
SELECT CONCAT(p.firstName,' ', p.lastName) as 'Full Name', p.position as Position, p.hits as Hits,
 p.throws as Throws,  t.abbreviation  as 'Team Abbreviation'                                                   
from players p join teams t on p.currentTeamId = t.id and mascot = 'Red Sox';
-- * Who are the top 5 home run hitters for games played on June 6th? (Full Name, Position, 
-- Team Abbreviation, HomeRuns)
SELECT CONCAT(p.firstName,' ', p.lastName) as 'Full Name', p.position as Position,
 t.abbreviation  as 'Team Abbreviation' , h.homeRuns  as 'Home Runs'                                          
from players p join teams t on p.currentTeamId = t.id  join hittingStats h on h.playerId = p.id
join games g on g.id = h.gameId  where g.startTime like '2019-06-06%' order by h.homeRuns desc, g.startTime desc limit 5;

-- * Who are the top 5 pitchers in ERA for games played on June 6th who have at least 4 innings 
-- pitched in that game? (Full Name, Team Abbreviation, ERA)
SELECT CONCAT(p.firstName,' ', p.lastName) as FullName, t.abbreviation as 'Team Abbreviation', 
(ps.earnedRuns / ps.inningsPitched) as ERA 
from players p join teams t on p.currentTeamId = t.id  join pitchingStats ps on ps.playerId = p.id
join games g on g.id = ps.gameId where ps.inningsPitched >= 4 and  g.startTime like '2019-06-06%' 
order by  (ps.earnedRuns / ps.inningsPitched) , g.startTime desc limit 5;
-- * Which player hit the most doubles on June 6th? (Full Name, Position, Team Abbreviation, 
-- Doubles, Game Start Time, Home Team, Away Team)
SELECT CONCAT(p.firstName,' ', p.lastName) as 'Full Name', p.position as Position,
t.abbreviation as 'Team Abbreviation',  h.doubles as Doubles, g.startTime as 'Start Time' ,
(SELECT t.abbreviation FROM teams t WHERE t.id = g.homeTeamId) AS 'Home Team',
(SELECT t.abbreviation FROM teams t WHERE t.id = g.awayTeamId) AS 'Away Team'                                      
from players p join teams t on p.currentTeamId = t.id join hittingStats h on h.playerId = p.id join games g on g.id = h.gameId 
ORDER BY Doubles desc , g.startTime desc limit 1;







