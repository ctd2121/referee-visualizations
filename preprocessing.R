library(dplyr)

#Getting files
setwd(getwd())
genFileName <- "./data/pbp-20"
columnClasses <- c("NULL", NA, NA,NA, NA, 
                   NA, NA, NA, NA, NA, "NULL",
                   "NULL", "NULL", "NULL", "NULL",
                   "NULL", "NULL", "NULL", "NULL", NA,
                   NA, NA, "NULL", "NULL", NA,
                   NA, "NULL", NA, "NULL", "NULL",
                   "NULL", "NULL", NA, NA, NA,
                   NA, NA, "NULL", NA, NA, "NULL",
                   NA, NA, NA, NA)
years <-  c("13", "14", "15", "16", "17", "18")

df_ref <- NULL

for (year in years){
  fileName <- paste(genFileName,year,".csv", sep = "")
  df_temp <- read.csv(fileName, colClasses = columnClasses, na = "")
  
  #Removing rows without penalties or with NA values for penalties
  df_temp <- df_temp[df_temp$IsPenalty == 1,]
  df_temp$IsPenalty <- NULL
  df_temp <- df_temp[!is.na(df_temp$PenaltyTeam),]
  
  #Correcting for Team Name Changes over last few years
  df_temp$OffenseTeam <- as.character(df_temp$OffenseTeam)
  df_temp$DefenseTeam <- as.character(df_temp$DefenseTeam)
  df_temp$PenaltyTeam <- as.character(df_temp$PenaltyTeam)
  
  df_temp$OffenseTeam[df_temp$OffenseTeam == "LA"] <- "LAR"
  df_temp$OffenseTeam[df_temp$OffenseTeam == "SD"] <- "LAC"
  df_temp$OffenseTeam[df_temp$OffenseTeam == "STL"] <- "LAR"
  df_temp$OffenseTeam[df_temp$OffenseTeam == "JAC"] <- "JAX"
  
  
  df_temp$DefenseTeam[df_temp$DefenseTeam == "LA"] <- "LAR"
  df_temp$DefenseTeam[df_temp$DefenseTeam == "SD"] <- "LAC"
  df_temp$DefenseTeam[df_temp$DefenseTeam == "STL"] <- "LAR"
  df_temp$DefenseTeam[df_temp$DefenseTeam == "JAC"] <- "JAX"
  
  
  df_temp$PenaltyTeam[df_temp$PenaltyTeam == "LA"] <- "LAR"
  df_temp$PenaltyTeam[df_temp$PenaltyTeam == "SD"] <- "LAC"
  df_temp$PenaltyTeam[df_temp$PenaltyTeam == "STL"] <- "LAR"
  df_temp$PenaltyTeam[df_temp$PenaltyTeam == "JAC"] <- "JAX"
  
  
  df_temp$PenaltyTeam <- as.factor(df_temp$PenaltyTeam)
  
  df_temp$GameDate - as.Date(df_temp$GameDate)
  
  #Adding Data to final Data
  df_ref <- rbind(df_ref, df_temp)
}


#Organizing Penalties into Categories
df_ref$PenaltyType <- as.character(df_ref$PenaltyType)

df_ref$PenaltyType[df_ref$PenaltyType == "CHOP BLOCK" | 
                     df_ref$PenaltyType == "CLIPPING" |  
                     df_ref$PenaltyType == "ILLEGAL BLINDSIDE BLOCK" |  
                     df_ref$PenaltyType == "ILLEGAL BLOCK ABOVE THE WAIST" | 
                     df_ref$PenaltyType == "ILLEGAL CRACKBACK" | 
                     df_ref$PenaltyType == "LOW BLOCK" | 
                     df_ref$PenaltyType == "ILLEGAL PEELBACK" |
                     df_ref$PenaltyType == "OFFENSIVE HOLDING" |
                     df_ref$PenaltyType == "ILLEGAL WEDGE" 
                   ] = "Illegal Block"

df_ref$PenaltyType[df_ref$PenaltyType == "DEFENSIVE 12 ON-FIELD" | 
                     df_ref$PenaltyType == "DEFENSIVE TOO MANY MEN ON FIELD" |  
                     df_ref$PenaltyType == "ILLEGAL SUBSTITUTION" |  
                     df_ref$PenaltyType == "OFFENSIVE 12 ON-FIELD" | 
                     df_ref$PenaltyType == "OFFENSIVE TOO MANY MEN ON FIELD" 
                   ] = "Too Many Men on the Field"


