#Clear all variables
rm(list = ls())

#Read the data
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
#Convert the dates to Date class for subsetting
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Date and Time Conversion
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#Plot 1
attach(data)
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

#Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(data)