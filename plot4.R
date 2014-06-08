# loading data
data <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, na.string = '?')

# merge the Date & Time column into one column
data$Datetime <- strptime(paste(data$Date, data$Time, " "), format = "%d/%m/%Y %H:%M:%S")

# subset
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_subset <- data[data$Date <= "2007-02-02" & data$Date >= "2007-02-01",]

# create a new png file
png(filename="plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow = c(2, 2))

# 1st plot
plot(data_subset$Datetime, data_subset$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatt)')

# 2nd plot
plot(data_subset$Datetime, data_subset$Voltage, type='l', xlab='datetime', ylab='Voltage')

# 3rd plot
plot(data_subset$Datetime, data_subset$Sub_metering_1, type='l', xlab='', ylab='Energy sub-metering')
lines(data_subset$Datetime, data_subset$Sub_metering_2, type='l', col='red')
lines(data_subset$Datetime, data_subset$Sub_metering_3, type='l', col='blue')

legend('topright',
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c('black','red','blue'),
       bty='n',
       lty = 1)

# 4th plot
plot(data_subset$Datetime, data_subset$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')

dev.off()