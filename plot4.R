unzip("exdata_data_household_power_consumption.zip")
power <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE, sep=";")
Needdays <-power[power$Date=="1/2/2007"|power$Date=="2/2/2007",]
GlobalActivePower <-Needdays[,"Global_active_power"]
GlobalReactivePower <- Needdays[,"Global_reactive_power"]
SubMeter1<- Needdays[, "Sub_metering_1"]
SubMeter2<- Needdays[, "Sub_metering_2"]
SubMeter3<- Needdays[, "Sub_metering_3"]
Voltage <- Needdays[,"Voltage"]
GAP <- as.numeric(GlobalActivePower)
GRP <- as.numeric(GlobalReactivePower)
Voltage <- as.numeric(Voltage)
plot1<-as.numeric(SubMeter1)
plot2<-as.numeric(SubMeter2)
plot3<-as.numeric(SubMeter3)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(GAP,type="l",xlab="",ylab="Global Active Power",pch=".",xaxt='n')
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
plot(Voltage,type="l",xlab="datetime",ylab="Voltage",pch=".",xaxt='n')
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
Graph <- plot(plot1,type="l",xlab="",ylab="Energy sub metering",,pch=".",xaxt='n')
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
lines(plot2,type="l",pch=".",col="red")
lines(plot3,type="l",pch=".",col="blue")
legend("topright",col=c("black","red","blue"),pch=".",lty=1,cex=.8,legend=
c("sub_metering_1","sub_metering_2","sub_metering_3"))
plot(GRP,type="l",xlab="datetime",ylab="Global_reactive_power",pch=".",xaxt='n')
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()