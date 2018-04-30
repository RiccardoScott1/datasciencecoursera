library(lubridate)
power <- read.table("household_power_consumption.txt",nrows = 2075259,na.strings = "?",header=TRUE,sep=";",colClasses = c('character',"character", rep('numeric', 7)))
power$date_time <-  dmy_hms(paste(power$Date, power$Time))
day1 <- dmy("01/02/2007")
day2 <- dmy("02/02/2007")
pow <- power[which(as.Date(power$date_time)==day2|as.Date(power$date_time)==day1),]
png('plot2.png')
with(pow,plot(date_time,Global_active_power,ylab = "Global Active Power (kilowatts)",xlab="", type="l"))
dev.off()
