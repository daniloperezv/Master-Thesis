###Robustness checks Script#####################################################
rm(list =ls())

#Load the .dta file
library(sf)
library(haven)
data_Chile <- read_dta("base_Chile.dta")

################################################################################
##First, I perform estimations for the whole period taking 2018 as comparison
##year. Check placebos. ONLY WHOLE PERIOD and lockdown entry
################################################################################
library(haven)
#Load the .dta file
data_whole_period_2018 <-read_dta("base_whole_period_2018.dta")
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)
#install.packages("DIDmultiplegtDYN")
library(DIDmultiplegtDYN)

###Lockdown entry###############################################################

###Rate per 100,000 inhabitants

#DMCS
did_multiplegt_dyn(df = data_whole_period_2018, 
                   outcome = "DMCStasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16, 
                   placebo = 15,
                   cluster = "comuna",
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery
did_multiplegt_dyn(df = data_whole_period_2018, 
                   outcome = "fuerzatasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16, 
                   placebo = 15, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery with violence and intimidation
did_multiplegt_dyn(df = data_whole_period_2018, 
                   outcome = "violenciatasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16, 
                   placebo = 15, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Vehicle theft
did_multiplegt_dyn(df = data_whole_period_2018, 
                   outcome = "vehiculostasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16, 
                   placebo = 15, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Homicides
did_multiplegt_dyn(df = data_whole_period_2018, 
                   outcome = "homicidiostasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16, 
                   placebo = 15, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")



###############################################################################
##Second, I conduct the estimations for the whole period - lockdown entry - including controls
###############################################################################
library(haven)
#Load the .dta file
data_whole_period <-read_dta("base_whole_period.dta")
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)
install.packages("DIDmultiplegtDYN")
library(DIDmultiplegtDYN)

#DMCS
did_multiplegt_dyn(df = data_whole_period, 
                   outcome = "DMCStasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16, 
                   placebo = 8,
                   cluster = "comuna",
                   graph_off = FALSE,
                   weight = "poblacion",
                   controls = "infection")

#Robbery
did_multiplegt_dyn(df = data_whole_period, 
                   outcome = "fuerzatasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16, 
                   placebo = 8, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion",
                   controls = "infection")

#Robbery with violence and intimidation
did_multiplegt_dyn(df = data_whole_period, 
                   outcome = "violenciatasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16, 
                   placebo = 8, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion",
                   controls = "infection")

#Vehicle theft
did_multiplegt_dyn(df = data_whole_period, 
                   outcome = "vehiculostasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16, 
                   placebo = 8, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion",
                   controls = "infection")

#Homicides
did_multiplegt_dyn(df = data_whole_period, 
                   outcome = "homicidiostasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16, 
                   placebo = 8, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion",
                   controls = "infection")



###Estimations for whole period - Only RM#######################################
################################################################################
library(haven)
#Load the .dta file
data_whole_period_RM <-read_dta("base_whole_period_RM.dta")
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)
install.packages("DIDmultiplegtDYN")
library(DIDmultiplegtDYN)

###These estimations are important to test the no-anticipation and parallel trends assumptions
###Lockdown entry###############################################################

###Rate per 100,000 inhabitants

#DMCS
did_multiplegt_dyn(df = data_whole_period_RM, 
                   outcome = "DMCStasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16, 
                   placebo = 15,
                   cluster = "comuna",
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery
did_multiplegt_dyn(df = data_whole_period_RM, 
                   outcome = "fuerzatasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16, 
                   placebo = 15, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery with violence and intimidation
did_multiplegt_dyn(df = data_whole_period_RM, 
                   outcome = "violenciatasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16, 
                   placebo = 15, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Vehicle theft
did_multiplegt_dyn(df = data_whole_period_RM, 
                   outcome = "vehiculostasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16, 
                   placebo = 15, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Homicides
did_multiplegt_dyn(df = data_whole_period_RM, 
                   outcome = "homicidiostasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16, 
                   placebo = 15, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")


###ln of frequency of total cases

#DMCS
did_multiplegt_dyn(df = data_whole_period_RM, 
                   outcome = "DMCSfrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery
did_multiplegt_dyn(df = data_whole_period_RM, 
                   outcome = "fuerzafrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5, 
                   placebo = 0, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery with violence and intimidation
did_multiplegt_dyn(df = data_whole_period_RM, 
                   outcome = "violenciafrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Vehicle theft
did_multiplegt_dyn(df = data_whole_period_RM, 
                   outcome = "vehiculosfrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Homicides
did_multiplegt_dyn(df = data_whole_period_RM, 
                   outcome = "homicidiosfrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")



###Estimations for first wave###################################################
################################################################################
#Load the .dta file
data_first_wave_RM <-read_dta("base_first_wave_RM.dta")
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)
#install.packages("DIDmultiplegtDYN")
library(DIDmultiplegtDYN)

###Lockdown entry###############################################################

###Rate per 100,000 inhabitants

#DMCS
did_multiplegt_dyn(df = data_first_wave_RM, 
                  outcome = "DMCStasa", 
                  group = "comuna", 
                  time = "fecha", 
                  treatment = "lockdown", 
                  effects = 4, 
                  placebo = 0, 
                  cluster = "comuna", 
                  graph_off = FALSE,
                  weight = "poblacion")

#Robbery
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "fuerzatasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 4, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery with violence and intimidation
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "violenciatasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 4, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Vehicle theft
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "vehiculostasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 4, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Homicides
did_multiplegt_dyn(df = data_first_wave_RM, 
                  outcome = "homicidiostasa", 
                  group = "comuna", 
                  time = "fecha", 
                  treatment = "lockdown", 
                  effects = 4, 
                  placebo = 0, 
                  cluster = "comuna", 
                  graph_off = FALSE,
                  weight = "poblacion",
                  save_results="homicides")


###ln of frequency of total cases

#DMCS
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "DMCSfrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 4, 
                   placebo = 4, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "fuerzafrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 4, 
                   placebo = 4, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery with violence and intimidation
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "violenciafrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 4, 
                   placebo = 4, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Vehicle theft
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "vehiculosfrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 4, 
                   placebo = 4, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Homicides
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "homicidiosfrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 4, 
                   placebo = 4, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")


###Lockdown exit################################################################

###Rate per 100,000 inhabitants

#DMCS
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "DMCStasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "fuerzatasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery with violence and intimidation
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "violenciatasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4,
                   placebo = 0,
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Vehicle theft
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "vehiculostasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4, 
                   placebo = 0,
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Homicides
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "homicidiostasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")


###ln of frequency of total cases

#DMCS
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "DMCSfrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "fuerzafrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery with violence and intimidation
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "violenciafrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Vehicle theft
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "vehiculosfrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Homicides
did_multiplegt_dyn(df = data_first_wave_RM, 
                   outcome = "homicidiosfrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")



###Estimations for second wave###################################################
################################################################################
library(haven)
#Load the .dta file
data_second_wave_RM <-read_dta("base_second_wave_RM.dta")
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)
install.packages("DIDmultiplegtDYN")
library(DIDmultiplegtDYN)

###Lockdown entry###############################################################

###Rate per 100,000 inhabitants

#DMCS
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "DMCStasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "fuerzatasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery with violence and intimidation
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "violenciatasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Vehicle theft
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "vehiculostasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Homicides
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "homicidiostasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")


###ln of frequency of total cases

#DMCS
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "DMCSfrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "fuerzafrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery with violence and intimidation
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "violenciafrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Vehicle theft
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "vehiculosfrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Homicides
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "homicidiosfrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")


###Lockdown exit################################################################

###Rate per 100,000 inhabitants

#DMCS
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "DMCStasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "fuerzatasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery with violence and intimidation
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "violenciatasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 5,
                   placebo = 0,
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Vehicle theft
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "vehiculostasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 5, 
                   placebo = 0,
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Homicides
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "homicidiostasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")


###ln of frequency of total cases

#DMCS
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "DMCSfrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "fuerzafrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Robbery with violence and intimidation
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "violenciafrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Vehicle theft
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "vehiculosfrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")

#Homicides
did_multiplegt_dyn(df = data_second_wave_RM, 
                   outcome = "homicidiosfrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")


