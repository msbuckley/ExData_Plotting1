## Assumes that working directory is set data file location
epc <- read.table('./household_power_consumption.txt', sep=";", header=TRUE)
epc$Date <- as.Date(epc$Date, format="%d/%m/%Y")
epc.sub <- epc[(epc$Date == "2007-02-01") | (epc$Date == "2007-02-02"), ]

png(file = 'plot1.png')
hist(as.numeric(as.character(epc.sub$Global_active_power)), main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()
