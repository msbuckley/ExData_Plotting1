# Load data. This assumes that the data file is in the working directory
epc <- read.table('./household_power_consumption.txt', sep=";", header=TRUE)

# Get subset for dates between 2/1/2007 and 2/2/2007
epc$Date <- as.Date(epc$Date, format="%d/%m/%Y")
epc.sub <- epc[(epc$Date == "2007-02-01") | (epc$Date == "2007-02-02"), ]

# open png device and make histogram.
png(file = 'plot1.png')
par(mfrow=c(1,1)) #set layout
hist(as.numeric(as.character(epc.sub$Global_active_power)), 
     main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col="red")
dev.off()
