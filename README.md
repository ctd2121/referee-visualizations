Examination of Referee Tendencies and Biases in the National Football League
================
Tom Bliss, Connor Daly, Jacob Klein, Patrick Lewis
December 2018

Introduction
------------

The National Football League (NFL) is arguably the most popular professional sports association in the United States. The NFL consists of 32 teams, and each team plays 16 games per season - this figure does not include playoff games, for which only a select subset of the 32 teams qualify. Every game is divided into four quarters of length 15 minutes, and each team's objective is to score more points than their opponent. Each team wants to defend their own end zone while attacking their opponent's end zone. Points in the NFL are awarded for touchdowns, extra points, safeties, and field goals. Detailed knowledge of football scoring is not particularly crucial for the purposes of comprehending the following analysis, but it may prove helpful in specific discussions.

Every NFL game is watched by a group of seven officials, which includes one referee, one umpire, and five line judges. These officials are responsible for watching and arbitrating plays, and deeming any illegal plays as penalties. When a penalty is called by an official, the penalty is enforced by moving the penalized team in their adverse direction by a pre-specified number of yards - common penalties are enforced with 5-, 10-, and 15- yard penalties.

The purpose of this project is to examine tendencies, biases, and patterns in penalties called by officials. It is important to note that we only consider calls made by referees in this analysis, since referees are most responsible for the play of game and are the appointed head official for their respective games.

Our interest in sports, and interest in the NFL specifically, prompted us to research this topic. From an NFL fan and spectator perspective, an increasing amount of attention has been placed on penalties called over the course of the past five or so years. There is often contention regarding how one can actually define a specific penalty, how to determine if one occurred, and why some teams appear to be penalized significantly more or less often than do others. Penalties can dramatically alter the flow and outcomes of games, so ensuring that penalties are called fairly and consistently is crucial to maintaining the integrity of the game.

Data Collection
---------------

Data for this analysis was collected from the 2013-2014 NFL season through Week 9 of the 2018-2019 NFL season. It should be noted that this analysis was conducted during the 2018-2019 NFL season. Thus we have included all data available for the current season, but this season was excluded in any analyses in which penalties were compared over entire seasons, since all data for the entire season will not be available until February 2019.

We downloaded play-by-play data from NFLsavant.com: <http://www.nflsavant.com/about.php?fbclid=IwAR3c8IZngQd0eE_0jp3Z401TdZXSBa8E-qEAX8J7J4uC3--CisVr7ZQfjEQ> From this site, we downloaded CSV files from seasons beginning in 2013 through 2018. These six CSV files begin with "pbp" and are located within the "/data" folder of this repository.

We then downloaded referee game data from Pro-Football-Reference: <https://www.pro-football-reference.com/officials/index.htm?fbclid=IwAR387n92do_jrcbwKAjKNR2Y_GSGpcnWMGbCbJ7Pwmx7AdpZQRSbmglfSfU>

As noted above, because there are hundreds of referees, linesmen, side judges, and line judges employed by the NFL, for the purposes of this analysis we focused only on referees. We also excluded any referees who have not been employed by the NFL for a sufficient amount of time (and thus do not yield sufficient data points); all referees in our dataset have reffed over 50 games over the span of the 2013 NFL Season through week 9 of the 2018 NFL Season.

A CSV file is available in the "/data" subfolder for each of the 17 referees we included in the analysis.

Also included in the "/data" subfolder is a file called "abbreviations.csv". This file is an aid in joining the play-by-play data to the referee data, and includes a mapping of team names to team abbreviations. For example, this file maps team name "Arizona Cardinals" to team abbreviation "ARI".

Data Quality
------------

As stated above, we have two sources for the data, NFL Savant and Pro-Football-Reference. While Pro-Football-Reference had no missing values and no trends suggesting that any part of the data could be incorrect, the NFL Savant data is somewhat problematic. For example, before removing data points with an undefinied Penalty Team, some of the values in the "PenaltyType" column are nonsenical:

-   "YAC 14. A FLAG WAS THROWN"
-   "BUT OFFICIALS HUDDLED AND DID NOT CALL A PENALTY."
-   "CENTER-41-J.WINCHESTER"

None of these statements can be considered valid penalty types. After manually checking ESPN play-by-play data in the games that contained these data points, it can be seen that the data was scraped from the ESPN play-by-play data. It seems that irregular text that contain a key word such as "Flag" or "Penalty" as can be seen above, will throw off the scraping algorithm. However, despite these small hiccups, the data is mostly sensical.

Moreover, after the data from Pro-Football-Focus and NFL Savant are merged, there are a decent percentage of missing values in the "Referee", "Home", and "Away" columns. This is due to the fact that some games in the NFL Savant play-by-play data set were reffed by referee crews who have not officiated 50 or more games over the 2013 NFL Season - 2018 NFL Season Week 9. Since NFL Savant data does not include any information on referee, home team, or away team and this data must be merged over from Pro-Football-Focus. Even though these games will be undefined for a few columns, It was deemed ideal to keep the data from them as it can be used to have more a complete analysis of other columns such as "PenaltyType" and "PenaltyYards".

