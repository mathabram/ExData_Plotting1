# plot2.R
classes <- c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data2 <- read.table(file="household_power_consumption.txt",sep=";",na.strings="?",header=TRUE,colClasses=classes,comment.char="")
data2$datetime <- strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S")
 
par(mfcol = c(1,1),mar=c(4,4,2,1),cex=1)
Global_active_power <- data2[[3]][data2[[1]]=="1/2/2007" | data2[[1]]=="2/2/2007"]
datetime <- data2[[10]][data2[[1]]=="1/2/2007" | data2[[1]]=="2/2/2007"]
 
plot(datetime,Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png")
dev.off()
 

