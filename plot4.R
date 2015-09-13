##
## Explorartory Data Analysis - assignment 1
##     plot4.R
## 

## Launch grephic device - plot4.png
png(filename = "plot4.png", width = 480, height = 480)

## Read the data from text file into data frame
datafile <- read.table("data/household_power_consumption.txt", 
                       sep = ";", 
                       header = TRUE, 
                       na.strings = "?",
                       colClasses = c("character", "character", rep("numeric",7)))

## convert Date column as as.Date format
datafile$Date <- as.Date(datafile$Date, "%d/%m/%Y")

## Subset 2 days' data to epc_df data frame. 2007-02-01 and 2007-02-02
epc_df <- datafile[which(datafile$Date %in% as.Date(c("2007-02-01","2007-02-02"))),]

## replace Time with date and time to make x-axis
x <- paste(epc_df$Date, epc_df$Time, sep = " ")
epc_df$Time <- strptime(x, "%Y-%m-%d %H:%M:%S")


## plot the data (line chart, type = 'l' 3 times with 3 set of data and colors
##  1. prepare the 2x2 layout
par(mfrow = c(2, 2))

##  2. plot chart 1 @(1,1)
plot(epc_df$Time, epc_df$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")

##  3. plot chart 2 @(1,2)
plot(epc_df$Time, epc_df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

##  4. plot chart 3 @(2,1)
plot(epc_df$Time, epc_df$Sub_metering_1, type = "n", xlab = " ", ylab = "Energy sub metering")
lines(epc_df$Time, epc_df$Sub_metering_1, type = "l", col = "black")
lines(epc_df$Time, epc_df$Sub_metering_2, type = "l", col = "red")
lines(epc_df$Time, epc_df$Sub_metering_3, type = "l", col = "blue")

## annotate the plot
## bty = "n" to remove the legend boundry
legend("topright", 
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1,
       bty = "n")

##  5. plot chart 4 @(2,2)
plot(epc_df$Time, epc_df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

## explitcitly close the graphic device using dev.off()
dev.off()

