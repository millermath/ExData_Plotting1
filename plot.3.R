library(lubridate)
x<-c(rep("character",2),rep("numeric",7))
EPC<-read.csv("household_power_consumption.txt",na.strings='?',
              header=TRUE,sep=";",colClasses=x)
Mydata<-EPC[EPC$Date=="1/2/2007" | EPC$Date=="2/2/2007",]
Mydata$DateTime<-dmy(Mydata$Date)+hms(Mydata$Time)
Mydata<-Mydata[,c(10,3:9)]

png("plot3.png",width=480,height=480,units="px")
plot(Mydata$DateTime,Mydata$Sub_metering_1,type="l",xlab="",
     ylab="Energy sub metering")
lines(Mydata$DateTime,Mydata$Sub_metering_2,type="l",col="red")
lines(Mydata$DateTime,Mydata$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),
       lty="solid",legend=c("Submetering 1", "Submetering 2",
                            "Submetering 3"),cex=.8)
dev.off()
