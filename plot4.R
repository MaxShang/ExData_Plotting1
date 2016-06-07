library(data.table)
dt2<-fread(input ="household_power_consumption.txt",sep = ";",header = TRUE,na.strings = c("?"))
dt<-dt2[dt2$Date=="1/2/2007" | dt2$Date=="2/2/2007",]

t<-paste(dt$Date,dt$Time)
t<-strptime(t,"%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
with(dt,
     plot(t,Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (Kilowatts)"))

with(dt,
     plot(t,Voltage,
     xlab="datetime",
     ylab="Voltage",
     type="l"))

with(dt,plot(t,dt$Sub_metering_1,type = "n",
             ylab="Energy sub metering",
             xlab="",oma = c(1, 1, 0, 1)
))
lines(t,dt$Sub_metering_1,type="l")
lines(t,dt$Sub_metering_2, col="red")
lines(t,dt$Sub_metering_3,col="blue")
legend("topright",
       lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),bty="n",xjust=0,yjust=0)    

with(dt,
     plot(t,Global_reactive_power,
          type="l",
          xlab="datetime"))

dev.copy(png, file = "plot4.png",width=480,height=480) ## Copy my plot to a PNG file
dev.off() 
