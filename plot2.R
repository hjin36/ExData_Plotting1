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


#plot graph 2
plot(selected$Global_active_power ~ selected$Date,type = "l",xlab="",ylab = "Global Active Power (kilowatts)")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

