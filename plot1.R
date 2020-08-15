
#Plot 1

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
data[,3:9]<- lapply(data[,3:9],as.numeric)


##plot it
png("plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)",pin=c(1,1))
dev.off() 

