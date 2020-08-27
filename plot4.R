plot4 <- function(){
  
  data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")
  subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  
  timeNeeded <- strptime(paste(subdata$Date , subdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
  subdata <- cbind(subdata, timeNeeded)
  
  subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
  subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
  subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)
  subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
  subdata$Global_reactive_power <- as.numeric(subdata$Global_reactive_power)
  subdata$Voltage <- as.numeric(subdata$Voltage)
  
  png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  with(subdata, plot(timeNeeded, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
  with(subdata, plot(timeNeeded, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
  with(subdata, plot(timeNeeded, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
  lines(subdata$timeNeeded, subdata$Sub_metering_2,type="l", col= "red")
  lines(subdata$timeNeeded, subdata$Sub_metering_3,type="l", col= "blue")
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
  with(subdata, plot(timeNeeded, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
  dev.off()
}