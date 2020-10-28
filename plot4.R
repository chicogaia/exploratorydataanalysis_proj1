
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
png("plot4.png", width = 480 , height = 480)

par(mfcol = c(2,2))

#Plot top left
with(data_f,
     plot(x = DateTime, y = Global_active_power,
          type="l", xlab = "" , ylab="Global Active Power (kilowatts)"))

#Plot bottom left
with(data_f,
     plot(x = DateTime, y = Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering"))
with(data_f, lines(x = DateTime, y = Sub_metering_2, col = "red"))
with(data_f, lines(x = DateTime, y = Sub_metering_3, col = "blue"))
legend("topright", 
       col = c("black", "red" , "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1),
       lwd = c(1,1),
       bty = "n")

#Plot top right
with(data_f,
     plot(x = DateTime, y = Voltage,
          type="l", xlab = "datetime", ylab="Voltage"))

#Plot bottom right
with(data_f,
     plot(x = DateTime, y = Global_reactive_power,
          type="l", xlab = "datetime"))

dev.off()



