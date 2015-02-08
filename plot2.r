## loading file
require(sqldf)
file <- c("C:/Users/cgu018/Desktop/Analytics/Open Course/DS JHU/Explore Data Viz/Week 1/household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

## deal with the question marks in the data an change to NA
data_subset[data_subset == "?"] <- NA 

## Convert date
data_subset$date_Time <- strptime(paste(data_subset$Date, data_subset$Time), "%d/%m/%Y %H:%M:%S")

## plot and save as png
plot(data_subset$date_Time, data_subset$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.copy(png, "plot2.png", width =480, height=480)
dev.off()

