library(dplyr)
library(lubridate)

## Read data, transform time variables into appropiate classes and subset the 
## desired dates
raw_data <- read.csv("household_power_consumption.txt",sep=";")
raw_data$Date <- dmy(raw_data$Date)
raw_data$Time <- hms(raw_data$Time)
selected_data <-raw_data[(raw_data$Date==ymd("2007/02/01")|
                                  raw_data$Date == ymd("2007/02/02")),]
png(filename="plot1.png", width = 480, height = 480)
hist(as.numeric(selected_data$Global_active_power), 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()
