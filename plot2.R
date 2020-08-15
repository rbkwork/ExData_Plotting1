
#Plot 2

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
data<-data[,c(1,3)]

##plot it

png("plot2.png")
with(data,plot(Date, Global_active_power,ylab = "Global Active Power (kilowatts)",type="l"),pin=c(1,1))
dev.off()
