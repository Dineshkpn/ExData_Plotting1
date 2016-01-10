# Read Data From File
alldata <- read.table("./household_power_consumption.txt", header=TRUE, sep=';', stringsAsFactors=FALSE, dec='.')

# Subsetting the data
twodaysdata <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot Graph
datetime <- strptime(paste(twodaysdata$Date, twodaysdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
powerdata <- as.numeric(twodaysdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, powerdata, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()