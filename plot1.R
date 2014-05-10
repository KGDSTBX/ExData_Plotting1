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


## Plot 1
hist(hecs$Global_active_power,col="red",xlab=" Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off() 

