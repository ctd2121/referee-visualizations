df_ref <- read.csv( "df_ref.csv")

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
                   ] = "ILLEGAL BLOCK"

df_ref$PenaltyType[df_ref$PenaltyType == "DEFENSIVE 12 ON-FIELD" | 
                     df_ref$PenaltyType == "DEFENSIVE TOO MANY MEN ON FIELD" |  
                     df_ref$PenaltyType == "ILLEGAL SUBSTITUTION" |  
                     df_ref$PenaltyType == "OFFENSIVE 12 ON-FIELD" | 
                     df_ref$PenaltyType == "OFFENSIVE TOO MANY MEN ON FIELD" 
                   ] = "TOO MANY MEN ON FIELD"


df_ref$PenaltyType[df_ref$PenaltyType == "DEFENSIVE OFFSIDE" | 
                     df_ref$PenaltyType == "ENCROACHMENT" |  
                     df_ref$PenaltyType == "OFFSIDE ON FREE KICK" |
                     df_ref$PenaltyType == "NEUTRAL ZONE INFRACTION"  |
                     df_ref$PenaltyType == "OFFENSIVE OFFSIDE" |
                     df_ref$PenaltyType == "FALSE START"
                   ] = "OFFSIDE"


df_ref$PenaltyType[df_ref$PenaltyType == "DEFENSIVE DELAY OF GAME" |
                     df_ref$PenaltyType == "DELAY OF KICKOFF"
                   ] = "DELAY OF GAME"

df_ref$PenaltyType[df_ref$PenaltyType == "ILLEGAL MOTION" | 
                     df_ref$PenaltyType == "ILLEGAL SHIFT"
                   ] = "ILLEGAL FORMATION"

df_ref$PenaltyType[df_ref$PenaltyType == "KICKOFF OUT OF BOUNDS" |
                     df_ref$PenaltyType == "SHORT FREE KICK"
                   ] = "ILLEGAL KICKOFF"


df_ref$PenaltyType[df_ref$PenaltyType == "PLAYER OUT OF BOUNDS ON PUNT" |
                     df_ref$PenaltyType == "ILLEGAL TOUCH PASS" |
                     df_ref$PenaltyType == "PLAYER OUT OF BOUNDS ON KICK"  |
                     df_ref$PenaltyType == "ILLEGAL TOUCH KICK"
                   ] = "ILLEGAL PLAYER OUT OF BOUNDS"


df_ref$PenaltyType[df_ref$PenaltyType == "FACE MASK (15 YARDS)" | 
                     df_ref$PenaltyType == "HORSE COLLAR TACKLE"
                   ] = "ILLEGAL TACKLE"


df_ref$PenaltyType[df_ref$PenaltyType == "TAUNTING" | 
                     df_ref$PenaltyType == "DISQUALIFICATION" |
                     df_ref$PenaltyType == "UNNECESSARY ROUGHNESS" |
                     df_ref$PenaltyType == "PERSONAL FOUL"
                   ] = "UNSPORTSMANLIKE CONDUCT"

df_ref$PenaltyType[df_ref$PenaltyType == "KICK CATCH INTERFERENCE" | 
                     df_ref$PenaltyType == "INTERFERENCE WITH OPPORTUNITY TO CATCH"
                   ] = "FAIR CATCH INTERFERENCE"

df_ref$PenaltyType[df_ref$PenaltyType == "ILLEGAL CONTACT" |
                     df_ref$PenaltyType == "DEFENSIVE PASS INTERFERENCE" |
                     df_ref$PenaltyType == "DEFENSIVE HOLDING" |
                     df_ref$PenaltyType == "OFFENSIVE PASS INTERFERENCE"
                   ] = "PASS INTERFERENCE"

df_ref$PenaltyType[df_ref$PenaltyType == "INELIGIBLE DOWNFIELD KICK" |
                     df_ref$PenaltyType == "INELIGIBLE DOWNFIELD PASS"
                   ] = "INELIGIBLE PLAYER DOWNFIELD"

df_ref$PenaltyType[df_ref$PenaltyType == "RUNNING INTO THE KICKER" |
                     df_ref$PenaltyType == "ROUGHING THE KICKER" |
                     df_ref$PenaltyType == "ROUGHING THE PASSER"  
                   ] = "ROUGHING A PROTECTED PLAYER"


df_ref$PenaltyType[df_ref$PenaltyType == "LEVERAGE" | 
                     df_ref$PenaltyType == "LEAPING"
                   ] = "ILLEGAL ACTION TO BLOCK FIELD GOAL"

df_ref$PenaltyType <- as.factor(df_ref$PenaltyType)