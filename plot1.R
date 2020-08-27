plot1 <- function(){
  
  
  subsetdata <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")
  
  subsetdata$Global_active_power <- as.numeric(subsetdata$Global_active_power)
  
  png("plot1.png", width=480, height=480)
  hist(subsetdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
  dev.off()
}