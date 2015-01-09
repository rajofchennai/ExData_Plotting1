data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE, as.is = TRUE)
data$FullDate <- paste(data$Date, data$Time)
data$FullDate <- strptime(data$FullDate, format = "%d/%m/%Y %H:%M:%S")
final_data <- data[data$FullDate >= "2007-02-01" & data$FullDate < "2007-02-03", ]

png("plot3.png")
plot(final_data$FullDate, final_data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(final_data$FullDate, final_data$Sub_metering_1, col= "black", type = "l")
points(final_data$FullDate, final_data$Sub_metering_2, col= "red", type = "l")
points(final_data$FullDate, final_data$Sub_metering_3, col= "blue", type = "l")

legend('topright',legend= c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty = c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black", "red", "blue"), cex = 1)
dev.off()