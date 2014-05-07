## Assumes that working directory is set data file location
epc <- read.table('./household_power_consumption.txt', sep=";", header=TRUE)
epc$Date <- as.character(epc$Date)
epc$Time <- as.character(epc$Time)
epc.sub <- epc[(epc$Date == "1/2/2007") | (epc$Date == "2/2/2007"), ]
date_times <- strptime(paste(epc.sub$Date, epc.sub$Time), "%d/%m/%Y %T")

png(file = 'plot2.png')
plot(date_times,as.numeric(as.character(epc.sub$Global_active_power)), type="l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()

