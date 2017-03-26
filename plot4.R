elec_power <- read.table(file = "C:/Users/mqzhang/Desktop/DataScience/ExploreDataAnalysis/1stAssignment/household_power_consumption.txt", header = T, sep = ";")
two_day_power <- subset(elec_power, Date %in% c("1/2/2007","2/2/2007"))

two_day_power$Global_active_power <- as.numeric(two_day_power$Global_active_power)

#Should define the sep unless the dafult value is ""
two_day_power$DateTime <- paste(two_day_power$Date, two_day_power$Time, sep = " ")


#as.Date can only handle the Date
#But!!! strptime can handle both!!! Date + Time
two_day_power$DateTime <- strptime(two_day_power$DateTime,"%d/%m/%Y %H:%M:%S")

two_day_power$Global_active_power <- as.numeric(two_day_power$Global_active_power)

two_day_power$Sub_metering_1 <- as.numeric(two_day_power$Sub_metering_1)
two_day_power$Sub_metering_2 <- as.numeric(two_day_power$Sub_metering_2)
two_day_power$Sub_metering_3 <- as.numeric(two_day_power$Sub_metering_3)

two_day_power$Voltage <- as.numeric(two_day_power$Voltage)

two_day_power$Global_reactive_power <- as.numeric(two_day_power$Global_reactive_power)


png("plot4.png",width = 480, height = 480)

par(mfrow = c(2,2))

with(two_day_power,plot(DateTime, Global_active_power, type = "l",ylab = "Global_active_power(kilowatts)"))

with(two_day_power,plot(DateTime, Sub_metering_1, type = 'l'))
lines(two_day_power$DateTime,two_day_power$Sub_metering_2,type = 'l',col = "red")
lines(two_day_power$DateTime,two_day_power$Sub_metering_3,type = 'l',col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2,col = c("black","red","blue"))

with(two_day_power,plot(DateTime, Voltage, type = "l",ylab = "Voltage"))

with(two_day_power,plot(DateTime, Global_reactive_power, type = "l",ylab = "Global_reactive_power(kilowatts)"))

dev.off()
