##Plot 4
# loading the the data
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

# Plot 4
#defining for places to plot over them
par(mfrow = c(2, 2)) #2row and 2cols with row respective 
#plot 4-1
with(data_2Days, plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", 
                      xlab = ""))
#plot 4-2
with(data_2Days, plot(Voltage ~ datetime, type = "l"))

#plot 4-3
with(data_2Days, plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", 
     xlab = ""))
lines(data_2Days$Sub_metering_2 ~ data_2Days$datetime, col = "Red")
lines(data_2Days$Sub_metering_3 ~ data_2Days$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

#plot 4-4
with(data_2Days, plot(Global_reactive_power ~ datetime, type = "l"))

##making a png file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()

