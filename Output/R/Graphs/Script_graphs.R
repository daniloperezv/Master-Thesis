###Script to plot graphs########################################################

rm(list =ls())

install.packages("readxl")
install.packages("ggplot2")
install.packages("hrbrthemes")

#Now, I load the Excel file with lockdown status

library("readxl")
data_lockdown <- read_excel("Cuarentenas Chile.xlsx")


data_graph=data.frame(data_lockdown$Fecha, data_lockdown$TOTAL)

#Graph
library(ggplot2)
library(hrbrthemes)
ggplot(data_graph, aes(x=data_lockdown$Fecha, y=data_lockdown$TOTAL)) +
  geom_line( color="black", size=1, alpha=0.9, linetype=1) +
  theme_gray() +
  labs(
    x = "Date",
    y = "Number of mMnicipalities",
    colour = "Gears"
  )


ggplot(newdata_202001) +
  geom_sf(aes(fill = vehiculosfrecuencia)) +
  theme_void()


###Graph evolution of crime national level

#Now, I load the dta file with evolution of crime variables
library("haven")
crime_national <- read_dta("crimen_nacional.dta")


#Graph
library(ggplot2)
library(hrbrthemes)
ggplot(crime_national, aes(x=fecha_formato, y=national_DMCS)) +
  geom_line(color="coral 1",size=1, alpha=0.9, linetype=1) +
  theme_bw() +
  ggtitle("DMCS")


ggplot(crime_national, aes(x=crime_national$fecha_formato, y=crime_national$national_fuerza)) +
  geom_line( color="coral 1", size=1, alpha=0.9, linetype=1) +
  theme_bw() +
  ggtitle("Fuerza")


ggplot(crime_national, aes(x=crime_national$fecha_formato, y=crime_national$national_violencia)) +
  geom_line( color="coral 1", size=1, alpha=0.9, linetype=1) +
  theme_bw() +
  ggtitle("Violencia e intimidacion")


ggplot(crime_national, aes(x=crime_national$fecha_formato, y=crime_national$national_vehiculos)) +
  geom_line( color="coral 1", size=1, alpha=0.9, linetype=1) +
  theme_bw() +
  ggtitle("Vehiculos")


ggplot(crime_national, aes(x=crime_national$fecha_formato, y=crime_national$national_homicidios)) +
  geom_line( color="coral 1", size=1, alpha=0.9, linetype=1) +
  theme_bw() +
  ggtitle("homicidios")


