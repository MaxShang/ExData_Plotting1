library(data.table)
dt2<-fread(input ="household_power_consumption.txt",sep = ";",header = TRUE,na.strings = c("?"))
dt<-dt2[dt2$Date=="1/2/2007" | dt2$Date=="2/2/2007",]

t<-paste(dt$Date,dt$Time)
t<-strptime(t,"%d/%m/%Y %H:%M:%S")


with(dt,
     plot(t,Global_active_power,
          type="l",
          xlab="",
          ylab="Global Active Power (Kilowatts)"))
dev.copy(png, file = "plot2.png",width=480,height=480) ## Copy my plot to a PNG file
dev.off() 




