# Read Data From File
alldata <- read.table("./household_power_consumption.txt", header=TRUE, sep=';', stringsAsFactors=FALSE, dec='.')

# Subsetting the data
twodaysdata <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(twodaysdata$Date, twodaysdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Plot Graph
submeteringdata1 <- as.numeric(twodaysdata$Sub_metering_1)
submeteringdata2 <- as.numeric(twodaysdata$Sub_metering_2)
submeteringdata3 <- as.numeric(twodaysdata$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, submeteringdata1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submeteringdata2, type="l", col="red")
lines(datetime, submeteringdata3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=3)
dev.off()