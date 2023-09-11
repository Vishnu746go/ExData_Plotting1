#plot 4 (main)
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Plot 1
plot(
    dateTime,
    dt$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power"
)

# Plot 2
plot(
    dateTime,
    dt$Voltage,
    type = "l",
    xlab = "datetime",
    ylab = "Voltage"
)

# Plot 3
plot(
    dateTime,
    dt$Sub_metering_1,
    type = "l",
    xlab = "",
    ylab = "Energy sub metering"
)
lines(dateTime, dt$Sub_metering_2, col = "red")
lines(dateTime, dt$Sub_metering_3, col = "blue")
legend(
    "topright",
    c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("black", "red", "blue"),
    lty = 1,
    bty = "n"
)

# Plot 4
plot(
    dateTime,
    dt$Global_reactive_power,
    type = "l",
    xlab = "datetime",
    ylab = "Global_reactive_power"
)


dev.off()


img <- readPNG("plot4.png")
# Display
grid::grid.raster(img)
