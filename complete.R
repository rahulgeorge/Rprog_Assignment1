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