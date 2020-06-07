# The data file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip has been unzipped
# Set the working directory to the right folder.
setwd("D:/Documenten/Data Science/4. Exploratory Data Analysis/exdata_data_household_power_consumption")
# Now read the dataset 
hhpwr<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
#
# Convert the date field to a proper date
hhpwr$Date<-as.Date(hhpwr$Date,"%d/%m/%Y")
#
# Select only the data from the first end second of February 2007
hhpwr_sub<-hhpwr[hhpwr$Date=="2007-02-01"|hhpwr$Date=="2007-02-02",]
#
# Open the png-output file
png(file = "Plot1.png", width = 480, height = 480)
#
# Create the plot.
hist(hhpwr_sub$Global_active_power,col="red",main = "Gloabal Active Power", xlab = "Global Active Power (kilowatts)",ylab = "Frequency")
#
# Close the device
dev.off()
