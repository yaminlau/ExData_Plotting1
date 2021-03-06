# Exploratory Data Analysis 
# Project 1 - Plot 3


# get data
getData <-  function(regex="^1/2/2007|^2/2/2007") {
  
  	datafile <- "./household_power_consumption.txt"
  	#datafile <- "./hnew.txt"
  	data <- read.table(datafile, header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE) 
  	data <- data[grep(regex, data$Date),]
  	data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
  	data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
  	data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
  	data
}


#plot3
plot3 <- function ( ){
	data <- getData()
	ts <- strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
	png("plot3.png", width=480, height=480)
	plot(ts, data$Sub_metering_1, type ="l", xlab="", ylab="Energy sub metering")
	lines(ts, data$Sub_metering_2, type = "l", col="red")
	lines(ts, data$Sub_metering_3, type = "l", col="blue")
	legend("topright", pch ="-", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	dev.off()
}
