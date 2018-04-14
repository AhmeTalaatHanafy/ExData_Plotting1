#Plot 2 
## loading the data
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
# Plot 2
with(data_2Days, plot(Global_active_power ~ datetime, type = "l",
                      ylab = "Global Active Power (kilowatts)", xlab = "")) 
#making a png file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()