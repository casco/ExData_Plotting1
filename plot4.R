
data <- read.table("household_power_consumption.txt", sep=";", header=T,
                   colClasses=c(rep("character",2),rep("numeric",7)),
                   na.strings = "?")

data$Date <- strptime(data$Date, format="%d/%m/%Y")
period.start <- strptime("01/02/2007", format="%d/%m/%Y")
period.end <- strptime("02/02/2007", format="%d/%m/%Y")
data.selected <- data[(period.start <= data$Date) &  (data$Date <= period.end),]


#Plot 4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

#Upper left
par(xaxt = 'n')
plot(data.selected$Global_active_power, type="l", ylab="Global Active Power", xlab="")
par(xaxt = 's')
axis(1, labels=c("Thu", "Fri", "Sat"), at=c(1, nrow(data.selected) / 2, nrow(data.selected)))

#Upper right
par(xaxt = 'n')
plot(data.selected$Voltage, type="l", ylab="Voltage", xlab="", sub="datetime")
par(xaxt = 's')
axis(1, labels=c("Thu", "Fri", "Sat"), at=c(1, nrow(data.selected) / 2, nrow(data.selected)))

#Lower left
par(xaxt = 'n')
plot(data.selected$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(data.selected$Sub_metering_1)
lines(data.selected$Sub_metering_2, col="red")
lines(data.selected$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),
       bty = "n", col=c("black","red", "blue"),cex=0.8)
par(xaxt = 's')
axis(1, labels=c("Thu", "Fri", "Sat"), at=c(1, nrow(data.selected) / 2, nrow(data.selected)))

#lower right
par(xaxt = 'n')
plot(data.selected$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="", sub="datetime")
par(xaxt = 's')
axis(1, labels=c("Thu", "Fri", "Sat"), at=c(1, nrow(data.selected) / 2, nrow(data.selected)))

dev.off()


