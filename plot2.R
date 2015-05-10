##read data
dataFull <- read.csv("household_power_consumption.txt", na.strings = "?", header = T, sep = ";", stringsAsFactors = F)
dataFull$Date <- as.Date(dataFull$Date, format="%d/%m/%Y")
## subset the data
data <- subset(dataFull, Date >= "2007-02-01" & Date <= "2007-02-02")
## merge cols Date and Time to a new col Datetime
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
##create the plot
plot(data$Global_active_power~data$Datetime, type = "l", main="", ylab = "Global Active Power (kilowatts)", xlab = "" )
## save to png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()