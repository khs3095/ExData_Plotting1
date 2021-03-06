data <- read.delim("household_power_consumption.txt", sep = ";", stringsAsFactors = F )

library(lubridate)
library(dplyr)

data <- mutate(data, Date = dmy(data$Date))
data1 <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02" )
data1 <- mutate(data1, Global_active_power = as.numeric(data1$Global_active_power))
data1 <- mutate(data1, Global_reactive_power = as.numeric(data1$Global_reactive_power))
data1 <- mutate(data1, nd = ymd_hms(paste(data1$Date, data1$Time)))
data1 <- mutate(data1, Voltage = as.numeric(data1$Voltage))
data1 <- mutate(data1, Sub_metering_1 = as.numeric(data1$Sub_metering_1))
data1 <- mutate(data1, Sub_metering_2 = as.numeric(data1$Sub_metering_2))
data1 <- mutate(data1, Sub_metering_3 = as.numeric(data1$Sub_metering_3))


png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow= c(2,2))

plot(data1$nd, data1$Global_active_power, type = "n",xlab = "", ylab = "Global Active Power")
lines(data1$nd, data1$Global_active_power)

plot(data1$nd, data1$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(data1$nd, data1$Voltage)

plot(data1$nd, data1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col= c("black", "red", "blue"), lty = 1, box.lty = 0,inset = 0.01)
lines(data1$nd, data1$Sub_metering_3, col = "blue")
lines(data1$nd, data1$Sub_metering_2, col = "red")

plot(data1$nd, data1$Global_reactive_power, type = "n",xlab = "datetime", ylab = "Global_reactive_power")
lines(data1$nd, data1$Global_reactive_power)





dev.off()

