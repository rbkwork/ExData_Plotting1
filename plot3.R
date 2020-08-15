
#Plot 3

##read data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./data",method = "curl")
unzip("./data")
library(data.table)
data<-fread("./household_power_consumption.txt")

##filter the data
library(lubridate)
library(dplyr)

data$Date<- dmy(data$Date)
data<- data %>% filter(Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
data$Date<-ymd_hms(with(data,paste(Date,Time,sep = " ")))
data<-data[,c(1,7:9)]

##plot it

png("plot3.png")

with(data,plot(Date, Sub_metering_1, ylab = "Energy sub metering",type="n",pin=c(1,1)))
with(data,plot(Date, Global_active_power,ylab = "Global Active Power (kilowatts)",type="l"),pin=c(1,1))



with(data,lines(Date, Sub_metering_3,col="blue"))
with(data,lines(Date, Sub_metering_2,col="red"))
with(data,lines(Date, Sub_metering_1))
legend("topright",lty=1,col=c("black","red","blue"),legend=names(data[,2:4]))

dev.off()


