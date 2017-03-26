# Exploratory Data Analysis 
# Project 1 - Plot 2 

getData <-  function(regex="^1/2/2007|^2/2/2007") {
  	datafile <- "./household_power_consumption.txt"
  	#datafile <- "./hnew.txt"
  	data <- read.table(datafile, header=TRUE, sep=";") 
  	data <- data[grep(regex, data$Date),]
  	data$Global_active_power <- as.numeric(data$Global_active_power)
  	data
}

# Plot2 Time vs Global Active Power
plot2 <- function ( ) {
	data <- getData()
	ts <- strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
	png("plot2.png", width=480, height=480)
	plot(ts, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
	dev.off()
}
