library(dplyr)
library(lubridate)


#Load dataset
data = read.table(file='household_power_consumption.txt', sep=';', header = TRUE)

#subset to wanted dates - also convert to numeric
data_subset = filter(data, Date %in% c('1/2/2007', '2/2/2007'))
data_subset$Global_active_power = as.numeric(data_subset$Global_active_power)
data_subset$Sub_metering_1 = as.numeric(data_subset$Sub_metering_1)
data_subset$Sub_metering_2 = as.numeric(data_subset$Sub_metering_2)
data_subset$Sub_metering_3 = as.numeric(data_subset$Sub_metering_3)
data_subset$date_time = dmy(data_subset$Date) + hms(data_subset$Time)

# sert plots
par(mfrow = c(2, 2))

# first plot
plot(data_subset$date_time, data_subset$Global_active_power, type = 'l', xlab = '', ylab = 'Global active power(kilowatts)')

# second plot
plot(data_subset$date_time, data_subset$Voltage, type = 'l', ylab = 'Voltage', xlab='datetime')

# third plot
plot(data_subset$date_time, data_subset$Sub_metering_1, type='n', xlab = '', ylab = 'Energy sub metering', ylim = c(0,35))
points(data_subset$date_time, data_subset$Sub_metering_1, type='l')
points(data_subset$date_time, data_subset$Sub_metering_2 ,type='l', col='red')
points(data_subset$date_time, data_subset$Sub_metering_3, type='l', col='blue')

legend("topright",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.7)


# fourth plot
plot(data_subset$date_time, data_subset$Global_reactive_power, type = 'l', ylab = 'Global_reactive_power', xlab='datetime')




## Copy my plot to a PNG file
dev.copy(png, file = "plot4.png")

## Don't forget to close the PNG device!
dev.off()

