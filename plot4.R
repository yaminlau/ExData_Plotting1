# Exploratory Data Analysis 
# Project 1 - Plot 4


#get data
getData <-  function(regex="^1/2/2007|^2/2/2007") {
  
  	datafile <- "./household_power_consumption.txt"
  	data <- read.table(datafile, header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE) 
  	data <- data[grep(regex, data$Date),]
  	data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
  	data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
  	data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
  	data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
  	data$Voltage <- as.numeric(data$Voltage)
  	data <- data[grep(regex, data$Date),]
  	data
}


# plot4 
plot4 <- function () {
	data <- getData()
	ts <- strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
	png("plot4.png", width=480, height=480)
	par(mfrow=c(2,2))
	plot(ts, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
	plot(ts, data$Voltage, type ="l", xlab="datetime", ylab="Voltage")
	plot(ts, data$Sub_metering_1, type ="l", xlab="", ylab="Energy sub metering")
	lines(ts, data$Sub_metering_2, type = "l", col="red")
	lines(ts, data$Sub_metering_3, type = "l", col="blue")
	legend("topright", pch="-", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	plot(ts, data$Global_reactive_power, type ="l", xlab="datetime", ylab="Global_reactive_power")
	dev.off()
}
