*********Do-file estimacion lockdown effects****************************************************
clear all
set more off

cd "C:\Users\danil\OneDrive\Escritorio\Resultados\Results\"
use "base_Chile.dta"

***Difference-in-Differences Estimators of Intertemporal Treatment Effects
ssc install did_multiplegt_dyn, replace
*The command computes the DID event-study estimators introduced in de Chaisemartin and D'Haultfoeuille (2024)
*Binary treatment that can increase or decrease multiple times.
ssc install estout

****I)FIRST WAVE****************************************************************
********************************************************************************

**1) Tratamiento: lockdown entry
clear
cd "C:\Users\danil\OneDrive\Escritorio\Resultados\Results\"
use "base_first_wave.dta"

*Estimacion outcome crime rate per 100.000 inhabitants
est clear

*DMCS
did_multiplegt_dyn DMCStasa comuna fecha lockdown, effects(4) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_1


*Robo con fuerza
did_multiplegt_dyn fuerzatasa comuna fecha lockdown, effects(4) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_2

*Robo con violencia e intimidacion
did_multiplegt_dyn violenciatasa comuna fecha lockdown, effects(4) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_3

*Robo con fuerza de vehiculo motorizado
did_multiplegt_dyn vehiculostasa comuna fecha lockdown, effects(4) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_4

*Homicidios
did_multiplegt_dyn homicidiostasa comuna fecha lockdown, effects(4) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_5

esttab model_* using "first_entry.tex", replace se noobs s(controls) b(%9.2fc)


**2) Tratamiento: lockdown exit

*Estimacion outcome crime rate per 100.000 inhabitants
est clear

*DMCS
did_multiplegt_dyn DMCStasa comuna fecha lockdown_exit, effects(4) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_1

*Robo con fuerza
did_multiplegt_dyn fuerzatasa comuna fecha lockdown_exit, effects(4) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_2

*Robo con violencia e intimidacion
did_multiplegt_dyn violenciatasa comuna fecha lockdown_exit, effects(4) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_3

*Robo con fuerza de vehiculo motorizado
did_multiplegt_dyn vehiculostasa comuna fecha lockdown_exit, effects(4) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_4

*Homicides
did_multiplegt_dyn homicidiostasa comuna fecha lockdown_exit, effects(4) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_5

esttab model_* using "first_exit.tex", replace se noobs s(controls) b(%9.2fc)



****I)SECOND WAVE***************************************************************
********************************************************************************

**1) Tratamiento: lockdown entry
clear
cd "C:\Users\danil\OneDrive\Escritorio\Resultados\Results\"
use "base_second_wave.dta"

*Estimacion outcome crime rate per 100.000 inhabitants
est clear

*DMCS
did_multiplegt_dyn DMCStasa comuna fecha lockdown, effects(5) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_1

*Robo con fuerza
did_multiplegt_dyn fuerzatasa comuna fecha lockdown, effects(5) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_2

*Robo con violencia e intimidacion
did_multiplegt_dyn violenciatasa comuna fecha lockdown, effects(5) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_3

*Robo con fuerza de vehiculo motorizado
did_multiplegt_dyn vehiculostasa comuna fecha lockdown, effects(5) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_4

*Homicidios
did_multiplegt_dyn homicidiostasa comuna fecha lockdown, effects(5) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_5

esttab model_* using "second_entry.tex", replace se noobs s(controls) b(%9.2fc)


**2) Tratamiento: lockdown exit

*Estimacion outcome crime rate per 100.000 inhabitants

*DMCS
did_multiplegt_dyn DMCStasa comuna fecha lockdown_exit, effects(5) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_1

*Robo con fuerza
did_multiplegt_dyn fuerzatasa comuna fecha lockdown_exit, effects(5) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_2

*Robo con violencia e intimidacion
did_multiplegt_dyn violenciatasa comuna fecha lockdown_exit, effects(5) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_3

*Robo con fuerza de vehiculo motorizado
did_multiplegt_dyn vehiculostasa comuna fecha lockdown_exit, effects(5) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_4

