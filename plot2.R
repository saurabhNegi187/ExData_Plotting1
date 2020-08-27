plot2 <- function(){
  data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")
  subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  
  timeNeeded = strptime(paste(subdata$Date , subdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
  
  subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
  
  png("plot2.png",height = 480,width = 480)
  
  with(subdata,plot(timeNeeded,Global_active_power,type = "l",xlab = "Day",ylab = "Global Active Power (Kilowatts)"))
  
  dev.off()
}