## A R scrip to read file and create a plot of global active power vs date 
##
plot2 <- function() {
  ## read data
  data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                     na.strings="?",colClasses=c("character", "character",rep("numeric",7)))
  ##
  ## subsetting data for dates btween 1/2/2007 and 2/2/2007
  
  mydata <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
  mydata$Date <- paste(mydata$Date,data2$Time,sep=" ")
  mydata$Date <- strptime(mydata$Date,"%d/%m/%Y %H:%M:%S")
  ##
  ## creating plot 2 as PNG file
  ## plot 2 is a plot of global active power vs date
  ##
  png(file="plot2.png",width = 480, height = 480)
  with(mydata, plot(Date,Global_active_power,type="n",xlab="",ylab="Global active power (kilowatts)"))
  with(mydata, lines(Date,Global_active_power))
  dev.off()
  #
}
