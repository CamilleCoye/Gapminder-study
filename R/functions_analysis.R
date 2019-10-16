file_read <- function () {
  read.csv(fileName,header=TRUE, stringsAsFactors = FALSE)
}

# cette fonction permet d'ouvrir les CSV sans transformer automatiquement les strings comme des facteurs
