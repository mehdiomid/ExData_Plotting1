## A R scrip to read file and create a plot, which consists of four smaller plots 
##
plot4 <- function() {
  ## read data
  data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                     na.strings="?",colClasses=c("character", "character",rep("numeric",7)))
  ##
  ## subsetting data for dates btween 1/2/2007 and 2/2/2007
  
  mydata <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
  mydata$Date <- paste(mydata$Date,data2$Time,sep=" ")
  mydata$Date <- strptime(mydata$Date,"%d/%m/%Y %H:%M:%S")
  ##
  ## creating plot 4 as PNG file
  ## plot 4 is itself including four plots
  ##
  png(file="plot4.png",width = 480, height = 480)
  par(mfrow=c(2,2))
  with(mydata, {
  ## plot 4-1
    plot(Date,Global_active_power,type="n",xlab="",
         ylab="Global active power (kilowatts)")
    lines(Date,Global_active_power)
  ## plot 4-2  
    plot(Date,Voltage,type="n",xlab="datetime",ylab="Voltage")
    lines(Date,Voltage)
  ## plot 4-3  
    plot(Date,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    lines(Date,Sub_metering_1,col="black")
    lines(Date,Sub_metering_2,col="red")
    lines(Date,Sub_metering_3,col="blue")
    legend("topright",lty=1,col=c("black","red","blue"),
           legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
  ## plot 4-4
    plot(Date,Global_reactive_power,type="n",xlab="datetime")
    lines(Date,Global_reactive_power)
  ##  
  }  ) 
  dev.off()
  #
}
