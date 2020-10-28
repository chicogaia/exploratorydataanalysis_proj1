
##Getting the Data
library(data.table)
data<- fread("household_power_consumption.txt", na.strings = "?")

#Generate variable dateTime that can be read by time of day
data$DateTime <- with(data, paste(Date, Time))
data$DateTime <- as.POSIXct(data$DateTime, format = "%d/%m/%Y %H:%M:%S")


#Filter dates for Feb 1st and Feb 2nd, 2007
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data_f <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

#Create png file
png("plot2.png", width = 480 , height = 480)

with(data_f,
     plot(x = DateTime, y = Global_active_power,
          type="l", xlab = "" , ylab="Global Active Power (kilowatts)"))

dev.off()


