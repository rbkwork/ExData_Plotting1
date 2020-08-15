
#Plot 4

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

png("plot2.png")
par(mfrow=c(2,2))
with(data,plot(Date, Sub_metering_1, ylab = "Energy sub metering",type="n"))
with(data,lines(Date, Sub_metering_3,col="blue"))
with(data,lines(Date, Sub_metering_2,col="red"))
with(data,lines(Date, Sub_metering_1))
legend("topright",lty=1,col=c("black","red","blue"),legend=names(data[,2:4]))

dev.off()


