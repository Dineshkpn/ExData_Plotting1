# Read Data From File
alldata <- read.table("./household_power_consumption.txt", header=TRUE, sep=';', stringsAsFactors=FALSE, dec='.')

# Subsetting the data
twodaysdata <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(twodaysdata$Date, twodaysdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
powerdata <- as.numeric(twodaysdata$Global_active_power)
reactivedata <- as.numeric(twodaysdata$Global_reactive_power)
voltage <- as.numeric(twodaysdata$Voltage)
meteringdata1 <- as.numeric(twodaysdata$Sub_metering_1)
meteringdata2 <- as.numeric(twodaysdata$Sub_metering_2)
meteringdata3 <- as.numeric(twodaysdata$Sub_metering_3)

# Plot Graph
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(datetime, powerdata, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, submeteringdata1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submeteringdata2, type="l", col="red")
lines(datetime, submeteringdata3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=3, bty='n')

plot(datetime, reactivedata, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()