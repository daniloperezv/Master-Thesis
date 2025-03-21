###Estimation Script Unemployment#####################################################

rm(list =ls())
library(sf)
library(haven)


###Estimations for monthly database ###################################################
################################################################################
library(haven)
#Load the .dta file
data_unemployment <-read_dta("unemployment_lockdown_monthly.dta")
data_unemployment_second <-read_dta("unemployment_lockdown_second.dta") 
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)
install.packages("DIDmultiplegtDYN")
library(DIDmultiplegtDYN)


#Whole Pandemic Period
#Lockdown entry
#Outcome: total workers first wave + placebps
did_multiplegt_dyn(df = data_unemployment, 
                   outcome = "total_trabajadores_mes", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16,
                   placebo = 15,
                   cluster = "comuna")

#Outcome: total workers/PET first wave + placebps
did_multiplegt_dyn(df = data_unemployment, 
                   outcome = "trabajadores_PET", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16,
                   placebo = 15,
                   cluster = "comuna")



#First wave 
#Lockdown entry
#Outcome: total workers first wave + placebps
did_multiplegt_dyn(df = data_unemployment, 
                   outcome = "total_trabajadores_mes", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 4,
                   cluster = "comuna")

#Outcome: total workers/PET first wave + placebps
did_multiplegt_dyn(df = data_unemployment, 
                   outcome = "trabajadores_PET", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 4,
                   cluster = "comuna")

#Lockdown exit
#Outcome: total workers first wave + placebps
did_multiplegt_dyn(df = data_unemployment, 
                   outcome = "total_trabajadores_mes", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4,
                   cluster = "comuna")

#Outcome: total workers/PET first wave + placebps
did_multiplegt_dyn(df = data_unemployment, 
                   outcome = "trabajadores_PET", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4,
                   cluster = "comuna")



###Second Wave
#Outcome: total workers second wave
did_multiplegt_dyn(df = data_unemployment_second, 
                   outcome = "total_trabajadores_mes", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5,
                   cluster = "comuna")

#Outcome: total workers/PET second wave
did_multiplegt_dyn(df = data_unemployment_second, 
                   outcome = "trabajadores_PET", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5,
                   cluster = "comuna")

#Lockdown exit
#Outcome: total workers second wave
did_multiplegt_dyn(df = data_unemployment, 
                   outcome = "total_trabajadores_mes", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 5,
                   cluster = "comuna")

#Outcome: total workers/PET second wave
did_multiplegt_dyn(df = data_unemployment, 
                   outcome = "trabajadores_PET", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 5,
                   cluster = "comuna")



