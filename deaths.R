# Celebrity Deaths in 2016
# Hazel Kavili
# It's a very sad topic to make analysis :(
library(readxl)
library(dplyr)
library(ggplot2)

deaths <- readxl("/Users/hazelkavili/Desktop/celebrityDeaths/celebrity_deaths_2016.xlsx")
dim(deaths)
attach(deaths)

ageDied <- ggplot(deaths, aes(x = age)) + geom_histogram(binwidth = 10) + xlab("Age of celebrities") +
  ylab("Frequency") + ggtitle("The age of celebrities when they died") + theme_bw()


unique(causeofdeath)
cancerDeaths <- deaths %>% filter(grepl(" cancer", causeofdeath)) %>% 
  group_by(causeofdeath) %>% summarise(total = n()) %>%  arrange(total)

cancerDeaths_top10 <- top_n(cancerDeaths, 10)
ggplot(cancerDeaths_top10, aes(x = causeofdeath)) + geom_bar()


dayDied <- deaths %>% group_by(dateofdeath) %>% summarise(total = n()) %>%  arrange(total) %>% 
  ggplot(aes(x = dateofdeath, y = total)) + geom_line(color = "grey") + theme_bw()  +
  xlab("Date of death") + ylab("Total Deaths") + ggtitle("Celebrity Deaths in 2016") 
  

