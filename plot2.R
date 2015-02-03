###### Code for creating plot2 ##########

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

#Creating datetime column
finalData$datetime <- as.POSIXct(paste(finalData$Date, finalData$Time), format="%Y-%m-%d %H:%M:%S")

#Plotting graph 2
plot(finalData$datetime , finalData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Exporting it to png file
dev.copy(png,file="plot2.png")
dev.off()

