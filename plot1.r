## loading file
require(sqldf)
file <- c("C:/Users/cgu018/Desktop/Analytics/Open Course/DS JHU/Explore Data Viz/Week 1/household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file 
where (Date == '1/2/2007' OR Date == '2/2/2007')" )

## deal with the question marks in the data an change to NA
data_subset[data_subset == "?"] <- NA 

## plot and save as png
hist(data_subset$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)") 
dev.copy(png, "plot1.png", width =480, height=480)
dev.off()
