# referee-visualizations

This analysis examines penalties in the National Football League (NFL).

Data for this analysis was collected from the past five seasons, beginning with the 2013-2014 NFL season. It should be noted that this analysis was conducted during the 2018-2019 NFL season. We have included all data available for the current season, but this season was excluded in any analyses in which penalties were compared over entire seasons, since all data will not be available until February 2019.

Play-by-play data was downloaded from NFLsavant.com:
http://www.nflsavant.com/about.php?fbclid=IwAR3c8IZngQd0eE_0jp3Z401TdZXSBa8E-qEAX8J7J4uC3--CisVr7ZQfjEQ

From this site, we downloaded CSV files from seasons beginning in 2013 through 2018. These six CSV files begin with "pbp" and are located within the "/data" folder of this repository.

We then downloaded referee game data from Pro-Football-Reference:
https://www.pro-football-reference.com/officials/index.htm?fbclid=IwAR387n92do_jrcbwKAjKNR2Y_GSGpcnWMGbCbJ7Pwmx7AdpZQRSbmglfSfU

Because there are hundreds of referees, linesmen, side judges, and line judges employed by the NFL, for the purposes of this analysis we focused on referees. We excluded any referees who have not been employed by the NFL for a sufficient amount of time (and thus do not yield sufficient data points); all referees in our dataset have reffed over 700 games.

A CSV file is available in the "/data" subfolder for each of the 17 referees included in the analysis.

Also included in the "/data" subfolder is a file called "abbreviations.csv". This file is as an aid in joining the play-by-play data to the referee data, and includes a mapping of team names to team abbreviations. For example, this file maps team name "Arizona Cardinals" to team abbreviation "ARI".
