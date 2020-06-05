hhpwr<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
hhpwr$Date<-as.Date(hhpwr$Date,"%d/%m/%Y")
hhpwr_sub<-hhpwr[hhpwr$Date=="2007-02-01"|hhpwr$Date=="2007-02-02",]
png(file = "Plot1.png", width = 480, height = 480)
hist(hhpwr_sub$Global_active_power,col="red",main = "Gloabal Active Power", xlab = "Global Active Power (kilowatts)",ylab = "Frequency")
dev.off()