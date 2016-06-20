# plot1.R
classes <- c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data2 <- read.table(file="household_power_consumption.txt",sep=";",na.strings="?",header=TRUE,colClasses=classes,comment.char="")

par(mfcol = c(1,1),mar=c(4,4,2,1),cex=0.8)
Global_active_power <- data2[[3]][data2[[1]]=="1/2/2007" | data2[[1]]=="2/2/2007"]
 
hist(Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")

dev.copy(png,file="plot1.png")
dev.off()
 