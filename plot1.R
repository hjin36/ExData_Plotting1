#setup and download the data
if(!dir.exists("./data")){
  dir.create("data")
}
setwd("data")
##method subject to change since I'm using mac
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "data.zip",method="curl")
unzip("data.zip")
data<-read.csv2("household_power_consumption.txt")
data$Global_active_power<- as.numeric(as.character(data$Global_active_power))
data$Date <- strptime(data$Date,format="%d/%m/%Y")
selected <- data[data$Date >= as.POSIXct("2007-02-01") & data$Date <= as.POSIXct("2007-02-02"),]

#plot graph 1
hist(selected$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

