unzip("exdata_data_household_power_consumption.zip")
power <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE, sep=";")
Needdays <-power[power$Date=="1/2/2007"|power$Date=="2/2/2007",]
GlobalActivePower <-Needdays[,"Global_active_power"]
GAP <- as.numeric(GlobalActivePower)
png("plot1.png",width=480, height=480)
hist(GAP,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylim=c(0,1200))
dev.off()