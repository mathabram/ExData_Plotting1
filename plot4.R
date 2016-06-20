# plot4.R
classes <- c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data2 <- read.table(file="household_power_consumption.txt",sep=";",na.strings="?",header=TRUE,colClasses=classes,comment.char="")
data2$datetime <- strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S")

Global_active_power <- data2[[3]][data2[[1]]=="1/2/2007" | data2[[1]]=="2/2/2007"]
datetime <- data2[[10]][data2[[1]]=="1/2/2007" | data2[[1]]=="2/2/2007"]
Sub_metering_1 <- data2[[7]][data2[[1]]=="1/2/2007" | data2[[1]]=="2/2/2007"]
Sub_metering_2 <- data2[[8]][data2[[1]]=="1/2/2007" | data2[[1]]=="2/2/2007"]
Sub_metering_3 <- data2[[9]][data2[[1]]=="1/2/2007" | data2[[1]]=="2/2/2007"]
Voltage <- data2[[5]][data2[[1]]=="1/2/2007" | data2[[1]]=="2/2/2007"]
Global_reactive_power <- data2[[4]][data2[[1]]=="1/2/2007" | data2[[1]]=="2/2/2007"]
 
par(mfcol = c(2,2),mar=c(4,4,1,1),cex=0.8 ,xpd=FALSE)
plot(datetime,Global_active_power,type="l",xlab="",ylab = "Global Active Power")
plot(datetime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
legend(x="top", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),box.col="white")
points(datetime,Sub_metering_1,type="l")
points(datetime,Sub_metering_2,type="l",col="red")
points(datetime,Sub_metering_3,type="l",col="blue")
plot(datetime,Voltage,type="l",xlab="datetime")
plot(datetime,Global_reactive_power,type="l",xlab="datetime")

dev.copy(png,file="plot4.png")
dev.off()
 