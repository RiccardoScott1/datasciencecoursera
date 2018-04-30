library(lubridate)
power <- read.table("household_power_consumption.txt",nrows = 2075259,na.strings = "?",header=TRUE,sep=";",colClasses = c('character',"character", rep('numeric', 7)))
power$date_time <-  dmy_hms(paste(power$Date, power$Time))
day1 <- dmy("01/02/2007")
day2 <- dmy("02/02/2007")
pow <- power[which(as.Date(power$date_time)==day2|as.Date(power$date_time)==day1),]

png('plot4.png')
#make 2x2 subplots
par(mfrow=c(2,2))
#topleft
with(pow,plot(date_time,Global_active_power,ylab = "Global Active Power (kilowatts)",xlab="", type="l"))
#top right
with(pow,plot(date_time,Voltage,ylab = "Voltage",xlab="datetime", type="l"))
# bottom left
with(pow,plot(date_time,Sub_metering_1,ylab = "Energy sub metering",xlab="", type="l"))
lines(pow$date_time,pow$Sub_metering_2,col="red")
lines(pow$date_time,pow$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),box.lwd = 0)
# bottom right
with(pow,plot(date_time,Global_reactive_power,ylab = "Global_reactive_power",xlab="datetime", type="l"))
dev.off()
