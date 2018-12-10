setwd("~/R_Working_Directory")
household_power_consumption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
concerned_data <- subset(household_power_consumption, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
concerned_data$g_a_p <- concerned_data$Global_active_power
concerned_data$g_a_p <- droplevels(concerned_data$g_a_p, exclude = "?", drop = TRUE)
concerned_data$g_a_p <- as.numeric(levels(concerned_data$g_a_p))[concerned_data$g_a_p]
concerned_data$Date_Time <- as.POSIXct(paste(concerned_data$Date, concerned_data$Time), format="%Y-%m-%d %H:%M:%S")
png(filename = "ExData_Plotting1/plot2.png", width = 480, height = 480)
plot(concerned_data$Date_Time, concerned_data$g_a_p, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
dev.off()