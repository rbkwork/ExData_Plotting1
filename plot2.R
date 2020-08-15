
#Plot 2

##read data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./data",method = "curl")
unzip("./data")
library(data.table)
data<-fread("./household_power_consumption.txt")

##filter the data
library(lubridate)
library(dplyr)
data$Date<-dmy_hms(with(data,paste(Date,Time,sep = " ")))
data$Date<-with(data,paste(Date,Time,sep = " "))

strptime(data$Date,"%d/%m/%Y %H:%M:%S")

data<-data[,c(1,3)]
data<- data %>% filter(Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))


##plot it

library(ggplot2)
data$Date<-ymd_hms(with(data,paste(Date,Time,sep = " ")))
with(data,plot(Date, Global_active_power))
ggplot(data,aes(Date, Global_active_power))

png("plot2.png")
with(data, geom_line(Date, Global_active_power))
dev.off() 


with(data, barplot(Global_active_power,Date))