df_ref$PenaltyType[df_ref$PenaltyType == "DEFENSIVE OFFSIDE" | 
                     df_ref$PenaltyType == "ENCROACHMENT" |  
                     df_ref$PenaltyType == "OFFSIDE ON FREE KICK" |
                     df_ref$PenaltyType == "NEUTRAL ZONE INFRACTION"  |
                     df_ref$PenaltyType == "OFFENSIVE OFFSIDE" |
                     df_ref$PenaltyType == "FALSE START" |
                     df_ref$PenaltyType == "OFFSIDE"
                   ] = "Offside"


df_ref$PenaltyType[df_ref$PenaltyType == "DEFENSIVE DELAY OF GAME" |
                     df_ref$PenaltyType == "DELAY OF KICKOFF" |
                     df_ref$PenaltyType == "DELAY OF GAME"
                   ] = "Delay of Game"

df_ref$PenaltyType[df_ref$PenaltyType == "ILLEGAL MOTION" | 
                     df_ref$PenaltyType == "ILLEGAL SHIFT" |
                     df_ref$PenaltyType == "ILLEGAL FORMATION"
                   ] = "Illegal Formation"

df_ref$PenaltyType[df_ref$PenaltyType == "KICKOFF OUT OF BOUNDS" |
                     df_ref$PenaltyType == "SHORT FREE KICK" 
                   ] = "Illegal Kickoff"


df_ref$PenaltyType[df_ref$PenaltyType == "PLAYER OUT OF BOUNDS ON PUNT" |
                     df_ref$PenaltyType == "ILLEGAL TOUCH PASS" |
                     df_ref$PenaltyType == "PLAYER OUT OF BOUNDS ON KICK"  |
                     df_ref$PenaltyType == "ILLEGAL TOUCH KICK"
                   ] = "Illegal Player Out of Bounds"


df_ref$PenaltyType[df_ref$PenaltyType == "FACE MASK (15 YARDS)" | 
                     df_ref$PenaltyType == "HORSE COLLAR TACKLE" |
                     df_ref$PenaltyType == "LOWERING THE HEAD TO INITIATE CONTACT"
                   ] = "Illegal Tackle"


df_ref$PenaltyType[df_ref$PenaltyType == "TAUNTING" | 
                     df_ref$PenaltyType == "DISQUALIFICATION" |
                     df_ref$PenaltyType == "UNNECESSARY ROUGHNESS" |
                     df_ref$PenaltyType == "PERSONAL FOUL" |
                     df_ref$PenaltyType == "UNSPORTSMANLIKE CONDUCT"
                   ] = "Unsportsmanlike Conduct"

df_ref$PenaltyType[df_ref$PenaltyType == "KICK CATCH INTERFERENCE" | 
                     df_ref$PenaltyType == "INTERFERENCE WITH OPPORTUNITY TO CATCH" |
                     df_ref$PenaltyType == "FAIR CATCH INTERFERENCE"
                   ] = "Fair Catch Interference"

df_ref$PenaltyType[df_ref$PenaltyType == "ILLEGAL CONTACT" |
                     df_ref$PenaltyType == "DEFENSIVE PASS INTERFERENCE" |
                     df_ref$PenaltyType == "DEFENSIVE HOLDING" |
                     df_ref$PenaltyType == "OFFENSIVE PASS INTERFERENCE"
                   ] = "Pass Interference"

df_ref$PenaltyType[df_ref$PenaltyType == "INELIGIBLE DOWNFIELD KICK" |
                     df_ref$PenaltyType == "INELIGIBLE DOWNFIELD PASS"
                   ] = "Ineligible Player Downfield"

df_ref$PenaltyType[df_ref$PenaltyType == "RUNNING INTO THE KICKER" |
                     df_ref$PenaltyType == "ROUGHING THE KICKER" |
                     df_ref$PenaltyType == "ROUGHING THE PASSER"  
                   ] = "Roughing a Protected Player"


df_ref$PenaltyType[df_ref$PenaltyType == "LEVERAGE" | 
                     df_ref$PenaltyType == "LEAPING"
                   ] = "Illegal Action to Block a Field Goal"

df_ref$PenaltyType[df_ref$PenaltyType == "ILLEGAL USE OF HANDS"
                   ] = "Illegal Use of Hands"


#Categorizing bottom percentage as OTHER
penTypeTable = table(df_ref$PenaltyType)
penTypeLevels = levels(as.factor(df_ref$PenaltyType))
cutoffPercentage = 0.01

