*******Do-file Unemployment mechanism*******************************************
********************************************************************************
clear all
set more off

********************************************************************************

*Estimations********************************************************************
********************************************************************************

*First wave + placebos
*Lockdown entry
clear
cd "C:\Users\danil\OneDrive\Escritorio\Resultados\Unemployment\"
use "unemployment_lockdown_monthly.dta"

*Outcome: Total workers per month 
did_multiplegt_dyn total_trabajadores_mes comuna fecha lockdown, effects(4) placebo(4) cluster(comuna)

*Outcome: Total workers per month / PET
did_multiplegt_dyn trabajadores_PET comuna fecha lockdown, effects(4) placebo(4) cluster(comuna)

*Lockdown exit
*Outcome: Total workers per month 
did_multiplegt_dyn total_trabajadores_mes comuna fecha lockdown_exit, effects(4) cluster(comuna)

*Outcome: Total workers per month / PET
did_multiplegt_dyn trabajadores_PET comuna fecha lockdown_exit, effects(4) placebo(4) cluster(comuna)



*Second wave
clear
cd "C:\Users\danil\OneDrive\Escritorio\Resultados\Unemployment\"
use "unemployment_lockdown_second.dta"

*Outcome: Total workers per month 
did_multiplegt_dyn total_trabajadores_mes comuna fecha lockdown, effects(5) cluster(comuna)

*Outcome: Total workers per month / PET
did_multiplegt_dyn trabajadores_PET comuna fecha lockdown, effects(5) cluster(comuna)

*Lockdown exit
*Outcome: Total workers per month 
did_multiplegt_dyn total_trabajadores_mes comuna fecha lockdown_exit, effects(4) cluster(comuna)

*Outcome: Total workers per month / PET
did_multiplegt_dyn trabajadores_PET comuna fecha lockdown_exit, effects(4) placebo(4) cluster(comuna)



