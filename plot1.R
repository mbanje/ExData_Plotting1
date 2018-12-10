
setwd("~/R_Working_Directory")
household_power_consumption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
concerned_data <- subset(household_power_consumption, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
g_a_p <- concerned_data$Global_active_power
g_a_p <- droplevels(g_a_p, exclude = "?", drop = TRUE)
g_a_p <- as.numeric(levels(g_a_p))[g_a_p]

png(filename = "ExData_Plotting1/plot1.png", width = 480, height = 480)

hist(g_a_p, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", ylim = c(0,1200))

dev.off()



