library(dplyr)

#read in the mechacar csv
mechacar <- read.csv(file='MechaCar_mpg.csv', check.names=F, stringsAsFactors=F)
#perform muliple linear regressions
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar)
#determine p and r^2
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar))