library(dplyr)
library(lubridate)


#Load dataset
data = read.table(file='household_power_consumption.txt', sep=';', header = TRUE)

#subset to wanted dates
data_subset = filter(data, Date %in% c('1/2/2007', '2/2/2007'))
data_subset$Global_active_power = as.numeric(data_subset$Global_active_power)
data_subset$date_time = dmy(data_subset$Date) + hms(data_subset$Time)


par(mfrow = c(1, 1))

plot(data_subset$date_time, data_subset$Global_active_power, type = 'l', xlab = '', ylab = 'Global active power(kilowatts)')

## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png")

## Don't forget to close the PNG device!
dev.off()
