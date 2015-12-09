## Directory
setwd("E:/UNIVERAS/coursera/Explaratory Data Analysis/Project1")
## reading raw data
newFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 2075259, stringsAsFactors=FALSE,  as.is=TRUE)
## date format
newFile$Date <- as.Date(newFile$Date , "%d/%m/%Y")
## subset of data by date
newfile2 <- newFile[newFile$Date >= "2007-02-01" & newFile$Date <= "2007-02-02", ]
##first
png("plot1.png", width = 480, height = 480) 
hist(newfile2$Global_active_power, main = "Global Active power", col = "red", xlab = "Global Active Power (kilowatts)") 
dev.off() 
