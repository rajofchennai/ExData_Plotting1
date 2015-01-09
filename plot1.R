data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE, as.is = TRUE)
data$FullDate <- paste(data$Date, data$Time)
data$FullDate <- strptime(data$FullDate, format = "%d/%m/%Y %H:%M:%S")
final_data <- data[data$FullDate >= "2007-02-01" & data$FullDate < "2007-02-03", ]
png("plot1.png", bg = "transparent")

hist(final_data$Global_active_power, xlab = "Global Active Power (kilowatts)", freq = TRUE, main = "Global Active Power", ylim = c(0, 1200), col = "red")
dev.off()
#final_data <- data[data$FullDate >= "2017-02-01" & data$FullDate <= "2017-02-02", ]