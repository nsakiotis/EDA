##read data
dataFull <- read.csv("household_power_consumption.txt", na.strings = "?", header = T, sep = ";", stringsAsFactors = F)
dataFull$Date <- as.Date(dataFull$Date, format="%d/%m/%Y")
## subset the data
data <- subset(dataFull, Date >= "2007-02-01" & Date <= "2007-02-02")
##create the histogramm
hist(data$Global_active_power, col = "red", main="Global Active Power", breaks = 12, xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
## save to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()