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
png(file = "Plot2.png", width = 480, height = 480)
#
# Create the plot; use type = "l" to plot a line instead of dots.
with(hhpwr_sub, plot(DateTime,Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts"))
#
# Close the device
dev.off()