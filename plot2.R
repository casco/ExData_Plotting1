
data <- read.table("household_power_consumption.txt", sep=";", header=T,
                   colClasses=c(rep("character",2),rep("numeric",7)),
                   na.strings = "?")

data$Date <- strptime(data$Date, format="%d/%m/%Y")
period.start <- strptime("01/02/2007", format="%d/%m/%Y")
period.end <- strptime("02/02/2007", format="%d/%m/%Y")
data.selected <- data[(period.start <= data$Date) &  (data$Date <= period.end),]


#Plot 2
png(file = "plot2.png", width = 480, height = 480)
par(xaxt = 'n')
plot(data.selected$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
par(xaxt = 's')
axis(1, labels=c("Thu", "Fri", "Sat"), at=c(1, nrow(data.selected) / 2, nrow(data.selected)))
dev.off()
