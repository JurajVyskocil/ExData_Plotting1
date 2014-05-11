colclass = c(rep("character",2),rep("numeric",7))
dt <- read.table("household_power_consumption.txt",header=TRUE,na.strings="?", colClasses=colclass,sep=";")
requiredRows <- grep("^[12]/2/2007",dt$Date)
data <- as.data.frame(dt[requiredRows,])

library(lubridate)
timetrack <- dmy_hms(paste(data$Date,data$Time))
Sys.setlocale("LC_TIME", "English")

png("plot2.png")
plot(timetrack,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
