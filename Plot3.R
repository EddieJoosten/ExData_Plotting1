# The data file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip has been unzipped
# Set the working directory to the right folder.
setwd("D:/Documenten/Data Science/4. Exploratory Data Analysis/exdata_data_household_power_consumption")
# Now read the dataset 
hhpwr<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
#
# Add a date time column
hhpwr$DateTime<-strptime(paste(hhpwr$Date,hhpwr$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
#
# Convert the date field to a proper date
hhpwr$Date<-as.Date(hhpwr$Date,"%d/%m/%Y")
#
# Select only the data from the first end second of February 2007
hhpwr_sub<-hhpwr[hhpwr$Date=="2007-02-01"|hhpwr$Date=="2007-02-02",]
#
# Open the png-output file
png(file = "Plot3.png", width = 480, height = 480)
#
# Create the plot in 5 steps:
# 1) Print plot area with labels
with(hhpwr_sub,plot(DateTime,Sub_metering_1,ylab="Energy sub metering", xlab="", type="n"))
# 2) Plot sub_metering_1 in black
with(subset(hhpwr_sub,Sub_metering_1>=0), points(DateTime,Sub_metering_1,col="black",type="l"))
# 3) Plot sub_metering_2 in red
with(subset(hhpwr_sub,Sub_metering_2>=0), points(DateTime,Sub_metering_2,col="red",type="l"))
# 4) Plot sub_metering_3 in blue
with(subset(hhpwr_sub,Sub_metering_3>=0), points(DateTime,Sub_metering_3,col="blue",type="l"))
# Pint the legend
legend("topright",lwd=1,col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#
# Close the device
dev.off()