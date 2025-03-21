###Estimation Script#########################################################
rm(list =ls())

#Load the .dta file
library(sf)
library(haven)
data_Chile <- read_dta("base_Chile.dta")


###Estimations for whole period#################################################
################################################################################
library(haven)
#Load the .dta file
data_whole_period <-read_dta("base_whole_period.dta")
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)

#Install and load the DIDmultiplegtDYN package
#install.packages("DIDmultiplegtDYN")
library(DIDmultiplegtDYN)

###These estimations are fundamental to test the no-anticipation and parallel trends assumptions
###Lockdown entry###############################################################

###Rate per 100,000 inhabitants

#DMCS
did_multiplegt_dyn(df = data_whole_period, 
                   outcome = "DMCStasa", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 16, 
                   placebo = 5, 
                   cluster = "comuna",
                   weight = "poblacion")

#Robbery
did_multiplegt_dyn(df = data_whole_period, 
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
did_multiplegt_dyn(df = data_whole_period, 
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
did_multiplegt_dyn(df = data_whole_period, 
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
did_multiplegt_dyn(df = data_whole_period, 
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
did_multiplegt_dyn(df = data_whole_period, 
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
did_multiplegt_dyn(df = data_whole_period, 
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
did_multiplegt_dyn(df = data_whole_period, 
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
did_multiplegt_dyn(df = data_whole_period, 
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
did_multiplegt_dyn(df = data_whole_period, 
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
data_first_wave <-read_dta("base_first_wave.dta")
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)
#install.packages("DIDmultiplegtDYN")
#library(DIDmultiplegtDYN)

###Lockdown entry###############################################################

###Rate per 100,000 inhabitants

#DMCS
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
#did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
did_multiplegt_dyn(df = data_first_wave, 
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
data_second_wave <-read_dta("base_second_wave.dta")
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)
install.packages("DIDmultiplegtDYN")
library(DIDmultiplegtDYN)

###Lockdown entry###############################################################

###Rate per 100,000 inhabitants

#DMCS
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
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
did_multiplegt_dyn(df = data_second_wave, 
                   outcome = "homicidiosfrecuencia", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 5, 
                   placebo = 0, 
                   cluster = "comuna", 
                   graph_off = FALSE,
                   weight = "poblacion")
