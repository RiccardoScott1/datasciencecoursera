library(lubridate)
power <- read.table("household_power_consumption.txt",nrows = 2075259,na.strings = "?",header=TRUE,sep=";",colClasses = c('character',"character", rep('numeric', 7)))
power$Time <- hms(power$Time)
power$Date <- dmy(power$Date)
day1 <- ymd("2007/02/01")
day2 <- ymd("2007-02-02")
pow <- power[power$Date==day1|power$Date==day2,]
png('plot1.png')
hist(pow$Global_active_power,xlab = "Global Active Power (kilowatts)",col = "red", main = "Global Active Power",breaks = 12)
dev.off()
