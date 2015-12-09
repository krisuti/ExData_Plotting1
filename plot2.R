## Directory
setwd("E:/UNIVERAS/coursera/Explaratory Data Analysis/Project1")
## reading raw data
newFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 2075259, stringsAsFactors=FALSE,  as.is=TRUE)
## date format
newFile$Date <- as.Date(newFile$Date , "%d/%m/%Y")
## subset of data by date
newfile3 <- newFile[newFile$Date >= "2007-02-01" & newFile$Date <= "2007-02-02", ]
newfile3$Time <- paste(newfile3$Date, newfile3$Time, sep=" ")
newfile3$Time <- strptime(newfile3$Time, "%Y-%m-%d %H:%M:%S")

##second
png("plot2.png", width = 480, height = 480) 
plot(newfile3$Time, newfile3$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l") 
dev.off() 

