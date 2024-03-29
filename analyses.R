library(lme4)
library(plyr)
library(dplyr)
library(ggplot2)
source('R/functions.R')

data  <-  file_read('data/gapminder-FiveYearData.csv') %>% mutate(lnLifeExp = log(lifeExp), lnGdpPercap = log(gdpPercap))

model  <-  lmer(lnLifeExp ~ lnGdpPercap + year + (1 | continent), data = data)

output_model  <-  coef(model)$continent
#en gros, tu ajoutes le $randomterm quand tu en as plusieurs en général, si tu n'en n'as qu'un, coef(model) te sortira l'output selon ton random factor
#Rq: ici, on a que l'intercept qui change entre les continents vu que c'est notre seul random term (lngdppercap & year being fixed terms)

lines_data  <-  data %>% mutate(predicted = predict(model)) %>% ddply(.(continent) , summarise_data)

makeFigure(data, lines_data)

