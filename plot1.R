##
## Explorartory Data Analysis - assignment 1
##     plot1.R
## 

## Launch grephic device - plot1.png
png(filename = "plot1.png", width = 480, height = 480)

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

## plot the data and annotate the plot
hist(epc_df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

## explitcitly close the graphic device using dev.off()
dev.off()
