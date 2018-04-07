#setup and download the data
if(!dir.exists("./data")){
  dir.create("data")
}
setwd("data")
##method subject to change since I'm using mac
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "data.zip",method="curl")
unzip("data.zip")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date <- as.Date(data$Date,"%d/%m/%Y")
selected <- subset(data,data$Date >= as.Date("2007-2-1") & data$Date <= as.Date("2007-2-2"))
selected$Date <- paste(selected$Date,selected$Time)
selected$Date <- as.POSIXct(selected$Date)


par(mfcol = c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
#plot 1
plot(selected$Global_active_power ~ selected$Date,type = "l",xlab="",ylab = "Global Active Power (kilowatts)")
#plot 2

plot(selected$Sub_metering_1 ~ selected$Date,type = "l",xlab="",ylab = "Global Active Power (kilowatts)")
points(selected$Sub_metering_2 ~ selected$Date,type="l",col = "red")
points(selected$Sub_metering_3 ~ selected$Date,type="l",col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lwd=c(1,1,1))

#plot3
plot(selected$Voltage ~ selected$Date,type = "l",xlab="",ylab = "Voltage (volt)")
#plot4
plot(selected$Global_reactive_power ~ selected$Date,type = "l",xlab="",ylab = "Global Rective Power (kilowatts)")


dev.copy(png,"plot4.png", width=480, height=480)
dev.off()

