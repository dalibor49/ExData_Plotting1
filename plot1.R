library(dplyr)

#Load dataset
data = read.table(file='household_power_consumption.txt', sep=';', header = TRUE)

#ubset to wanted dates
data_subset = filter(data, Date %in% c('1/2/2007', '2/2/2007'))
data_subset$Global_active_power = as.numeric(data_subset$Global_active_power)

# Plot histogram
hist(x=data_subset$Global_active_power, col = 'red', main = 'Global active power',xlab = 'Global active power(kilowatts)', ylab='Frequency')

## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png")

## Don't forget to close the PNG device!
dev.off()