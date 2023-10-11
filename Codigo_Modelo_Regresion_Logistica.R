
#Leer datos
seguro1 <- read.csv("C:/R/R/SEGURO1.csv", sep = ";", header = T)



# Borrar datos con valores perdidos

seguro1 = na.omit(seguro1)



# cargar librerias


install.packages("rpart")
install.packages("dplyr")
install.packages("caret")
library(caret)
library(rpart)
library(dplyr)

head(data)


# Codigo para crear las muestras
seguro_train <- sample_frac(seguro1, .7)
seguro_test <- setdiff(seguro1, seguro_train)



# codigo para el algorimo
reg_logist <- glm(Ins ~. , data = seguro_train, family = "binomial")

summary(reg_logist)


# codigo para la prediccion

predicciones_train=as.factor(ifelse(test = reg_logist$fitted.values > 0.35, yes = 1, no = 0))


observaciones_train=as.factor(seguro_train$Ins)

#tabla cruzada
table(observaciones_train,predicciones_train)


