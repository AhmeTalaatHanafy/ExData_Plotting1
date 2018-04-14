#Plot 1

## loading the data
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
# convert the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data for 1&2 -7-2007
data_2Days <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
data_2Days$datetime <- strptime(paste(data_2Days$Date, data_2Days$Time), "%Y-%m-%d %H:%M:%S")

#converting into neumeric values 
data_2Days$Global_active_power <- as.numeric(data_2Days$Global_active_power)
# Plot 1st histogram 
hist(data_2Days$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# Save to a png file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
