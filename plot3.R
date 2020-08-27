plot3 <- function(){
  
  
  data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")
  subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  
  subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
  subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
  subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)
  
  timeNeeded <- strptime(paste(subdata$Date , subdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
  
  subdata <- cbind(subdata, timeNeeded)
  
  png("plot3.png",height = 480,width = 480)
  
  with(subdata, plot(timeNeeded, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
  lines(subdata$timeNeeded, subdata$Sub_metering_2,type="l", col= "red")
  lines(subdata$timeNeeded, subdata$Sub_metering_3,type="l", col= "blue")
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
  
  dev.off()
}