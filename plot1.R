# loading data
data <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, na.string = '?')

# subset
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data_subset <- data[data$Date <= "2007-02-02" & data$Date >= "2007-02-01",]

# create a new png file
png(filename="plot1.png", width = 480, height = 480, bg = "transparent")

# hist()
hist(data_subset$Global_active_power,
     col='red',
     xlab='Global Active Power (kilowatt)',
     main='Global Actlve Power')
dev.off()