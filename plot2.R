##
## Explorartory Data Analysis - assignment 1
##     plot2.R
## 

## Launch grephic device - plot2.png
png(filename = "plot2.png", width = 480, height = 480)

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

## plot the data (line chart, type = 'l' and annotate the plot
plot(epc_df$Time, epc_df$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power(kilowatts)")

## explitcitly close the graphic device using dev.off()
dev.off()
