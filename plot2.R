data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE, as.is = TRUE)
data$FullDate <- paste(data$Date, data$Time)
data$FullDate <- strptime(data$FullDate, format = "%d/%m/%Y %H:%M:%S")
final_data <- data[data$FullDate >= "2007-02-01" & data$FullDate < "2007-02-03", ]
png("plot2.png", bg = "transparent")


plot(final_data$FullDate, final_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()