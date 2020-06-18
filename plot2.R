#Loading data into R
hpc <- read.table("household_power_consumption.txt", header = T, 
                  sep = ";", na.strings = "?")

# convert the date variable to Date class
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

# Subset the data
hpc <- subset(hpc, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), "%Y-%m-%d %H:%M:%S")
hpc$datetime
# Plot
hpc$datetime <- as.POSIXct(hpc$datetime)

plot(hpc$Global_active_power ~ hpc$datetime ,type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

#save file
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()
