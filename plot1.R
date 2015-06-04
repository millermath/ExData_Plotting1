library(lubridate)
x<-c(rep("character",2),rep("numeric",7))
EPC<-read.csv("household_power_consumption.txt",na.strings='?',
              header=TRUE,sep=";",colClasses=x)
Mydata<-EPC[EPC$Date=="1/2/2007" | EPC$Date=="2/2/2007",]
Mydata$DateTime<-dmy(Mydata$Date)+hms(Mydata$Time)
Mydata<-Mydata[,c(10,3:9)]

png("plot1.png",width=480,heigh=480,units="px")
hist(Mydata$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
