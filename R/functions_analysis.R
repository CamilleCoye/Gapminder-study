# cette fonction permet d'ouvrir les CSV sans transformer automatiquement les strings comme des facteurs

file_read <- function (fileName,...) {
  read.csv(fileName,header=TRUE, stringsAsFactors = FALSE)
}

#celle-ci réduit les données en olpitem I guess, ready to be plotted

summarise_data  <-  function (data) {
  rx  <-  range(data$lnGdpPercap)
  subset(data, lnGdpPercap %in% rx)
}

#celle-ci fait les figures à partir des données et du résumé fourni par la fonction au-dessus
makeFigure  <- function (data, lines_data) {
  ggplot() +
    geom_point(data = data, aes(x = lnGdpPercap, y = lnLifeExp, color = continent), alpha = 0.3) +
    geom_line(data = lines_data, aes(x = lnGdpPercap, y = predicted, color = continent)) + 
    labs(title = 'Whole time series', x = 'log(gdpPercap)', y = 'log(lifeExp)') + 
    theme_bw() +
    theme(plot.title = element_text(hjust = 0.5))
}
