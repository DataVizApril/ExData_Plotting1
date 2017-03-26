elec_power <- read.table(file = "C:/Users/mqzhang/Desktop/DataScience/ExploreDataAnalysis/1stAssignment/household_power_consumption.txt", header = T, sep = ";")


two_day_power <- subset(elec_power, Date %in% c("1/2/2007","2/2/2007"))

two_day_power$Global_active_power <- as.numeric(two_day_power$Global_active_power)

png("plot1.png",width = 480, height = 480)

hist(two_day_power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
