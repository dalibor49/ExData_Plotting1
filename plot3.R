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

# plot everythong
plot(data_subset$date_time, data_subset$Sub_metering_1, type='n', xlab = '', ylab = 'Energy sub metering', ylim = c(0,35))
points(data_subset$date_time, data_subset$Sub_metering_1, type='l')
points(data_subset$date_time, data_subset$Sub_metering_2 ,type='l', col='red')
points(data_subset$date_time, data_subset$Sub_metering_3, type='l', col='blue')

legend("topright",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copy my plot to a PNG file
dev.copy(png, file = "plot3.png")

## Don't forget to close the PNG device!
dev.off()
