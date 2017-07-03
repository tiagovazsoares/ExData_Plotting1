## Download the dataset: Electric power consumption presented on Introduction and save it on your local machine
## In my case, it will be determined by the path below

setwd("C:/Users/tiago/Desktop/Coursera - Data Science/ProgrammingAssignment5")
powerdata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = F, dec =".")

## We will only be using data from the dates 2007-02-01 and 2007-02-02. So the idea here is to subset 
## our dataset passing the dates as a vector.

powerdata1 <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))
global_active_power<-as.numeric(powerdata1$Global_active_power)
png("plot1.png", width=480, height=480)
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()  

## Final print out
png 
  4 
> dev.off()
RStudioGD 
        2 