*Homicides
did_multiplegt_dyn homicidiostasa comuna fecha lockdown_exit, effects(5) cluster(comuna) weight(poblacion) graph_off
estadd local controls = "No"
est sto model_5

esttab model_* using "second_exit.tex", replace se noobs s(controls) b(%9.2fc)



*Estimacion outcome ln frecuency of total policy cases

*Se generan variables en logaritmo
gen ln_vehiculosfrecuencia=ln(vehiculosfrecuencia)
gen ln_fuerzafrecuencia=ln(fuerzafrecuencia)
gen ln_violenciafrecuencia=ln(violenciafrecuencia)
gen ln_DMCSfrecuencia=ln(DMCSfrecuencia)
gen ln_homicidiosfrecuencia=ln(homicidiosfrecuencia)

*Robo con fuerza de vehiculo motorizado
did_multiplegt_dyn ln_vehiculosfrecuencia comuna fecha lockdown, effects(4) placebo(2) cluster(comuna) weight(poblacion)

*Robo con fuerza
did_multiplegt_dyn ln_fuerzafrecuencia comuna fecha lockdown, effects(4) placebo(2) cluster(comuna) weight(poblacion)

*Robo con violencia e intimidacion
did_multiplegt_dyn ln_violenciafrecuencia comuna fecha lockdown, effects(4) placebo(2) cluster(comuna) weight(poblacion)

*DMCS
did_multiplegt_dyn ln_DMCSfrecuencia comuna fecha lockdown, effects(4) placebo(2) cluster(comuna) weight(poblacion)

*Homicides
did_multiplegt_dyn ln_homicidiosfrecuencia comuna fecha lockdown, effects(4) placebo(2) cluster(comuna) weight(poblacion)



*El periodo de comparacion es 2018 (para evitar efecto estallido social al final de 2019)
clear
cd "C:\Users\danil\OneDrive\Escritorio\Master's Thesis\Databases\Muestra Chile\"
use "base_Chile.dta"

drop if agno==2019
drop if agno==2017

*Estimacion outcome crime rate per 100.000 inhabitants
*Robo con fuerza de vehiculo motorizado
did_multiplegt_dyn vehiculostasa comuna fecha lockdown, effects(6) placebo(4) cluster(comuna) weight(poblacion)

*Robo con fuerza
did_multiplegt_dyn fuerzatasa comuna fecha lockdown, effects(6) placebo(4) cluster(comuna) weight(poblacion)

*Robo con violencia e intimidacion
did_multiplegt_dyn violenciatasa comuna fecha lockdown, effects(6) placebo(4) cluster(comuna) weight(poblacion)

*DMCS
did_multiplegt_dyn DMCStasa comuna fecha lockdown, effects(6) placebo(4) cluster(comuna) weight(poblacion)

*Homicides
did_multiplegt_dyn homicidiostasa comuna fecha lockdown, effects(6) placebo(4) cluster(comuna) weight(poblacion)


*Estimacion outcome ln frecuency of total policy cases
*Se generan variables en logaritmo
gen ln_vehiculosfrecuencia=ln(vehiculosfrecuencia)
gen ln_fuerzafrecuencia=ln(fuerzafrecuencia)
gen ln_violenciafrecuencia=ln(violenciafrecuencia)
gen ln_DMCSfrecuencia=ln(DMCSfrecuencia)
gen ln_homicidiosfrecuencia=ln(homicidiosfrecuencia)

*Robo con fuerza de vehiculo motorizado
did_multiplegt_dyn ln_vehiculosfrecuencia comuna fecha lockdown, effects(6) placebo(4) cluster(comuna) weight(poblacion)

*Robo con fuerza
did_multiplegt_dyn ln_fuerzafrecuencia comuna fecha lockdown, effects(6) placebo(4) cluster(comuna) weight(poblacion)

*Robo con violencia e intimidacion
did_multiplegt_dyn ln_violenciafrecuencia comuna fecha lockdown, effects(6) placebo(4) cluster(comuna) weight(poblacion)

