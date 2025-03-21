*******Do-file Mobility mechanism***********************************************
********************************************************************************
clear all
set more off


********************************************************************************

*Estimations********************************************************************
********************************************************************************

***Monthly
clear
cd "C:\Users\danil\OneDrive\Escritorio\Resultados\Mobility\"
use "mobility_lockdown_monthly.dta"

**Lockdown entry
*Outcome: IM sum
did_multiplegt_dyn monthly_im_sum comuna fecha lockdown, effects(6) cluster(comuna)

*Outcome: IM Interno sum
did_multiplegt_dyn monthly_imint_sum comuna fecha lockdown, effects(6) cluster(comuna)

*Outcome: IM Externo sum
did_multiplegt_dyn monthly_imext_sum comuna fecha lockdown, effects(6) cluster(comuna)

*Outcome: IM mean
did_multiplegt_dyn monthly_im_mean comuna fecha lockdown, effects(6) cluster(comuna)

*Outcome: IM Interno mean
did_multiplegt_dyn monthly_imint_mean comuna fecha lockdown, effects(6) cluster(comuna)

*Outcome: IM Externo mean
did_multiplegt_dyn monthly_imext_mean comuna fecha lockdown, effects(6) cluster(comuna)


**Lockdown exit
clear
cd "C:\Users\danil\OneDrive\Escritorio\Resultados\Mobility\"
use "mobility_lockdown_exit_monthly.dta"

*Outcome: IM sum
did_multiplegt_dyn monthly_im_sum comuna fecha lockdown_exit, effects(6) cluster(comuna)

*Outcome: IM Interno sum
did_multiplegt_dyn monthly_imint_sum comuna fecha lockdown_exit, effects(6) cluster(comuna)

*Outcome: IM Externo sum
did_multiplegt_dyn monthly_imext_sum comuna fecha lockdown_exit, effects(6) cluster(comuna)

*Outcome: IM mean
did_multiplegt_dyn monthly_im_mean comuna fecha lockdown_exit, effects(6) cluster(comuna)

*Outcome: IM Interno mean
did_multiplegt_dyn monthly_imint_mean comuna fecha lockdown_exit, effects(6) cluster(comuna)

*Outcome: IM Externo mean
did_multiplegt_dyn monthly_imext_mean comuna fecha lockdown_exit, effects(6) cluster(comuna)



***Daily
**Lockdown entry
clear
cd "C:\Users\danil\OneDrive\Escritorio\Resultados\Mobility\"
use "mobility_lockdown_daily.dta"

*Outcome: IM
did_multiplegt_dyn im comuna fecha lockdown, effects(25) placebo(7) cluster(comuna)

*Outcome: IM Interno
did_multiplegt_dyn im_interno comuna fecha lockdown, effects(25) placebo(7) cluster(comuna)

*Outcome: IM Externo
did_multiplegt_dyn im_externo comuna fecha lockdown, effects(25) placebo(7) cluster(comuna)


**Lockdown exit
clear
cd "C:\Users\danil\OneDrive\Escritorio\Resultados\Mobility\"
use "mobility_lockdown_exit_daily.dta"

*Outcome: IM
did_multiplegt_dyn im comuna fecha lockdown, effects(25) placebos(7) cluster(comuna)

*Outcome: IM Interno
did_multiplegt_dyn im_interno comuna fecha lockdown, effects(25) placebos(7) cluster(comuna)

*Outcome: IM Externo
did_multiplegt_dyn im_externo comuna fecha lockdown, effects(25) placebos(7) cluster(comuna)



