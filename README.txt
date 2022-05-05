The enclosed folder contains:
initial_data_040422.R        :: R script
abbrev_040422.csv            :: Short names and data types for variables  
Brechko_March.csv            :: Raw data for Brechko 3BD 3/7/22
McCabe_March.csv             :: Raw data for McCabe 1AC 3/8/22
September_McCabe_Brechko.csv :: Raw data for Brechko and McCabe, all classes, 9/27/21-9/30/21 + 10/15/21, 10/27/21, 11/23/21
match_mar.csv                :: March data on the students for whom we have two test events, as of 04/04/22
match_sep.csv                :: September data on the students for whom we have two test events, "" "" 

TO RUN R SCRIPT:
-open "initial_data_040422.R" and run all lines
-resulting data frames are all_september and all_march with new shortnames. Columns 14 and 22 are removed (narrative responses).


CHANGE LOG:
05/05/22:
Formatted dates (removed time from Timestamp)
Removed student names from all_september
Added unfiltered_september and unfiltered_march

04/04/22:
Added class names to abbreviation csv
Added missing variables names to abbreviation csv
Changed variable names: single digit numbers
Added match_mar.csv and match_sep.csv
