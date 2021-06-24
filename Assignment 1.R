
pollutantmean <- function(directory = "/Users/rahulgeorge/Documents/Coursera/R Programming/Rprog_Assignment1/specdata", pollutant = "sulfate", id = 1) {
        OriginDir <- getwd()
        setwd(directory)
        temp <- list.files(pattern = "*.csv")
        goodData <- vector("numeric")
        for(i in 1:length(id)) {
                input <- read.csv(temp[id[i]], header = TRUE)
                cleanCheck <- complete.cases(input[[pollutant]])
                goodData <- append(goodData, input[[pollutant]][cleanCheck])
        }
        result <- mean(goodData)
        setwd(OriginDir)
        result
}
