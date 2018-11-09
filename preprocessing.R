#getting files
setwd(getwd())
genFileName = "./data/pbp-201"
columnClasses = c("NULL", NA, NA,NA, NA, 
                  NA, NA, NA, NA, NA, "NULL",
                  "NULL", "NULL", "NULL", "NULL",
                  "NULL", "NULL", "NULL", NA, NA,
                  NA, NA, "NULL", "NULL", NA,
                  NA, "NULL", NA, "NULL", "NULL",
                  "NULL", "NULL", NA, NA, NA,
                  NA, NA, "NULL", NA,
                  NA, "NULL", NA, NA, NA, NA)

df_ref = NULL

for (i in c("3","4","5","6","7","8")){
  fileName = paste(genFileName,i,".csv", sep = "")
  df_temp = read.csv(fileName, colClasses = columnClasses, na = "")
  
  #Removing rows without penalties or with NA values for penalties
  df_temp = df_temp[df_temp$IsPenalty == 1,]
  df_temp$IsPenalty = NULL
  df_temp = df_temp[!is.na(df_temp$PenaltyTeam),]
  
  #Correcting for Team Name Changes over last few years
  df_temp$OffenseTeam <- as.character(df_temp$OffenseTeam)
  df_temp$DefenseTeam <- as.character(df_temp$DefenseTeam)
  df_temp$PenaltyTeam <- as.character(df_temp$PenaltyTeam)
  
  df_temp$OffenseTeam[df_temp$OffenseTeam == "LA"] = "LAR"
  df_temp$OffenseTeam[df_temp$OffenseTeam == "SD"] = "LAC"
  df_temp$OffenseTeam[df_temp$OffenseTeam == "STL"] = "LAR"
  
  df_temp$DefenseTeam[df_temp$DefenseTeam == "LA"] = "LAR"
  df_temp$DefenseTeam[df_temp$DefenseTeam == "SD"] = "LAC"
  df_temp$DefenseTeam[df_temp$DefenseTeam == "STL"] = "LAR"
  
  df_temp$PenaltyTeam[df_temp$PenaltyTeam == "LA"] = "LAR"
  df_temp$PenaltyTeam[df_temp$PenaltyTeam == "SD"] = "LAC"
  df_temp$PenaltyTeam[df_temp$PenaltyTeam == "STL"] = "LAR"
  
  df_temp$OffenseTeam <- as.factor(df_temp$OffenseTeam)
  df_temp$DefenseTeam <- as.factor(df_temp$DefenseTeam)
  df_temp$PenaltyTeam <- as.factor(df_temp$PenaltyTeam)
  
  df_temp$GameDate = as.Date(df_temp$GameDate)
  
  #Adding Data to final Data
  df_ref = rbind(df_ref, df_temp)
}

