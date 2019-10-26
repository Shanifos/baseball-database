
UPDATE teams 
  SET teamAbbr = 'WAS' 
  WHERE teamAbbr = "WSH";

SELECT startTime, homeScore, AwayScore from games where startTime >= '2019-06-06 00:00:00' and startTime < '2019-06-06 17:00:00';
SELECT * from teams where league = 'NL';