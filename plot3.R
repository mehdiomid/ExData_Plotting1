## A R scrip to read file and create a plot of energy sub metering vs date 
##
plot3 <- function() {
  ## read data
  data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                     na.strings="?",colClasses=c("character", "character",rep("numeric",7)))
  ##
  ## subsetting data for dates btween 1/2/2007 and 2/2/2007
  
  mydata <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
  mydata$Date <- paste(mydata$Date,data2$Time,sep=" ")
  mydata$Date <- strptime(mydata$Date,"%d/%m/%Y %H:%M:%S")
  ##
  ## creating plot 3 as PNG file
  ## plot 3 is a plot of energy sub metering vs date
  ##
  png(file="plot3.png",width = 480, height = 480)
  with(mydata, {
    plot(Date,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    lines(Date,Sub_metering_1,col="black")
    lines(Date,Sub_metering_2,col="red")
    lines(Date,Sub_metering_3,col="blue")
    legend("topright",lty=1,col=c("black","red","blue"),
           legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
  }  ) 
  dev.off()
  #
}
