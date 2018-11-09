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
                     df_ref$PenaltyType == "NEUTRAL ZONE INFRACTION"
                   ] = "OFFSIDE"


df_ref$PenaltyType[df_ref$PenaltyType == "DEFENSIVE DELAY OF GAME"
                   ] = "DELAY OF GAME"

df_ref$PenaltyType[df_ref$PenaltyType == "ILLEGAL MOTION" | 
                     df_ref$PenaltyType == "ILLEGAL SHIFT" |
                     df_ref$PenaltyType == "OFFENSIVE OFFSIDE"
                   ] = "ILLEGAL FORMATION"

df_ref$PenaltyType[df_ref$PenaltyType == "DELAY OF KICKOFF" | 
                     df_ref$PenaltyType == "KICKOFF OUT OF BOUNDS" |
                     df_ref$PenaltyType == "OFFSIDE ON FREE KICK" |
                     df_ref$PenaltyType == "SHORT FREE KICK" |
                     df_ref$PenaltyType == "ILLEGAL TOUCH KICK"
                   ] = "ILLEGAL KICK DURING KICKOFF"

df_ref$PenaltyType[df_ref$PenaltyType == "DELAY OF KICKOFF" | 
                     df_ref$PenaltyType == "OFFSIDE ON FREE KICK"
                   ] = "ILLEGAL FORMATION DURING KICKOFF"


df_ref$PenaltyType[df_ref$PenaltyType == "PLAYER OUT OF BOUNDS ON PUNT"
                   ] = "PLAYER OUT OF BOUNDS ON KICK"


df_ref$PenaltyType[df_ref$PenaltyType == "LEVERAGE" | 
                     df_ref$PenaltyType == "LEAPING"
                   ] = "ILLEGAL ATTEMPT TO BLOCK FIELD GOAL"

df_ref$PenaltyType[df_ref$PenaltyType == "FACE MASK (15 YARDS)" | 
                     df_ref$PenaltyType == "HORSE COLLAR TACKLE" |
                     df_ref$PenaltyType == "LOWERING THE HEAD TO INITIATE CONTACT"
                   ] = "ILLEGAL TACKLE"

df_ref$PenaltyType[df_ref$PenaltyType == "UNNECESSARY ROUGHNESS"
                   ] = "PERSONAL FOUL"

df_ref$PenaltyType[df_ref$PenaltyType == "TAUNTING" | 
                     df_ref$PenaltyType == "DISQUALIFICATION"
                   ] = "UNSPORTSMANLIKE CONDUCT"

df_ref$PenaltyType[df_ref$PenaltyType == "KICK CATCH INTERFERENCE" | 
                     df_ref$PenaltyType == "INTERFERENCE WITH OPPORTUNITY TO CATCH" |
                     df_ref$PenaltyType == "FAIR CATCH INTERFERENCE"
                   ] = "FAIR CATCH INTERFERENCE"

df_ref$PenaltyType[df_ref$PenaltyType == "ILLEGAL CONTACT"
                   ] = "DEFENSIVE HOLDING"

df_ref$PenaltyType[df_ref$PenaltyType == "INELIGIBLE DOWNFIELD KICK" |
                     df_ref$PenaltyType == "INELIGIBLE DOWNFIELD PASS"
                   ] = "INELIGIBLE PLAYER DOWNFIELD"

df_ref$PenaltyType[df_ref$PenaltyType == "RUNNING INTO THE KICKER"
                   ] = "ROUGHING THE KICKER"

df_ref$PenaltyType <- as.factor(df_ref$PenaltyType)