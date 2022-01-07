

# Codigo R para la clase 2 (6/Ene/2022)


install.packages("tidyverse")
library(tidyverse)


backloan <- read.csv("C:/Users/oscarayala/Documents/R/backloan1.csv", header = TRUE, sep = "," ) 


install.packages("dslabs")
library(dslabs)


data(gapminder)

head(gapminder)
head(backloan)

# tipos de datos

str(gapminder)
str(backloan)

# Analisis descriptivos


mean(backloan$employ)
mean(backloan[,3])

summary(backloan[,3])
summary(gapminder$population/1000)
summary(gapminder$life_expectancy)


summary(backloan)


table(backloan$ed)

backloan$ed = as.factor(backloan$ed)
backloan$default = as.factor(backloan$default)


str(backloan)


gapminder %>%
  filter(country == "Peru") %>%
  select(country, year, infant_mortality, population)



# Seleccionar condiciones con dos variables
gapminder %>%
  filter(country == "Peru" & year == 2015) %>%
  select(country, year, infant_mortality, population)

# seleccionando mas de un valor en una lista


vector_paises =c("Peru","Chile")

gapminder %>%
  filter(country %in% vector_paises & year == 2015) %>%
  select(country, year, infant_mortality, population)


# Graficar un diagrama de dispersion

attach(gapminder)

gapminder %>%
  filter(year == 2015 ) %>% 
  ggplot() + aes(x = fertility, y = life_expectancy) + geom_point()



gapminder %>%
  filter(year == 1990 ) %>% 
  ggplot() + aes(x = fertility, y = life_expectancy , color = continent) + geom_point()


# agrear una cuarta variable

vector_años <- c(1960,1985, 2013)

gapminder %>%
  filter(year %in% vector_años )  %>%
  ggplot() + aes(x = fertility, y = life_expectancy , color = continent) + geom_point() + facet_grid(year ~ .) 


# Filtrando por continente
gapminder %>%
  filter(year %in% vector_años & continent == "Africa")  %>%
  ggplot() + aes(x = fertility, y = life_expectancy , color = continent) + geom_point() + facet_grid(year ~ .) 




#Grafico de lineas de series de tiempo


gapminder %>%
  filter(country == "Peru" ) %>% 
  ggplot() + aes(x = year, y = fertility ) + geom_line()



gapminder %>%
  filter(country == "Peru"& year > 2010  ) %>% 
  ggplot() + aes(x = year, y = life_expectancy ) + geom_line()


gapminder %>%
  filter(country == "Colombia"   ) %>% 
  ggplot() + aes(x = year, y = life_expectancy ) + geom_line() 



gapminder[country == "Colombia",]

gapminder %>%
  filter(country == "Colombia"   ) %>% 
  
  
colombia <- gapminder[country == "Colombia",]
Peru <- gapminder[country == "Peru",]

# Grafico comparitivo de dos lienas.

plot(x = colombia$year, y = colombia$life_expectancy , type = "l")
lines(x = Peru$year, y = Peru$life_expectancy , type = "l" , col = 2)



paises = c("Peru", "Colombia", "Venezuela", "Chile", "Bolivia")


gapminder %>%
  filter(country %in% paises )  %>%
  ggplot() + aes(x = year, y = fertility , color = country) + geom_line()




paises <- c("United States", "Vietnam")

gapminder$population <- gapminder$population/1000000

gapminder %>%
  filter(country %in% paises & year >= 1955 & year <= 1990)  %>%
  ggplot() + aes(x = year, y = population , color = country) + geom_line()


paises <- c("United States", "Vietnam", "Cambodia")


gapminder %>%
  filter(country %in% paises & year >= 1955 & year <= 1990)  %>%
  ggplot() + aes(x = year, y = life_expectancy , color = country) + geom_line()



# Ordenar datos por una variable

gapminder %>%
  filter(year == 2015)  %>%
  select(country, continent, infant_mortality) %>%
  arrange(desc(infant_mortality))

# Grafico de BoxPlot

boxplot(backloan$employ ~ backloan$default)
boxplot(backloan$income ~ backloan$default)
boxplot(backloan$address ~ backloan$default)



gapminder %>%
  filter(year == 2015)  %>%
  select(country, infant_mortality, continent) %>%
  arrange(infant_mortality) %>%
  ggplot() + aes(continent, infant_mortality) + geom_boxplot()




gapminder %>%
  filter(year == 2015)  %>%
  select(country, life_expectancy, continent) %>%
  arrange(life_expectancy) %>%
  ggplot() + aes(continent, life_expectancy) + geom_boxplot()


gapminder %>%
  filter(year == 2015)  %>%
  select(country, population, continent) %>%
  arrange(population) %>%
  ggplot() + aes(continent, population) + geom_boxplot() + ylim(0, 350)



ggplot() + aes(backloan$default, backloan$employ) + geom_boxplot()


length(continent)
length(infant_mortality)

# Crear variables nuevas

gapminder %>%
  mutate(pbi_percapita_por_dia <- gdp / population / 365/1000000)

head(gapminder)

mutate( gapminder, new1 <-  ifelse(population >100 , 1, 0))




gapminder %>% 
  mutate(pbi_percapita_por_dia <- gdp / population / 365/1000000) %>%
  filter(year == 2010) %>%
  ggplot() + aes (pbi_percapita_por_dia <- gdp/population/365/1e+06, colour = continent )  + geom_density()



gapminder %>% 
  filter(year == 2010) %>%
  ggplot() + aes (life_expectancy, colour = continent )  + geom_density()

















