# Exploratory Data Analysis 
# Project 1 - Plot 1 

# get data
getData <-  function(regex="^1/2/2007|^2/2/2007") {
  	datafile <- "./household_power_consumption.txt"
  	data <- read.table(datafile, header=TRUE, sep=";") 
  	data <- data[grep(regex, data$Date),]
  	data$Global_active_power <- as.numeric(data$Global_active_power)
   	data
}


# plot 1 - Global Active Power
plot1 <- function ( ) {
	data <- getData()
	png("plot1.png", width=480, height=480)
	hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Glabal Active Power (kilowatts)", ylim = c(0,1200))
	dev.off()
}
