
library(dplyr)
library(lubridate)

## Read data, transform time variables into appropiate classes and subset the 
## desired dates
raw_data <- read.csv("household_power_consumption.txt",sep=";")
raw_data$Time <- dmy_hms(paste(raw_data$Date,raw_data$Time))
raw_data$Date <- dmy(raw_data$Date)

selected_data <-raw_data[(raw_data$Date==ymd("2007/02/01")|
                                  raw_data$Date == ymd("2007/02/02")),]
png(filename="plot2.png", width = 480, height = 480)

plot(selected_data$Time,selected_data$Global_active_power,
     type="l", 
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()
