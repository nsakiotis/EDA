##read data
dataFull <- read.csv("household_power_consumption.txt", na.strings = "?", header = T, sep = ";", stringsAsFactors = F)
dataFull$Date <- as.Date(dataFull$Date, format="%d/%m/%Y")
## subset the data
data <- subset(dataFull, Date >= "2007-02-01" & Date <= "2007-02-02")
## merge cols Date and Time to a new col Datetime
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
##create the plot
with( data, {
        plot(data$Sub_metering_1~data$Datetime, type = "l", main="", ylab = "Energy sub metering", xlab = "" )
        lines(data$Sub_metering_2~data$Datetime, col = "red")
        lines(data$Sub_metering_3~data$Datetime, col = "blue")
    })
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2,)
## save to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()