data <- read.table("household_power_consumption.txt", sep=";", header=T)
data$Date <- strptime(data$Date, format="%d/%m/%Y")
period.start <- strptime("01/02/2007", format="%d/%m/%Y")
period.end <- strptime("02/02/2007", format="%d/%m/%Y")
data.selected <- data[(period.start <= data$Date) &  (data$Date <= period.end),]