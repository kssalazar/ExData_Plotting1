setwd("C:/Users/zzz KATHY/Coursera/Exploratory Data Analysis/Project 1")

### Read the data
hh_power  <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Filter dates from2007-02-01 and 2007-02-02
hh_power2 <- subset(hh_power, Date %in% c("1/2/2007","2/2/2007"))

## Change Date Column to Date Type
hh_power2$Date <- as.Date(hh_power2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hh_power2$Date), hh_power2$Time)
hh_power2$Datetime <- as.POSIXct(datetime)

## plot3
png("plot3.png", width=480, height=480)
with(hh_power2, {
     plot(Sub_metering_1~Datetime, type="l",
          ylab="Global Active Power (kilowatts)", xlab="")
     lines(Sub_metering_2~Datetime,col='Red')
     lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
