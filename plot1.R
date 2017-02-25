## A R scrip to read file and create a histogram plot for global active power 
##
plot1 <- function() {
  #
  ## read data
  data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                     na.strings="?",colClasses=c("character", "character",rep("numeric",7)))
  ##
  ## subsetting data for dates btween 1/2/2007 and 2/2/2007
  
  mydata <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
  mydata$Date <- paste(mydata$Date,data2$Time,sep=" ")
  mydata$Date <- strptime(mydata$Date,"%d/%m/%Y %H:%M:%S")
  ##
  ## creating plot 1 as PNG file
  ## plot 1 is a histogram of global active power
  ##
  png(file="plot1.png",width = 480, height = 480)
  hist(mydata$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)")
  dev.off()
#  
}
