data <- read.table(file.choose(),header = T, sep = ";")
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
ActivePower <- as.numeric(data1$Global_active_power)

#1
hist(ActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#2
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
ActivePower2 <- as.numeric(data1$Global_active_power)
plot(datetime, ActivePower2, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#3
Metering1 <- as.numeric(data1$Sub_metering_1)
Metering2 <- as.numeric(data1$Sub_metering_2)
Metering3 <- as.numeric(data1$Sub_metering_3)


plot(datetime, Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Metering2, type="l", col="red")
lines(datetime, Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#4
ReactivePower <- as.numeric(data1$Global_reactive_power)
voltage <- as.numeric(data1$Voltage)
par(mfrow = c(2, 2)) 

plot(datetime, ActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Metering2, type="l", col="red")
lines(datetime, Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, ReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
