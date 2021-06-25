
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

complete <- function(directory = "specdata", id = 1:332) {
        OriginDir <- getwd()
        setwd(directory)
        files <- list.files(pattern = "*.csv")
        filename <- vector("numeric", 0L)
        nobs <- vector("numeric", 0L)
        obs <- data.frame(filename, nobs)
        for(i in 1:length(id)) {
                input <- read.csv(files[id[i]], header = TRUE)
                cleanCheck <- complete.cases(input$sulfate,input$nitrate)
                goodData <- input$nitrate[cleanCheck]
                filename <- id[i]
                nobs <- sum(cleanCheck)
                tempObs <- data.frame(filename, nobs)
                obs <- rbind(obs,tempObs)
        }
        setwd(OriginDir)
        obs
}

corr <- function(directory = "specdata", threshold = 0, id = 1:332) {
        OriginDir <- getwd()
        setwd(directory)
        files <- list.files(pattern = "*.csv")
        result <- vector("numeric", 0L)
        check <- 0
        for(i in 1:length(id)) {
                input <- read.csv(files[id[i]], header = TRUE)
                cleanCheck <- complete.cases(input$sulfate,input$nitrate)
                goodData <- input[complete.cases(input),]
                nobs <- length(goodData$nitrate)
                if(nobs > threshold) {
                        tempResult <- cor(goodData$sulfate, goodData$nitrate, use = "everything")
                        result <- append(result, tempResult)
                        check <- check +1
                }
        }
        setwd(OriginDir)
        result
}