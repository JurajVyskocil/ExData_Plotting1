colclass = c(rep("character",2),rep("numeric",7))
dt <- read.table("household_power_consumption.txt",header=TRUE,na.strings="?", colClasses=colclass,sep=";")
requiredRows <- grep("^[12]/2/2007",dt$Date)
data <- as.data.frame(dt[requiredRows,])

library(lubridate)
timetrack <- dmy_hms(paste(data$Date,data$Time))
Sys.setlocale("LC_TIME", "English")

png("plot3.png")
plot(timetrack,data$Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
lines(timetrack,data$Sub_metering_2,col="red")
lines(timetrack,data$Sub_metering_3,col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

