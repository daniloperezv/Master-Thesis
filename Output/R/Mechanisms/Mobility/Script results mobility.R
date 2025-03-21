###Estimation Script Mobility#########################################################

rm(list =ls())
library(sf)
library(haven)


###Estimations for monthly database ###################################################
################################################################################

##Lockdown entry
library(haven)
#Load the .dta file
data_mobility_monthly <-read_dta("mobility_lockdown_monthly.dta")
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)
#install.packages("DIDmultiplegtDYN")
library(DIDmultiplegtDYN)

#Outcome: IM sum
did_multiplegt_dyn(df = data_mobility_monthly, 
                   outcome = "monthly_im_sum", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 4, 
                   cluster = "comuna")

#Outcome: IM Interno sum
did_multiplegt_dyn(df = data_mobility_monthly, 
                   outcome = "monthly_imint_sum", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 4, 
                   cluster = "comuna")

#Outcome: IM Externo sum
did_multiplegt_dyn(df = data_mobility_monthly, 
                   outcome = "monthly_imext_sum", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 4, 
                   cluster = "comuna")

#Outcome: IM mean
did_multiplegt_dyn(df = data_mobility_monthly, 
                   outcome = "monthly_im_mean", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 4, 
                   cluster = "comuna")

#Outcome: IM Interno mean
did_multiplegt_dyn(df = data_mobility_monthly, 
                   outcome = "monthly_imint_mean", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 4, 
                   cluster = "comuna")

#Outcome: IM Externo mean
did_multiplegt_dyn(df = data_mobility_monthly, 
                   outcome = "monthly_imext_mean", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 4, 
                   cluster = "comuna")


##Lockdown exit
library(haven)
data_mobility_exit_monthly <-read_dta("mobility_lockdown_exit_monthly.dta")
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)
install.packages("DIDmultiplegtDYN")
library(DIDmultiplegtDYN)

#Outcome: IM sum
did_multiplegt_dyn(df = data_mobility_exit_monthly, 
                   outcome = "monthly_im_sum", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4, 
                   cluster = "comuna")

#Outcome: IM Interno sum
did_multiplegt_dyn(df = data_mobility_exit_monthly, 
                   outcome = "monthly_imint_sum", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4, 
                   cluster = "comuna")

#Outcome: IM Externo sum
did_multiplegt_dyn(df = data_mobility_exit_monthly, 
                   outcome = "monthly_imext_sum", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4, 
                   cluster = "comuna")

#Outcome: IM mean
did_multiplegt_dyn(df = data_mobility_exit_monthly, 
                   outcome = "monthly_im_mean", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4, 
                   cluster = "comuna")

#Outcome: IM Interno mean
did_multiplegt_dyn(df = data_mobility_exit_monthly, 
                   outcome = "monthly_imint_mean", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4, 
                   cluster = "comuna")

#Outcome: IM Externo mean
did_multiplegt_dyn(df = data_mobility_exit_monthly, 
                   outcome = "monthly_imext_mean", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 4, 
                   cluster = "comuna")


###Estimations for daily database ###################################################
################################################################################
##Lockdown entry
library(haven)
data_mobility_daily <-read_dta("mobility_lockdown_daily.dta")
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)
install.packages("DIDmultiplegtDYN")
library(DIDmultiplegtDYN)


#Outcome: IM
did_multiplegt_dyn(df = data_mobility_daily, 
                   outcome = "im", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 25, 
                   placebo = 14,
                   cluster = "comuna")

#Outcome: IM Interno
did_multiplegt_dyn(df = data_mobility_daily, 
                   outcome = "im_interno", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 25,
                   placebo = 7,
                   cluster = "comuna")

#Outcome: IM Externo
did_multiplegt_dyn(df = data_mobility_daily, 
                   outcome = "im_externo", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown", 
                   effects = 25, 
                   placebo = 7,
                   cluster = "comuna")


##Lockdown exit
library(haven)
data_mobility_exit_daily <-read_dta("mobility_lockdown_exit_daily.dta")
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)
install.packages("DIDmultiplegtDYN")
library(DIDmultiplegtDYN)


#Outcome: IM
did_multiplegt_dyn(df = data_mobility_exit_daily, 
                   outcome = "im", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 25, 
                   placebo = 7,
                   cluster = "comuna")

#Outcome: IM Interno
did_multiplegt_dyn(df = data_mobility_exit_daily, 
                   outcome = "im_interno", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit", 
                   effects = 25,
                   placebo = 7,
                   cluster = "comuna")

#Outcome: IM Externo
did_multiplegt_dyn(df = data_mobility_exit_daily, 
                   outcome = "im_externo", 
                   group = "comuna", 
                   time = "fecha", 
                   treatment = "lockdown_exit",
                   effects = 25,
                   placebo = 7,
                   cluster = "comuna")


