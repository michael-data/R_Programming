pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
  ## find the working directory with all the csv files.
  if(grep("specdata", directory) == 1) {  ##searcg for "somthing", x = single or list of character strings
    directory <- "specdata/"  ##list
  }
  
  mean_vector <- c()

  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  for(i in id) {
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    head(current_file)
    pollutant
    na_removed <- current_file[!is.na(current_file[, pollutant]), pollutant]
    mean_vector <- c(mean_vector, na_removed)
  }
  result <- mean(mean_vector)
  return(round(result, 3)) 
}
