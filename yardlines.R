library(dplyr)
library(ggplot2)
library(tidyverse)

df <- read.csv("./data/df_ref.csv")

#Get mean and standard deviation for YardLine
m <- mean(df$YardLine)
std_dev <- sd(df$YardLine)

ggplot(df, aes(x=YardLine)) +
  geom_histogram(aes(y = ..density..),
                 binwidth = 5,
                 color = "blue", fill = "lightblue") +
  geom_density(color = "black", lwd=1.0) +
  stat_function(fun = dnorm, args = list(mean = m, sd = std_dev),
                color = "red", lwd = 1.0) +
  theme(plot.title = element_text(hjust = 0.5, size = 20),
        axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14)) +
  ggtitle("Penalties by Yard Line") +
  xlab("Yard Line") +
  ylab("Density")


df_subset <- df %>%
  group_by(Referee) %>%
  summarise(mean_yard_line = mean(YardLine)) %>%
  filter(!is.na(Referee))

ggplot(df_subset, aes(x=mean_yard_line,
                      y=fct_reorder(Referee, mean_yard_line))) +
  geom_point() +
  ggtitle("Average Yard Line Penalty by Referee") +
  scale_y_discrete(name = 'Referee') +
  scale_x_continuous(name = "Mean Yard Line") +
  theme(plot.title = element_text(hjust = 0.5, size = 16),
        axis.title.x = element_text(size = 12),
        axis.title.y = element_text(size = 12))