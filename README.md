Examination of Referee Tendencies and Biases in the National Football League
================
Tom Bliss, Connor Daly, Jacob Klein, Patrick Lewis
December 2018

The National Football League
----------------------------

The National Football League (NFL) is arguably the most popular professional sports association in the United States. The NFL consists of 32 teams, and each team plays 16 games per season - this figure does not include playoff games, for which only a select subset of the 32 teams qualify. Every game is divided into four quarters of length 15 minutes, and each team's objective is to score more points than their opponent. Each team wants to defend their own end zone while attacking their opponent's end zone. Points in the NFL are awarded for touchdowns, extra points, safeties, and field goals. Detailed knowledge of football scoring is not particularly crucial for the purposes of comprehending the following analysis, but it may prove helpful in specific discussions.

Every NFL game is watched by a group of seven officials, which includes one referee, one umpire, and five line judges. These officials are responsible for watching and arbitrating plays, and deeming any illegal plays as penalties. When a penalty is called by an official, the penalty is enforced by moving the penalized team in their adverse direction by a pre-specified number of yards - common penalties are enforced with 5-, 10-, and 15- yard penalties.

The purpose of this project is to examine tendencies, biases, and patterns in penalties called by officials. It is important to note that we only consider calls made by referees in this analysis, since referees are most responsible for the play of game and are the appointed head official for their respective games.

Data Collection
---------------

Data for this analysis was collected from the past five seasons, beginning with the 2013-2014 NFL season. It should be noted that this analysis was conducted during the 2018-2019 NFL season. Thus we have included all data available for the current season, but this season was excluded in any analyses in which penalties were compared over entire seasons, since all data for the season will not be available until February 2019.

We downloaded play-by-play data from NFLsavant.com: <http://www.nflsavant.com/about.php?fbclid=IwAR3c8IZngQd0eE_0jp3Z401TdZXSBa8E-qEAX8J7J4uC3--CisVr7ZQfjEQ> From this site, we downloaded CSV files from seasons beginning in 2013 through 2018. These six CSV files begin with "pbp" and are located within the "/data" folder of this repository.

We then downloaded referee game data from Pro-Football-Reference: <https://www.pro-football-reference.com/officials/index.htm?fbclid=IwAR387n92do_jrcbwKAjKNR2Y_GSGpcnWMGbCbJ7Pwmx7AdpZQRSbmglfSfU>

As noted above, because there are hundreds of referees, linesmen, side judges, and line judges employed by the NFL, for the purposes of this analysis we focused only on referees. We also excluded any referees who have not been employed by the NFL for a sufficient amount of time (and thus do not yield sufficient data points); all referees in our dataset have reffed over 50 games over the span of the 2013 NFL Season through week 9 of the 2018 NFL Season.

A CSV file is available in the "/data" subfolder for each of the 17 referees we included in the analysis.

Also included in the "/data" subfolder is a file called "abbreviations.csv". This file is an aid in joining the play-by-play data to the referee data, and includes a mapping of team names to team abbreviations. For example, this file maps team name "Arizona Cardinals" to team abbreviation "ARI".

Data Processing
---------------

To simplify the data, we grouped certain penalty types together.  Here is a table highlighting how each penalty was universally grouped with other penalties.

| Grouping Term    |  Penalty Types Included |
|------------------|-----------------------|
| Delay of Game | Delay of Game, Defensive Delay of Game, Delay of Kickoff |
| Illegal Block| Chop Block, Clipping, Illegal Blindside Block, Illegal Block Above the Wasste, Illegal Crackback, Illegal Peelback, Illegal Wedge, Offensive Holding, Low Block |
| Illegal Formation | Illegal Formation, Illegal Motion, Illegal Shift |
| Illegal Tackle | Face Mask (15 Yards), Horse Collar Tackle, Lowering the Head to Initiate Contact |
| Illegal Use of Hands | Illegal Use of Hands
| Offside | Defensive Offside, Encroachment, False Start, Neutral Zone Infraction, Offside, Offensive Offside |
| Pass Interference | Defensive Holding, Defensive Pass Interference, Illegal Contact, Offensive Pass Interference |
| Roughing a Protected Player | Roughing the Kicker, Roughing the Passer, Running Into the Kicker |
| Too Many Men on the Field | Defensive 12 On-Field, Defensive Too Many Men on the Field, Illegal Substitution, Offensive 12 On-Field, Offensive Too Many Men on Field |
| Unsportsmanlike Conduct | Disqualification, Personal Foul, Taunting, Unnecessary Roughness, Unsportsmanlike Conduct |
| Other | <ul><li>Ineligible Player Downfield: Ineligible Downfield Kick, Ineligible Downfield Pass</li><li>Fair Catch Interference: Fair Catch Interference, Kick Catch Interference, Interference with Opportunity to Catch</li><li>Illegal Action to Block a Field Goal: Leverage, Leaping</li><li>Illegal Kickoff: Kickoff Out of Bounds, Short Free Kick</li><li>Illegal Player Out of Bounds: Illegal Touch Kick, Illegal Touch Pass, Player Out of Bounds on Kick, Player Out of Bounds on Punt</li></ul>



