
library(dplyr)
library(lubridate)

## Read data, transform time variables into appropiate classes and subset the 
## desired dates
raw_data <- read.csv("household_power_consumption.txt",sep=";")
raw_data$Time <- dmy_hms(paste(raw_data$Date,raw_data$Time))
raw_data$Date <- dmy(raw_data$Date)

selected_data <-raw_data[(raw_data$Date==ymd("2007/02/01")|
                                  raw_data$Date == ymd("2007/02/02")),]
png(filename="plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
plot(selected_data$Time,selected_data$Global_active_power,
     type="l", 
     xlab="",
     ylab="Global Active Power (kilowatts)")
plot(selected_data$Time,selected_data$Voltage ,
     type="l", 
     xlab="datetime",
     ylab="Voltage")

plot(selected_data$Time,selected_data$Sub_metering_1,
     type="l", 
     xlab="",
     ylab="Energy sub metering")
lines(selected_data$Time,selected_data$Sub_metering_2,
      col="red")
lines(selected_data$Time,selected_data$Sub_metering_3,
      col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red","blue"),lty=c(1,1,1))
plot(selected_data$Time,selected_data$Global_reactive_power ,
     type="l", 
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()