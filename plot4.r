## loading file
require(sqldf)
file <- c("C:/Users/cgu018/Desktop/Analytics/Open Course/DS JHU/Explore Data Viz/Week 1/household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file 
where (Date == '1/2/2007' OR Date == '2/2/2007')" )

## deal with the question marks in the data an change to NA
data_subset[data_subset == "?"] <- NA 

## Convert date
data_subset$date_Time <- strptime(paste(data_subset$Date, data_subset$Time), "%d/%m/%Y %H:%M:%S")

## plot four charts in 2*2 layout
par(mfrow = c(2,2))
## plot #1
plot(data_subset$date_Time, data_subset$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
## plot #2
plot(data_subset$date_Time, data_subset$Voltage, type = "l", xlab="datetime", ylab = "Voltage")
## plot #3
plot(data_subset$date_Time,data_subset$Sub_metering_1,type="l",xlab=" ",ylab="Energy Sub Metering",ylim=c(0,40))
lines(data_subset$date_Time,data_subset$Sub_metering_2,ylim=c(0,40),col="red")
lines(data_subset$date_Time,data_subset$Sub_metering_3,ylim=c(0,40),col="blue")
legend("topright", col = c("black", "red", "blue"), lty = c("solid", "solid", "solid"), legend = names(data_subset[,7:9]),cex = 0.5)
## plot #4
plot(data_subset$date_Time, data_subset$Global_reactive_power, type = "l", xlab="datetime", ylab = "Global_reactive_power")

dev.copy(png, "plot4.png", width =480, height=480)
dev.off()