*DMCS
did_multiplegt_dyn ln_DMCSfrecuencia comuna fecha lockdown, effects(6) placebo(4) cluster(comuna) weight(poblacion)

*Homicides
did_multiplegt_dyn ln_homicidiosfrecuencia comuna fecha lockdown, effects(6) placebo(4) cluster(comuna) weight(poblacion)


**2) Tratamiento: lockdown exit
clear
cd "C:\Users\danil\OneDrive\Escritorio\Master's Thesis\Databases\Muestra Chile\"
use "base_Chile.dta"

*El periodo de comparacion es 2019 (mencionar efecto estallido social al final de 2019)
drop if agno<2019

drop if fecha==202108

*Estimacion outcome crime rate per 100.000 inhabitants
*Robo con fuerza de vehiculo motorizado
did_multiplegt_dyn vehiculostasa comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)

*Robo con fuerza
did_multiplegt_dyn fuerzatasa comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)

*Robo con violencia e intimidacion
did_multiplegt_dyn violenciatasa comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)

*DMCS
did_multiplegt_dyn DMCStasa comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)

*Homicides
did_multiplegt_dyn homicidiostasa comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)


*Estimacion outcome ln frecuency of total policy cases

*Se generan variables en logaritmo
gen ln_vehiculosfrecuencia=ln(vehiculosfrecuencia)
gen ln_fuerzafrecuencia=ln(fuerzafrecuencia)
gen ln_violenciafrecuencia=ln(violenciafrecuencia)
gen ln_DMCSfrecuencia=ln(DMCSfrecuencia)
gen ln_homicidiosfrecuencia=ln(homicidiosfrecuencia)

*Robo con fuerza de vehiculo motorizado
did_multiplegt_dyn ln_vehiculosfrecuencia comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)

*Robo con fuerza
did_multiplegt_dyn ln_fuerzafrecuencia comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)

*Robo con violencia e intimidacion
did_multiplegt_dyn ln_violenciafrecuencia comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)

*DMCS
did_multiplegt_dyn ln_DMCSfrecuencia comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)

*Homicides
did_multiplegt_dyn ln_homicidiosfrecuencia comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)


**Second wave
clear
cd "C:\Users\danil\OneDrive\Escritorio\Master's Thesis\Databases\Muestra Chile\"
use "base_Chile.dta"

*El periodo de comparacion es 2019 (mencionar efecto estallido social al final de 2019)
drop if agno<2019

keep if wave==2

*Estimacion outcome crime rate per 100.000 inhabitants
*Robo con fuerza de vehiculo motorizado
did_multiplegt_dyn vehiculostasa comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)

*Robo con fuerza
did_multiplegt_dyn fuerzatasa comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)

*Robo con violencia e intimidacion
did_multiplegt_dyn violenciatasa comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)

*DMCS
did_multiplegt_dyn DMCStasa comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)

*Homicides
did_multiplegt_dyn homicidiostasa comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)


*Estimacion outcome ln frecuency of total policy cases

*Se generan variables en logaritmo
gen ln_vehiculosfrecuencia=ln(vehiculosfrecuencia)
gen ln_fuerzafrecuencia=ln(fuerzafrecuencia)
gen ln_violenciafrecuencia=ln(violenciafrecuencia)
gen ln_DMCSfrecuencia=ln(DMCSfrecuencia)
gen ln_homicidiosfrecuencia=ln(homicidiosfrecuencia)

*Robo con fuerza de vehiculo motorizado
did_multiplegt_dyn ln_vehiculosfrecuencia comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)

*Robo con fuerza
did_multiplegt_dyn ln_fuerzafrecuencia comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)

*Robo con violencia e intimidacion
did_multiplegt_dyn ln_violenciafrecuencia comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)

*DMCS
did_multiplegt_dyn ln_DMCSfrecuencia comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)

*Homicides
did_multiplegt_dyn ln_homicidiosfrecuencia comuna fecha lockdown_exit, effects(3) placebo(2) cluster(comuna) weight(poblacion)



