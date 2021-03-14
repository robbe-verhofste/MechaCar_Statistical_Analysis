library(dplyr)

#CAR VARIABLES TO EXPLAIN MPG
MechaCar <- read.csv(file="./Resources/MechaCar_mpg.csv")

View(MechaCar)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar))

#SUSPENSION COIL DELIVERABLE
suspension <- read.csv(file="./Resources/Suspension_Coil.csv", check.names=F, stringsAsFactors=F)

#total summary
suspension_summary <- suspension %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), Std.Dev.=sd(PSI))

suspension_summary

lot_summary <- suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), Std.Dev.=sd(PSI))

lot_summary

# T-test
t.test(suspension$PSI, mu=1500)

t.test(subset(suspension$PSI,suspension$Manufacturing_Lot == "Lot1"),mu=mean(suspension$PSI))

t.test(subset(suspension$PSI,suspension$Manufacturing_Lot == "Lot2"),mu=mean(suspension$PSI))

t.test(subset(suspension$PSI,suspension$Manufacturing_Lot == "Lot3"),mu=mean(suspension$PSI))

