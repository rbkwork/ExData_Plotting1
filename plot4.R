
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


## plot it

png("plot4.png")
par(mfcol=c(2,2))

### graph 1
with(data,plot(Date, Global_active_power,ylab = "Global Active Power (kilowatts)",type="l"))

### graph 2
with(data,plot(Date, Sub_metering_1, ylab = "Energy sub metering",type="n"))
with(data,lines(Date, Sub_metering_3,col="blue"))
with(data,lines(Date, Sub_metering_2,col="red"))
with(data,lines(Date, Sub_metering_1))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

### graph 3
with(data,plot(Date, Voltage,type="l"))

### graph 4
with(data,plot(Date, Global_reactive_power,type="l"))
dev.off()


