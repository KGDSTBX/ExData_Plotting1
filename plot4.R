hec<- read.table("household_power_consumption.txt", header=TRUE, sep = ';',stringsAsFactors=FALSE)
hec$Global_active_power =as.numeric(hec$Global_active_power)
hec$Global_reactive_power =as.numeric(hec$Global_reactive_power)
hec$Voltage  =as.numeric(hec$Voltage)
hec$Sub_metering_1=as.numeric(hec$Sub_metering_1)
hec$Sub_metering_2=as.numeric(hec$Sub_metering_2)
hec$Sub_metering_3=as.numeric(hec$Sub_metering_3)
hec$Global_intensity=as.numeric(hec$Global_intensity)
hec$Date <- as.Date(hec$Date, format = "%d/%m/%Y")
invisible(strptime(hec$Time, format="%T"))
hecs=subset(hec,Date>=as.Date("2007-02-01") & Date<=as.Date ("2007-02-02"))
row.names(hecs) <- NULL
library("R.devices")
devOptions("png", width = 480,height =480)



## Plot 4
Date1<-as.POSIXct(paste(hecs$Date,hecs$Time))
par(mfrow = c(2, 2))
plot(Date1, hecs$Global_active_power,xlab="","l",ylab=" Global Active Power")
plot(Date1, hecs$Voltage,xlab="datetime","l",ylab=" Voltage")
plot(Date1,hecs$Sub_metering_1,ylab=" Energy sub metering",xlab="","l",col="black")
    lines(Date1,hecs$Sub_metering_2,col="red")
    lines(Date1,hecs$Sub_metering_3,col="blue")
legend(c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
plot(Date1, hecs$Global_reactive_power,xlab="datetime","l",ylab="Global_reactive_power")
dev.copy(png, file = "plot4.png")
dev.off() 
