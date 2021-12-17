


#--------------------------------------------
#    Capitulo 1
#--------------------------------------------
  
# a continuacion se realizan algunos calculos aritmeticos


5+4
5-3
5*2
5/2

# Asignar valores a un objeto

my_var  <- 4
my_var  = 4

# Borrar un objeto

rm("mi_variable")


my_var


# Ejercicio


altura = 1.73
peso = 74

IMC = peso / (altura^2)
IMC = round(IMC,0)

peso = 24.9*(altura^2) 
peso


class(IMC)


x = "OscarAyala"

class(x)


# Creacion de vectores

numeric_vector <- c(1,10,49)

class(numeric_vector)

character_vector <- c("a","b","c")
class(character_vector)

boolean_vector <- c(TRUE, FALSE, T)
class(boolean_vector)


# colocar nombres a los vectores
mi_vector <- c("John Caicedo", "Jugador de poker")
names(mi_vector) <- c("Nombre", "Profesion")
names(mi_vector)


# colocar nombres a los vectores
mi_vector <- c("John Caicedo", "Jugador de poker", "Hombre", "Bogota")

mi_vector[c(2,1)]


# Ejercicio Casino

poker = c(140, -50 ,20 ,-120 ,240)
names(poker) = c("lunes", "martes","miercoles", "jueves", "viernes")
poker

ruleta = c(-24, -50, 100, -350, 10)
names(ruleta) = c("lunes", "martes","miercoles", "jueves", "viernes")
ruleta

mean(poker) + mean(ruleta) 

sum(poker) + sum(ruleta) 

poker

sum(poker)
sum(ruleta) 




condicion <- poker== max(poker)
poker[condicion]

condicion <- ruleta== max(ruleta)
ruleta[condicion]


condicion <- poker >= 0
poker[condicion]

condicion <- ruleta >= 0
ruleta[condicion]


# Matrices


1:9

my_matriz<-  matrix(1:9, byrow = T, nrow = 3)

colnames(my_matriz) <- c("x1", "x2", "x3")
row.names(my_matriz) <- c("Id1", "Id2", "Id3")

my_matriz

# Matriz[filas,columnas]


condicion <- my_matriz[,1] > 1



my_matriz1 <- my_matriz[condicion,1:2]


my_matriz
my_matriz1


# Ejercicio 2

nueva_esperanza <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306 , 165.8)


region <- c("EEUU", "Fuera EEUU")
titulos <- c("una nueva esperanza", "El Imperio Contraataca", "El regreso del jedi")


big_matrix <- rbind(nueva_esperanza, empire_strikes, return_jedi)

row.names(big_matrix) = titulos
colnames(big_matrix) = region

colSums(big_matrix)
rowSums(big_matrix)



colSums(big_matrix[1:2,])



x = 5

class(x)

x = as.factor(x)
x = as.character(x)

is.integer(x)


fecha <- "12/31/2021"
fecha <- "12/07/2021"
fecha <- '31/12/2021'

class(fecha)


fecha

nchar(fecha)
mes <- substr(fecha, start = 1, stop = 2)  
dia <- substr(fecha, start = 4, stop = 5)
anio <- substr(fecha, start = 7, stop = 10)

as.Date.character(fecha, tryFormats  = c("%Y-%m-%d"))



# Creando un data frame

entero <- c(1:4)
factor <- c("a","b","c","d")
numero <- c(1.2,3.4,4.5,5.6)
cadena <- as.character(c("a","b","c","d"))

mi_df <- data.frame(entero, factor, numero, cadena)
mi_df


str(mi_df)


mi_df[,1] <- as.factor(mi_df[,1])
mi_df[,1] <- as.numeric(mi_df[,1])


# Crear columnas
mi_df[,"New"] <- mi_df[,3]*0.81

raiz_numero <- sqrt(mi_df[,3])

sqrt(mi_df$numero)

raiz_numero

mi_df <- data.frame(mi_df, raiz_numero)

New2 <- mi_df$numero>4 

mi_df[New2,]


x1 <- mi_df[,3] 

# Crear nuevas variables condicionales

mi_df[,"X1"] <- mi_df[,3]

mi_df[,"X1"][mi_df[,3] < 4] <- 1
mi_df[,"X1"][mi_df[,3] > 4] <- 0
 
mi_df


