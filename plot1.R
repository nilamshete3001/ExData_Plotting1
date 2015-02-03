###### Code for creating plot1 ##########

# Setting the working directory
setwd("E:/Nilam/Coursera/Exploratory Data Analysis/Project1/")

#Reading Data file
inputData <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

#Conveting date(factor) to class date
inputData$Date <- as.Date(inputData$Date,"%d/%m/%Y")

#Selecting data only for 2 days of feb
finalData <- inputData[(inputData$Date == "2007-02-01" | inputData$Date == "2007-02-02"),]

#Converting column Global_active_power from factor to numeric
finalData$Global_active_power <- as.numeric(as.character(finalData$Global_active_power))

#Plotting histogram
hist(finalData$Global_active_power, main="Global Active Power",
 col="red", xlab="Global Active Power (kilowatts)")

#Exporting it to png file
dev.copy(png,file="plot1.png")
dev.off()