for (penType in penTypeLevels){
  if (as.integer(penTypeTable[penType])/length(df_ref$PenaltyType) < cutoffPercentage){
    df_ref$PenaltyType[df_ref$PenaltyType == penType] = "Other"
  }
}


df_ref$PenaltyType <- as.factor(df_ref$PenaltyType)



#Preparing data for merge with ref names
df_ref <- df_ref[order(df_ref$OffenseTeam,df_ref$DefenseTeam),]

#Create mergeID
df_ref <- df_ref %>%
  mutate(mergeID = ifelse((OffenseTeam < DefenseTeam), paste(OffenseTeam, DefenseTeam), paste(DefenseTeam, OffenseTeam)))

df_ref$OffenseTeam <- as.factor(df_ref$OffenseTeam)
df_ref$DefenseTeam <- as.factor(df_ref$DefenseTeam)

#Merging with ref names
refNames <- c("Carl Cheffers", "Bill Vinovich", "Clete Blakeman", "Ed Hochuli", "Jerome Boger", "Pete Morelli",
              "Tony Corrente", "Walt Anderson", "Craig Wrolstad",
              "John Hussey", "Brad Allen", "Walt Coleman", "Ronald Torbert",
              "John Parry", "Terry McAulay", "Gene Steratore", "Jeff Triplette")
genFileName <- "./data/"
columnClasses <- c(NA, NA, NA, NA, "NULL", "NULL", "NULL", "NULL", "NULL", "NULL")

#Converts team name abbreviations to team names
abb <- read.csv("./data/abbreviations.csv")

df_ref2 <- NULL

#Going through and reading the CSVs
for (name in refNames){
  fileName <- paste(genFileName,name,".csv", sep = "")
  df_temp <- read.csv(fileName, colClasses =  columnClasses)
  
  #Ignoring line judges and only focusing on referees for the purposes of this analysis
  df_temp <- df_temp[df_temp$Pos == "Referee",]
  
  df_temp$Referee <- name
  
  df_temp$Date <- as.Date(df_temp$Date, format = "%B %d %Y")
  
  df_temp$Tm <- as.character(df_temp$Tm)
  df_temp$Opp <- as.character(df_temp$Opp)
  
  #Fixing names
  df_temp$Tm[df_temp$Tm == "San Diego Chargers"] <- "Los Angeles Chargers"
  df_temp$Tm[df_temp$Tm == "St. Louis Rams"] <- "Los Angeles Rams"
  
  df_temp$Opp[df_temp$Opp == "San Diego Chargers"] <- "Los Angeles Chargers"
  df_temp$Opp[df_temp$Opp == "St. Louis Rams"] <- "Los Angeles Rams"
  
  
  #Changing column names for merge
  colnames(abb) <- c("Team1", "Tm")
  
  abb$Tm <- as.character(abb$Tm)
  
  df_temp <- merge(df_temp, abb, by = "Tm")
  
  colnames(abb) <- c("Team2", "Opp")
  
  df_temp <- merge(df_temp, abb, by = "Opp")
  
  #Preparing for merge with df_ref
  df_temp$Team1 <- as.character(df_temp$Team1)
  df_temp$Team2 <- as.character(df_temp$Team2)
  
  df_temp[order(df_temp$Team1,df_temp$Team2),]
  
  #Create mergeID
  df_temp <- df_temp %>%
    mutate(mergeID = ifelse((Team1 < Team2), paste(Team1, Team2), paste(Team2, Team1)))
  
  #Removing unnecessary columns
  df_temp$Opp <- NULL
  df_temp$Tm <- NULL
  df_temp$Pos <- NULL
  
  
  #Removing unnecessary rows
  df_temp <- df_temp[df_temp$Date > as.Date("01/01/2013"),]
  
  
  #Adding data to df_ref2
  df_ref2 <- rbind(df_ref2, df_temp)
}



#Renaming column names and merging
colnames(df_ref2) <- c("GameDate", "Referee", "Home", "Away", "mergeID")


#Convert date columns to correct data type
df_ref$GameDate <- as.Date(df_ref$GameDate)

df_ref <- merge(x = df_ref, y = df_ref2, all.x = TRUE, by = c("mergeID", "GameDate"))

#Cleaning Final Data
df_ref$mergeID <- NULL

#writing CSV
write.csv(df_ref, file = "./data/df_ref.csv",row.names=FALSE)

