# Read Data From File
alldata <- read.table("./household_power_consumption.txt", header=TRUE, sep=';', stringsAsFactors=FALSE, dec='.')

# Subsetting the data
twodaysdata <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot Graph
powerdata <- as.numeric(twodaysdata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(powerdata, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()