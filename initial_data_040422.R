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

# These frames represent the rows which we have observations for in both September and March. 
match_mar <- read.csv("match_mar.csv")
match_sep <- read.csv("match_sep.csv")
match_mar <- match_mar[,2:ncol(match_mar)]
match_sep <- match_sep[,2:ncol(match_sep)]

setnames(all_march, old = abbrev$Long.name, new=abbrev$Categegory.Short.Name, skip_absent = TRUE)
setnames(all_september, old = abbrev$Long.name, new=abbrev$Categegory.Short.Name, skip_absent = TRUE)

all_march <- all_march[-c(14, 21)]
all_september <- all_september[-c(14, 21)]

rm(brechko_march)
rm(mccabe_march)



