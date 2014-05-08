# Load data. This assumes that the data file is in the working directory
epc <- read.table('./household_power_consumption.txt', sep=";", header=TRUE)

# Get subset for dates between 2/1/2007 and 2/2/2007
epc$Date <- as.character(epc$Date)
epc.sub <- epc[(epc$Date == "1/2/2007") | (epc$Date == "2/2/2007"), ]

#make a vector of date/times for the plot
epc.sub$Time <- as.character(epc.sub$Time)
date_times <- strptime(paste(epc.sub$Date, epc.sub$Time), "%d/%m/%Y %T")

# open png device and make plot.
png(file = 'plot2.png')
par(mfrow=c(1,1)) #set layout
plot(date_times,
     as.numeric(as.character(epc.sub$Global_active_power)), 
     type="l", 
     xlab="", 
     ylab = "Global Active Power (kilowatts)")
dev.off()

