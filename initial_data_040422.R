#Uncomment the below lines to install missing packages 
#install.packages('data.table')
#install.packages('rstudioapi')
#install.packages('tidyr')
#install.packages('tidyverse')

library(dplyr)
library(tidyverse)
library(tidyr)
library(rstudioapi)
library(data.table)

# Select the "initial_data_040422" folder when prompted, most likely in your downloads folder.
setwd(selectDirectory())

abbrev <- read.csv("abbrev_040422.csv")
all_september <- read.csv("September_McCabe_Brechko.csv")
brechko_march <- read.csv("Brechko_March.csv")
mccabe_march <- read.csv("McCabe_March.csv")
all_march <- rbind(brechko_march, mccabe_march)
unfiltered_september <- read.csv('September_McCabe_Brechko.csv')[-c(4, 5)]
unflitered_march <- rbind(brechko_march, mccabe_march)[-c(4, 5)]

# These frames represent the rows which we have observations for in both September and March. 
match_mar <- read.csv("match_mar.csv")
match_sep <- read.csv("match_sep.csv")
match_mar <- match_mar[,2:ncol(match_mar)]
match_sep <- match_sep[,2:ncol(match_sep)]

#The below lines remove the time part of the timestamp
dateArray <- c()
for (i in 1:length(all_september$Timestamp)) {
  dateArray[i] <- substr(as.character(all_september$Timestamp[i]), 1, 9)
}
all_september$Timestamp <- as.character(all_september$Timestamp)
for (i in 1:length(all_september$Timestamp)) {
  all_september$Timestamp[i] <- dateArray[i]
}

#The below lines rename the columns of the data frame using the "abbrev" data frame
setnames(all_march, old = as.character(abbrev$Long.name), new=as.character(abbrev$Categegory.Short.Name))
setnames(all_september, old = as.character(abbrev$Long.name), new=as.character(abbrev$Categegory.Short.Name))

#The below lines remove student names from the data frames and replace with a number between 1 and 131, sequential
#The resultant data is stored in a table called name_table
student <- c()
length(student) <- 131
firstname <- c()
length(firstname) <- 131
lastname <- c()
length(lastname) <- 131

counter <- 0001
for (i in 1:length(unfiltered_september$What.is.your.first.name)) {
  student[i] <- counter
  counter = counter + 1
  print(unfiltered_september$What.is.your.first.name[i])
  print(unfiltered_september$What.is.your.last.name[i])
  firstname[i] <- as.character(tolower(unfiltered_september$What.is.your.first.name[i]))
  lastname[i] <- as.character(tolower(unfiltered_september$What.is.your.last.name[i]))
}
name_table <- data.frame(student_id, firstname, lastname)

#The below lines remove students' names from the data frame as well as narrative variables
all_march <- all_march[-c(4, 5, 14, 21)]
all_september <- all_september[-c(4, 5, 14, 21)]
all_september$student <- student

#The brechko_march and mccabe_march data frames are not needed, and so are removed
rm(brechko_march)
rm(mccabe_march)



