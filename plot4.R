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
##fourth
png("plot4.png", width = 480, height = 480) 
par(mfrow = c(2, 2)) 
with(newfile3, 
   {plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    plot(Time, Voltage, xlab = "datetime", type = "l", ylab = "Voltage") 
    ylimits = range(c(newfile3$Sub_metering_1, newfile3$Sub_metering_2, newfile3$Sub_metering_3)) 
    plot(Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", ylim = ylimits, col = "black") 
    par(new = TRUE) 
    plot(Time, Sub_metering_2, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "red") 
    par(new = TRUE) 
    plot(Time, Sub_metering_3, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "blue") 
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), 
    col = c("black", "red", "blue")) 
    plot(Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power") 
    }) 
dev.off() 

