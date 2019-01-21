setwd("C:/Users/zzz KATHY/Coursera/Exploratory Data Analysis/Project 1")

### Read the data
hh_power  <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Filter dates from2007-02-01 and 2007-02-02
hh_power2 <- subset(hh_power, Date %in% c("1/2/2007","2/2/2007"))

## Change Date Column to Date Type
hh_power2$Date <- as.Date(hh_power2$Date, format="%d/%m/%Y")

## plot1
png("plot1.png", width=480, height=480)
hist(hh_power2$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
