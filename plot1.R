colclass = c(rep("character",2),rep("numeric",7))
dt <- read.table("household_power_consumption.txt",header=TRUE,na.strings="?", colClasses=colclass,sep=";")
requiredRows <- grep("^[12]/2/2007",dt$Date)
data <- as.data.frame(dt[requiredRows,])

png("plot1.png")
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()
