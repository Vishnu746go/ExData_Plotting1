#plot2
dt <- fread("C:/Users/vishn/Downloads/household_power_consumption.txt", na.strings = "?")
dt <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"),]
dateTime <- dmy_hms(paste(dt$Date, dt$Time, sep = " "), tz = "UTC")

# Create and save plot2.png
png("plot2.png", width = 480, height = 480)


plot(
    dateTime,
    dt$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)"
)


dev.off()
img <- readPNG("plot2.png")
#Display the image
grid::grid.raster(img)
