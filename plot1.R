
##Getting the Data
library(data.table)
data<- fread("household_power_consumption.txt", na.strings = "?")

#Transform dates from "chr" to "date"
data$Date <- as.Date(data$Date , "%d/%m/%Y")

#Filter dates for Feb 1st and Feb 2nd, 2007
data_f <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

#Create png file
png("plot1.png", width = 480 , height = 480)

#Make plot 1
with(data_f , hist(Global_active_power ,
                   col = "red" ,
                   main = "Global Active Power",
                   xlab="Global Active Power (kilowatts)",
                   ylab="Frequency"))

dev.off()

