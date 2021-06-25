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