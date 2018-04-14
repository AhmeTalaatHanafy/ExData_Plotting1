##Plot 3
##loading the data
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

# convert the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data
data_2Days <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
data_2Days$datetime <- strptime(paste(data_2Days$Date, data_2Days$Time), "%Y-%m-%d %H:%M:%S")


#manipulating data-time values to return calendar format
data_2Days$datetime <- as.POSIXct(data_2Days$datetime)

# Plot 3
with(data_2Days, plot(Sub_metering_1 ~ datetime, type = "l", 
                      ylab = "Energy sub metering", xlab = ""))
lines(data_2Days$Sub_metering_2 ~ data_2Days$datetime, col = "Red")
lines(data_2Days$Sub_metering_3 ~ data_2Days$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()