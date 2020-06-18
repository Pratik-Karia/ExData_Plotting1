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
names(hpc)
# Plot
hpc$datetime <- as.POSIXct(hpc$datetime)

plot(hpc$Sub_metering_1 ~ hpc$datetime, type="l",
     ylab="Energy Sub metering", xlab="")
lines(hpc$Sub_metering_2 ~ hpc$datetime,col = "red")
lines(hpc$Sub_metering_3 ~ hpc$datetime,col="blue")
legend("topright",col = c("black","red","blue"), lty = 1, 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()