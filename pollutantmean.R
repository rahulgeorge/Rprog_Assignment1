pollutantmean <- function(directory = "specdata", pollutant = "sulfate", id = 1) {
        OriginDir <- getwd()
        setwd(directory)
        files <- list.files(pattern = "*.csv")
        goodData <- vector("numeric")
        for(i in 1:length(id)) {
                input <- read.csv(files[id[i]], header = TRUE)
                cleanCheck <- complete.cases(input[[pollutant]])
                goodData <- append(goodData, input[[pollutant]][cleanCheck])
        }
        result <- mean(goodData)
        setwd(OriginDir)
        result
}
