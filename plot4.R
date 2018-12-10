setwd("~/R_Working_Directory")
household_power_consumption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
concerned_data <- subset(household_power_consumption, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

concerned_data$g_a_p <- concerned_data$Global_active_power
concerned_data$g_a_p <- droplevels(concerned_data$g_a_p, exclude = "?", drop = TRUE)
concerned_data$g_a_p <- as.numeric(levels(concerned_data$g_a_p))[concerned_data$g_a_p]
concerned_data$Date_Time <- as.POSIXct(paste(concerned_data$Date, concerned_data$Time), format="%Y-%m-%d %H:%M:%S")

concerned_data$Voltage <- droplevels(concerned_data$Voltage, exclude = "?", drop = TRUE)
concerned_data$Voltage <- as.numeric(levels(concerned_data$Voltage))[concerned_data$Voltage]

concerned_data$Sub_metering_1 <- droplevels(concerned_data$Sub_metering_1, exclude = "?", drop = TRUE)
concerned_data$Sub_metering_1 <- as.numeric(levels(concerned_data$Sub_metering_1))[concerned_data$Sub_metering_1]
concerned_data$Sub_metering_2 <- droplevels(concerned_data$Sub_metering_2, exclude = "?", drop = TRUE)
concerned_data$Sub_metering_2 <- as.numeric(levels(concerned_data$Sub_metering_2))[concerned_data$Sub_metering_2]

concerned_data$Global_reactive_power <- droplevels(concerned_data$Global_reactive_power, exclude = "?", drop = TRUE)
concerned_data$Global_reactive_power <- as.numeric(levels(concerned_data$Global_reactive_power))[concerned_data$Global_reactive_power]

png(filename = "ExData_Plotting1/plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(concerned_data$Date_Time, concerned_data$g_a_p, type = "l", ylab = "Global Active Power", xlab = "")

plot(concerned_data$Date_Time, concerned_data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(concerned_data$Date_Time, concerned_data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(concerned_data$Date_Time, concerned_data$Sub_metering_1, col = "black")
lines(concerned_data$Date_Time, concerned_data$Sub_metering_2, col = "red")
lines(concerned_data$Date_Time, concerned_data$Sub_metering_3, col = "blue")
legend("topright",
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        col = c("black", "red", "blue"),
        pch = "-",
        bty = "n",
        pt.cex = 2,
        cex = 1,
        text.col = "black",
        horiz = F)

plot(concerned_data$Date_Time, concerned_data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()