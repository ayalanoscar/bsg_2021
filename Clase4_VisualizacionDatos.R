
backolan <- read.csv("C:/R/R/backloan1.csv")

backolan <- read.csv("C:/Users/sepul/Downloads/bsg_2021-main/backloan1.csv")


head(backolan)


boxplot(backolan$employ)


# Comparacion de categorias

boxplot(backolan$employ~ backolan$default, main = " Box plot de la antiguedad laboral",
        ylab = "Antiguedad laboral", xlab = "Caer en mora")



boxplot(backolan$income~ backolan$default, main = " Box plot del ingreso",
        ylab = "Ingreso", xlab = "Caer en mora")

dim(backolan)






# Busqueda de los puntos atipicos

b1 <- boxplot(backolan$income)

# cuales son los atipcicos
b1$out

(72/1059)*2000000

# ubico el valor atipico
condicion <- backolan$income >400 

backolan[condicion,]

backolan[639,]


# imputar valores atipicos
promedio <- mean(backolan$income)
promedio

# imputacion con el promedio
backolan[639,5] <- promedio





# Calculos de medias por grupos 
install.packages("Rmisc")
library(Rmisc)



summarySE(data = backolan, measurevar = "employ", groupvars = "default")
summarySE(data = backolan, measurevar = "income", groupvars = "default")


# Prueba de diferencias de medias

t.test(backolan$income ~ backolan$default )
t.test(backolan$employ ~ backolan$default )
t.test(backolan$address ~ backolan$default )
t.test(backolan$creddebt ~ backolan$default )
t.test(backolan$othdebt ~ backolan$default )





# Modelo basico de regresion logistica
modelo <- glm(backolan$default ~ ., data = backolan, family = "binomial" )
summary(modelo)






df.g1 <- summarySE(data=backolan, measurevar = "employ", 
                   groupvars = "default" , na.rm = T)


# Grafico del intervalo de confianza

library(ggplot2)
graf1 <- ggplot(data=df.g1, aes(x=default, y=employ)) + geom_point() + 
  geom_errorbar(aes(ymin=employ-ci, ymax=employ+ci), width=0.2) +
  xlab("") + ylab("Anitguedad laboral") +
  ggtitle("Intervalo de confianza al 95%") + theme_bw()



df.g2 <- summarySE(data=backolan, measurevar = "income", 
                   groupvars = "default" , na.rm = T)


graf2 <- ggplot(data=df.g2, aes(x=default, y=income)) + geom_point() + 
  geom_errorbar(aes(ymin=income-ci, ymax=income+ci), width=0.2) +
  xlab("") + ylab("Ingresos") +
  ggtitle("Intervalo de confianza al 95%") + theme_bw()


