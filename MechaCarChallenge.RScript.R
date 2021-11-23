library(dplyr)

### DELIVERABLE 1
#read in the mechacar csv
mechacar <- read.csv(file='MechaCar_mpg.csv', check.names=F, stringsAsFactors=F)
#perform muliple linear regressions
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar)
#determine p and r^2
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar))


### DELIVERABLE 2
#read in the suspension coil csv
suspension_data <- read.csv(file='Suspension_Coil.csv', check.names=F, stringsAsFactors=F)
#create a table to get summary statistics for the psi column 
total_summary <- suspension_data %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
#create a table to group the summary statistics by lot number 
lot_summary <- suspension_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups='keep')