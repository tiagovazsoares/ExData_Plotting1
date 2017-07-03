#retrieve dataset from local machine

datapower <- read.table("C:/Users/tvaz/Desktop/Coursera/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datapower_sub <- datapower[datapower$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(datapower_sub$Date, datapower_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(datapower_sub$Global_active_power)
globalReactivePower <- as.numeric(datapower_sub$Global_reactive_power)
voltage_sub <- as.numeric(datapower_sub$Voltage)
subMetering1 <- as.numeric(datapower_sub$Sub_metering_1)
subMetering2 <- as.numeric(datapower_sub$Sub_metering_2)
subMetering3 <- as.numeric(datapower_sub$Sub_metering_3)

setwd("C:/Users/tvaz/Desktop/Coursera/")

png("plot4.png", width=480, height=480)

#build a 2 by 2 plot (2 on the right and 2 on the left)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage_sub, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
