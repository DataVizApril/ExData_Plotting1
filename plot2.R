elec_power <- read.table(file = "C:/Users/mqzhang/Desktop/DataScience/ExploreDataAnalysis/1stAssignment/household_power_consumption.txt", header = T, sep = ";")
two_day_power <- subset(elec_power, Date %in% c("1/2/2007","2/2/2007"))

two_day_power$Global_active_power <- as.numeric(two_day_power$Global_active_power)

#Should define the sep unless the dafult value is ""
two_day_power$DateTime <- paste(two_day_power$Date, two_day_power$Time, sep = " ")


#as.Date can only handle the Date
#But!!! strptime can handle both!!! Date + Time
two_day_power$DateTime <- strptime(two_day_power$DateTime,"%d/%m/%Y %H:%M:%S")

png("plot2.png",width = 480, height = 480)

with(two_day_power,plot(DateTime, Global_active_power, type = "l",ylab = "Global_active_power(kilowatts)"))


title(main = "Global_Active_power changes between 2007/02/01-2007/02/02")

dev.off()
