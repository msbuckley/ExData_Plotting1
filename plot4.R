# Load data. This assumes that the data file is in the working directory
epc <- read.table('./household_power_consumption.txt', sep=";", header=TRUE)

# Get subset for dates between 2/1/2007 and 2/2/2007
epc$Date <- as.character(epc$Date)
epc.sub <- epc[(epc$Date == "1/2/2007") | (epc$Date == "2/2/2007"), ]

#make a vector of date/times for the plot
epc.sub$Time <- as.character(epc.sub$Time)
date_times <- strptime(paste(epc.sub$Date, epc.sub$Time), "%d/%m/%Y %T")

# convert factor data to numeric
active.power <- as.numeric(as.character(epc.sub$Global_active_power))
voltage <- as.numeric(as.character(epc.sub$Voltage))
reactive.power <- as.numeric(as.character(epc.sub$Global_reactive_power))
sub.1 <- as.numeric(as.character(epc.sub$Sub_metering_1)) 
sub.2 <- as.numeric(as.character(epc.sub$Sub_metering_2))
sub.3 <- as.numeric(as.character(epc.sub$Sub_metering_3))

# open png device and make plots.
png(file = 'plot4.png')
par(mfrow=c(2,2)) #set layout

## plot 1
plot(date_times, active.power, type='l', xlab="", ylab="Global Active Power")

## plot 2
plot(date_times, voltage, type='l', xlab="datetime", ylab="Voltage")

## plot 3
plot(date_times, sub.1, type='l', col="black", xlab="", ylab="Energy sub metering")
lines(date_times, sub.2, type='l', col="red")
lines(date_times, sub.3, type='l', col="blue")
legend("topright", 
       bty="n", 
       lty=1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot 4
plot(date_times, reactive.power, type='l', xlab="datetime", ylab="Global_reactive_power")
dev.off()