Data Processing
---------------

To simplify the data, penalty types are grouped together with a universal grouping term. Moreover, some terms accounted for less than 1% of the data after the grouping took place (Fair Catch Interference, Inelgible Player Downfield, Illegal Action to Block a Field Goal, Illegal Bat, Illegal Forward Pass, Illegal Kickoff, Illegal Player Out of Bounds, Intentional Grounding, Invalid Fair Catch Signal and Tripping) and were grouped again into the "Other" category. Here is a table highlighting how each penalty type was grouped:

<table style="width:60%;">
<colgroup>
<col width="26%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Grouping Term</th>
<th>Penalty Types Included</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong> Delay of Game </strong></td>
<td>Delay of Game, Defensive Delay of Game, Delay of Kickoff</td>
</tr>
<tr class="even">
<td><strong> Illegal Block </strong></td>
<td>Chop Block, Clipping, Illegal Blindside Block, Illegal Block Above the Wasste, Illegal Crackback, Illegal Peelback, Illegal Wedge, Offensive Holding, Low Block</td>
</tr>
<tr class="odd">
<td><strong> Illegal Formation </strong></td>
<td>Illegal Formation, Illegal Motion, Illegal Shift</td>
</tr>
<tr class="even">
<td><strong> Illegal Tackle </strong></td>
<td>Face Mask (15 Yards), Horse Collar Tackle, Lowering the Head to Initiate Contact</td>
</tr>
<tr class="odd">
<td><strong> Illegal Use of Hands </strong></td>
<td>Illegal Use of Hands</td>
</tr>
<tr class="even">
<td><strong> Offside </strong></td>
<td>Defensive Offside, Encroachment, False Start, Neutral Zone Infraction, Offensive Offside, Offside on Free Kick</td>
</tr>
<tr class="odd">
<td><strong> Pass Interference </strong></td>
<td>Defensive Holding, Defensive Pass Interference, Illegal Contact, Offensive Pass Interference</td>
</tr>
<tr class="even">
<td><strong> Roughing a Protected Player </strong></td>
<td>Roughing the Kicker, Roughing the Passer, Running Into the Kicker</td>
</tr>
<tr class="odd">
<td><strong> Too Many Men on the Field </strong></td>
<td>Defensive 12 On-Field, Defensive Too Many Men on the Field, Illegal Substitution, Offensive 12 On-Field, Offensive Too Many Men on Field</td>
</tr>
<tr class="even">
<td><strong> Unsportsmanlike Conduct </strong></td>
<td>Disqualification, Personal Foul, Taunting, Unnecessary Roughness, Unsportsmanlike Conduct</td>
</tr>
<tr class="odd">
<td><strong> Other </strong></td>
<td><strong>Fair Catch Interference:</strong> Fair Catch Interference, Kick Catch Interference, Interference with Opportunity to Catch<br><br> <strong>Ineligible Player Downfield:</strong> Ineligible Downfield Kick, Ineligible Downfield Pass<br><br><strong>Illegal Action to Block a Field Goal:</strong> Leverage, Leaping<br><br><strong>Illegal Bat:</strong> Illegal Bat<br><br><strong>Illegal Forward Pass:</strong>Illegal Forward Pass<br><br><strong>Illegal Kickoff:</strong> Kickoff Out of Bounds, Short Free Kick<br><br><strong>Illegal Player Out of Bounds:</strong> Illegal Touch Kick, Illegal Touch Pass, Player Out of Bounds on Kick, Player Out of Bounds on Punt <br><br><strong>Intentional Grounding:</strong> Intentional Grounding<br><br><strong>Invalid Fair Catch Signal:</strong> Invalid Fair Catch Signal<br><br><strong>Tripping:</strong> Tripping</td>
</tr>
</tbody>
</table>

Additionally, due to teams moving cities as well as general inconsistency of abbreviations accross the data, the following abbreviations were updated to match the current data:

| Team Name | Old Abbreviation | New Abbreviation |
|-----------|------------------|------------------|
| Chargers  | SD               | LAC              |
| Jaguars   | JAC              | JAX              |
| Rams      | LA               | LAR              |
| Rams      | STL              | LAR              |

Conclusion
----------

While many unique insights were uncovered through this analysis, there remain a few interesting directions in which we can proceed to perform further exploratory data analysis.

As noted above, home teams are penalized significantly less often than are away teams. This is a trend we found consistent across all teams, just about all referees, and across all quarters of games. Most NFL seasons, some games (generally less than three or four) are played at neutral fields, either in another country or at a pre-determined destination in the United States (as is the case for the Super Bowl). A limitation with this potential exploration include a significantly smaller sample size than what was used in this analysis. Moreover, we would need to be careful to filter out games that are technically at a neutral location but where one team still has locational advantage (for example if the New York Jets played the Minnesota Vikings at the New York Giants stadium). In carrying out such an analysis, we suspect that this would yield a much more balanced distribution of penalties called against opposing teams when neither team is playing at their home field.
