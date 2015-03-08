unzip("exdata_data_household_power_consumption.zip")
power <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE, sep=";")
Needdays <-power[power$Date=="1/2/2007"|power$Date=="2/2/2007",]
GlobalActivePower <-Needdays[,"Global_active_power"]
GAP <- as.numeric(GlobalActivePower)
png("plot2.png", width=480, height=480)
plot(GAP,type="l",xlab="",ylab="Global Active Power (kilowatts)",pch=".",xaxt='n')
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()