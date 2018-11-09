#getting files
setwd(getwd())
genFileName = "./data/pbp-20"
columnClasses = c("NULL", NA, NA,NA, NA, 
                  NA, NA, NA, NA, NA, "NULL",
                  "NULL", "NULL", "NULL", "NULL",
                  "NULL", "NULL", "NULL", "NULL", NA,
                  NA, NA, "NULL", "NULL", NA,
                  NA, "NULL", NA, "NULL", "NULL",
                  "NULL", "NULL", NA, NA, NA,
                  NA, NA, "NULL", NA, NA, "NULL",
                  NA, NA, NA, NA)
years =  c("13", "14", "15", "16", "17", "18")

df_ref = NULL

for (year in years){
  fileName = paste(genFileName,year,".csv", sep = "")
  df_temp = read.csv(fileName, colClasses = columnClasses, na = "")
  
  #Removing rows without penalties or with NA values for penalties
  df_temp = df_temp[df_temp$IsPenalty == 1,]
  df_temp$IsPenalty = NULL
  df_temp = df_temp[!is.na(df_temp$PenaltyTeam),]
  
  #Correcting for Team Name Changes over last few years
  df_temp$OffenseTeam = as.character(df_temp$OffenseTeam)
  df_temp$DefenseTeam = as.character(df_temp$DefenseTeam)
  df_temp$PenaltyTeam = as.character(df_temp$PenaltyTeam)
  
  df_temp$OffenseTeam[df_temp$OffenseTeam == "LA"] = "LAR"
  df_temp$OffenseTeam[df_temp$OffenseTeam == "SD"] = "LAC"
  df_temp$OffenseTeam[df_temp$OffenseTeam == "STL"] = "LAR"
  
  df_temp$DefenseTeam[df_temp$DefenseTeam == "LA"] = "LAR"
  df_temp$DefenseTeam[df_temp$DefenseTeam == "SD"] = "LAC"
  df_temp$DefenseTeam[df_temp$DefenseTeam == "STL"] = "LAR"
  
  df_temp$PenaltyTeam[df_temp$PenaltyTeam == "LA"] = "LAR"
  df_temp$PenaltyTeam[df_temp$PenaltyTeam == "SD"] = "LAC"
  df_temp$PenaltyTeam[df_temp$PenaltyTeam == "STL"] = "LAR"
  
  df_temp$OffenseTeam = as.factor(df_temp$OffenseTeam)
  df_temp$DefenseTeam = as.factor(df_temp$DefenseTeam)
  df_temp$PenaltyTeam = as.factor(df_temp$PenaltyTeam)
  
  df_temp$GameDate = as.Date(df_temp$GameDate)
  
  #Adding Data to final Data
  df_ref = rbind(df_ref, df_temp)
}


#Preparing data for merge with ref names
df_ref = df_ref[order(df_ref$OffenseTeam,df_ref$DefenseTeam),]

df_ref$OffenseTeam = as.character(df_ref$OffenseTeam)
df_ref$DefensiveTeam = as.character(df_ref$DefensiveTeam)

df_ref$mergeID = paste(df_ref$OffenseTeam,df_ref$DefenseTeam)


df_ref$OffenseTeam = as.factor(df_ref$OffenseTeam)
df_ref$DefensiveTeam = as.factor(df_ref$DefensiveTeam)



#Merging with ref names
refNames = c("Carl Cheffers", "Bill Vinovich", "Clete Blakeman", "Ed Hochuli", "Jerome Boger", "Pete Morelli",
             "Tony Corrente", "Walt Anderson", "Craig Wrolstad",
             "John Hussey", "Brad Allen", "Walt Coleman", "Ronald Torbert",
             "John Parry", "Terry McAulay", "Gene Steratore")
genFileName = "./data/"
columnClasses = c(NA, NA, NA, NA, "NULL", "NULL", "NULL", "NULL", "NULL", "NULL")

ref_names = "Terry McAulay"


#converts team name abbreviations to team names
abb = read.csv("./data/abbreviations.csv")

df_ref2 = NULL

#Going through and reading the csvs
for (name in refNames){
  fileName = paste(genFileName,name,".csv", sep = "")
  df_temp = read.csv(fileName, colClasses =  columnClasses)
  
  df_temp = df_temp[df_temp$Pos == "Referee",]
  
  df_temp$Referee = name
  
  df_temp$Date = as.Date(df_temp$Date, format = "%B %d %Y")
  
  df_temp$Tm = as.character(df_temp$Tm)
  df_temp$Opp = as.character(df_temp$Opp)

  #Fixing names
  df_temp$Tm[df_temp$Tm == "San Diego Chargers"] = "Los Angeles Chargers"
  df_temp$Tm[df_temp$Tm == "St. Louis Rams"] = "Los Angeles RAms"
  
  df_temp$Opp[df_temp$Opp == "San Diego Chargers"] = "Los Angeles Chargers"
  df_temp$Opp[df_temp$Opp == "St. Louis Rams"] = "Los Angeles Rams"
  
  
  #Changing column names for merge
  colnames(abb) = c("Team1", "Tm")
  
  abb$Tm = as.character(abb$Tm)
  
  df_temp = merge(df_temp, abb, by = "Tm")
  
  colnames(abb) = c("Team2", "Opp")
  
  df_temp = merge(df_temp, abb, by = "Opp")
  
  
  #Preparing for merge with df_ref
  df_temp$Team1 = as.character(df_temp$Team1)
  df_temp$Team2 = as.character(df_temp$Team2)
  
  df_temp[order(df_temp$Team1,df_temp$Team2),]
  
  df_temp$mergeID = paste(df_temp$Team2,df_temp$Team1)
  
  #removing unnecessary columns
  df_temp$Opp = NULL
  df_temp$Tm = NULL
  df_temp$Team1 = NULL
  df_temp$Team2 = NULL
  df_temp$Pos = NULL
  
  
  #removing unnecessary rows
  df_temp = df_temp[df_temp$Date > as.Date("01/01/2013"),]

  #adding data to df_ref2
  df_ref2 = rbind(df_ref2, df_temp)
  
  }

#renaming column names and merging
colnames(df_ref2) = c("GameDate", "Referee", "mergeID") 
df_ref = merge(x = df_ref, y = df_ref2, all.x = TRUE, by = c("mergeID", "GameDate"))
