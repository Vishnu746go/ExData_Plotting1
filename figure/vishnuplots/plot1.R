install.packages("dplyr")
install.packages("ggplot2")
install.packages("png")
install.packages("lubridate")
library(data.table)
library(ggplot2)
library(png)
library(lubridate)
library(dplyr)


unzip("C:/Users/vishn/Downloads/exdata_data_household_power_consumption.zip", exdir = "C:/Users/vishn/Downloads/")


data <- read.table("C:/Users/vishn/Downloads/household_power_consumption.txt", header = TRUE, sep = ";")

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset_data <- data %>%
  filter(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

subset_data$Global_active_power <- as.numeric(gsub("\\?", NA, subset_data$Global_active_power))

png("plot1.png", width = 480, height = 480)
hist(
  subset_data$Global_active_power,  
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency",
  main = "Global Active Power",
  col = "red"  
)


dev.off() 



img <- readPNG("plot1.png")

# Display the image
grid::grid.raster(img)