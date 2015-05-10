##read data
dataFull <- read.csv("household_power_consumption.txt", na.strings = "?", header = T, sep = ";", stringsAsFactors = F)
dataFull$Date <- as.Date(dataFull$Date, format="%d/%m/%Y")
## subset the data
data <- subset(dataFull, Date >= "2007-02-01" & Date <= "2007-02-02")
## merge cols Date and Time to a new col Datetime
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
##create the plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with( data, {
    plot(data$Global_active_power~data$Datetime, type = "l", main="", ylab = "Global Active Power (kilowatts)", xlab = "" )
    plot(data$Voltage~data$Datetime, type = "l", main="", ylab = "Global Active Power (kilowatts)", xlab = "datetime" )
    plot(data$Sub_metering_1~data$Datetime, type = "l", main="", ylab = "Energy sub metering", xlab = "" )
    lines(data$Sub_metering_2~data$Datetime, col = "red")
    lines(data$Sub_metering_3~data$Datetime, col = "blue")
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2,bty="n")
    plot(data$Global_reactive_power~data$Datetime, type = "l", main="", ylab = "Global_reactive_power", xlab = "datetime" )
    axis(side=2, at=seq(0.0, 0.5, by=0.1), labels=seq(0.0,0.5,0.1))
})

## save to png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()