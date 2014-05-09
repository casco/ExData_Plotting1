
data <- read.table("household_power_consumption.txt", sep=";", header=T,
                   colClasses=c(rep("character",2),rep("numeric",7)),
                   na.strings = "?")

data$Date <- strptime(data$Date, format="%d/%m/%Y")
period.start <- strptime("01/02/2007", format="%d/%m/%Y")
period.end <- strptime("02/02/2007", format="%d/%m/%Y")
data.selected <- data[(period.start <= data$Date) &  (data$Date <= period.end),]

#Plot 1
png(file = "plot1.png", width = 480, height = 480)
hist(data.selected$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

