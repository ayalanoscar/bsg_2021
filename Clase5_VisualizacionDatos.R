# 27/Enero / 2022

# Pasos para instalar librerias y y hacer upload en R.

install.packages("shiny")
library(shiny)
runExample("01_hello")

library(Rcpp)
install.packages("Rcpp")

help(package="Rcpp")

library(Rcpp)

# Bajar libreria 

detach("package:Rcpp", unload = TRUE)

# Ver version de R
R.version

# Libreria para instalar R desde Rstudio
install.packages("installr", dependencies = T)
library(installr)
updateR()


install.packages("shiny", dependencies = T)



# Correlacion de variables continuas


install.packages("PerformanceAnalytics", dependencies = T)
library(PerformanceAnalytics)


install.packages("corrplot")
library(corrplot)


install.packages("InformationValue")
library(InformationValue)


# funcion para calcular correlaciones entre variables continuas

head(backolan)

cor(backolan[,c(1,3,4, 5, 7)])


# grafico para ver las correlaciones entre variables continuas


chart.Correlation(backolan[,c(1,3,4, 5, 7)])

chart.Correlation(backolan[,c(3,4, 5, 9)])

# prueba de hipotesis para ver las correlaciones entre variables continuas

cor.test(backolan[,3], backolan[,5])




mat_cor <- cor(backolan[,c(1,3,4, 5, 7)])
mat_cor <- cor(backolan)

# Otro grafico para ver la correlacion
corrplot(mat_cor,  method = "number") 

corrplot.mixed(mat_cor)


# Relación de variables

library(InformationValue)


# Categorizar una variable

head(backolan)

boxplot(backolan$employ)
boxplot(backolan$creddebt)


summary(backolan$employ)

cortes <- c(-0.1,3,7,31)

antig_laboral <- cut(backolan$employ, cortes)

table(antig_laboral)

# Tabla cruzada (Similar tabla dinamica)
table(antig_laboral, backolan$default)

prop.table(table(antig_laboral, backolan$default),2)

# Pesos de las categorias
round(prop.table(table(antig_laboral))*100 , 1)

# ver la estructura de datos por columna (se coloca , 2) y para ver por fila se coloca ,1
round(prop.table(table(antig_laboral, backolan$default),2)*100, 1)


# Calcular el information value de dos variables
IV(antig_laboral, backolan$default)

# Calcular tabla WOE = weigth of evidence
WOETable(antig_laboral, backolan$default)



IV(as.factor(backolan$ed), backolan$default)


round(prop.table(table(backolan$ed))*100 , 1)



# Otra variable
summary(backolan$income)

cortes <- c(0,50,253)

income <- cut(backolan$income, cortes)

table(income)

# Tabla cruzada (Similar tabla dinamica)
table(income, backolan$default)

prop.table(table(income, backolan$default),2)

# Pesos de las categorias
round(prop.table(table(income))*100 , 1)

# ver la estructura de datos por columna (se coloca , 2) y para ver por fila se coloca ,1
round(prop.table(table(income, backolan$default),1)*100, 1)


# Calcular el information value de dos variables
IV(income, backolan$default)









