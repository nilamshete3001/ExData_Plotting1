###### Code for creating plot3 ##########

# Setting the working directory
setwd("E:/Nilam/Coursera/Exploratory Data Analysis/Project1/")

#Reading Data file
inputData <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

#Conveting date(factor) to class date
inputData$Date <- as.Date(inputData$Date,"%d/%m/%Y")

#Selecting data only for 2 days of feb
finalData <- inputData[(inputData$Date == "2007-02-01" | inputData$Date == "2007-02-02"),]

#Creating datetime column
finalData$datetime <- as.POSIXct(paste(finalData$Date, finalData$Time), format="%Y-%m-%d %H:%M:%S")

#Converting factor columns to numeric 
finalData$Sub_metering_1<- as.numeric(as.character(finalData$Sub_metering_1))
finalData$Sub_metering_2<- as.numeric(as.character(finalData$Sub_metering_2))
finalData$Sub_metering_3<- as.numeric(as.character(finalData$Sub_metering_3))

#Plotting graph3
with(finalData,{
		plot(datetime, Sub_metering_1,type="n", xlab="", ylab="Energy sub metering", mar=c(4,4,2,2))
		lines(datetime, Sub_metering_1,col="black")
		lines(datetime, Sub_metering_2,col="red")
		lines(datetime, Sub_metering_3,col="blue")
		legend("topright", lwd=1,col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

#Exporting graph to png file
dev.copy(png,"plot3.png")
dev.off()

