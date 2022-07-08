
#Lectura de datos
backloan <- read.csv("C:/R/R/backloan1.csv")




head(backloan)

# Grafico de BoxPlot
boxplot(backloan$employ )
boxplot(backloan$employ ~ backloan$default)

# Metricas de Boxplot
summary(backloan$employ)


boxplot(backloan$income ~ backloan$default)

#Instalar libreria nueva
install.packages("InformationValue") 


library(InformationValue)


# Crear cortes
cortes = c(0,3,10, 33)
# categorizar la variable
cat_employ = cut(backloan$employ , cortes)



head(cat_employ)
# calculo de frecuencias
table(cat_employ)

round(prop.table(table(cat_employ))*100,1)


#Calculo  del information value

IV(cat_employ, backloan$default)
WOETable(cat_employ, backloan$default)
table(backloan$default)



rm("seguro2")
rm("set1")
rm("set2")

#Leer una segunda tabla de datos.
seguro <- read.csv("C:/R/R/SEGURO1.csv", sep = ";", header = T)


head(seguro)

prop.table(table(seguro$Ins))


# Dividir la data en train y test


set.seed(1111)

library(dplyr)



seguro_train <- sample_frac(seguro, 0.7)
seguro_test <- setdiff(seguro, seguro_train)

dim(seguro_train)
dim(seguro_test)


# Ver valores perdidos
colSums(is.na(seguro_train))




str(seguro)

attach(seguro)

# Crear modelo
model1 <- glm(Ins ~  Checks , data = seguro_train, family = "binomial")
model1.1 <- glm(Ins ~  Checks  + CC , data = seguro_train, family = "binomial")


summary(model1.1)

model2 <- glm(Ins ~ Checks + DDA +DDABal + Sav + SavBal + MM + MMBal, data = seguro_train, family = "binomial")

summary(model1)
summary(model2)

model1$coefficients

# Exponente de los coeficientes de estimacion.
# Si el exp = 1 entonces no hay ningun efecto. 
# Si exp > 1 entonces es un factor de riesgo
# Si exp < 1 entonces es un factor protector. 
round(exp(model1$coefficients),2)

boxplot(seguro$Checks ~ seguro$Ins)

head(model1$fitted.values)
head(model2$fitted.values)

round(exp(model2$coefficients),6)


# Predecir tabla train

# Frecuencia de los que compran.
round(prop.table(table(seguro$Ins))*100,0)


predicciones_train1=as.factor(ifelse(test = model1$fitted.values > 0.8, yes = 1, no = 0))
predicciones_train2=as.factor(ifelse(test = model2$fitted.values > 0.8, yes = 1, no = 0))

head(predicciones_train1)
head(seguro_train$Ins)


head(predicciones_train2)

length(predicciones_train1)
length(predicciones_train2)

# Calcuo real de la tasa de compra del 35%
round(prop.table(table(seguro$Ins))*100,0)

# Matriz De confusion
table(predicciones_train2 , seguro_train$Ins)

head(seguro)

length(predicciones_train1)
length(seguro_train$Ins)

install.packages("caret")
library(caret)



# Predecir tabla test

predicciones_test1= as.factor(ifelse(test = (predict(model1, seguro_test, type = "response")) > 0.35, yes = 1, no = 0))
predicciones_test2= as.factor(ifelse(test = (predict(model2, seguro_test, type = "response")) > 0.35, yes = 1, no = 0))

# Matriz De confusion en el test
table(predicciones_test2 , seguro_test$Ins)


library(rpart)

arbol1 <- rpart(formula = Ins ~ . , data = seguro_train)
pred_arbol_test=as.factor(ifelse(test = (predict(arbol1, newdata = seguro_test, type = "vector")) > 0.35, yes = 1, no = 0))
# Matriz De confusion en el test con arboles de decision
table(pred_arbol_test , seguro_test$Ins)

