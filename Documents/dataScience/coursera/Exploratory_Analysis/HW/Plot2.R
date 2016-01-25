

download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
unzip("household_power_consumption.zip","household_power_consumption.txt")


coursera<-read.delim2("household_power_consumption.txt", sep=";")
core<-coursera

core2<-core3<-coursera[1:20,]
paste(core2[,1],core2[,2])


z<-strptime(paste(core2[,1],core2[,2]),format="%d/%m/%Y %T")
core2<-core[((as.Date(core[,1],"%d/%m/%Y")==as.Date("1/2/2007","%d/%m/%Y"))|(as.Date(core[,1],"%d/%m/%Y")==as.Date("2/2/2007","%d/%m/%Y"))),]
zz<-core2[,3]
png("plot2.png",width=480,height=480,units="px")

plot(x=z,y=as.numeric(matrix(zz)), ylab="global active power", type="l")
dev.off()