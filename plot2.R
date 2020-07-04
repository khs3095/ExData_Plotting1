data <- read.delim("household_power_consumption.txt", sep = ";", stringsAsFactors = F )

library(lubridate)
library(dplyr)

data <- mutate(data, Date = dmy(data$Date))
data1 <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02" )
data1 <- mutate(data1, Global_active_power = as.numeric(data1$Global_active_power))

data1 <- mutate(data1, nd = ymd_hms(paste(data1$Date, data1$Time)))
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data1$nd, data1$Global_active_power, type = "n",xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data1$nd, data1$Global_active_power)
dev.off()

##png(filename = "plot1.png", width = 480, height = 480, units = "px")
##dev.off()