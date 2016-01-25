setwd("/home/david/Documents")
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
unzip("household_power_consumption.zip","household_power_consumption.txt")


coursera<-read.delim2("household_power_consumption.txt", sep=";")
core<-coursera

core2<-core3<-coursera[1:20,]
#core[1:5,1]<-apply(coursera[1:5,1:2], FUN=strptime, format="%d/%m/%Y", MARGIN=1)
#core[1:5,1]<- as.data.frame(lapply(coursera[1:5,1:2], FUN=strptime, format="%d/%m/%Y"))



core2<-core[((as.Date(core[,1],"%d/%m/%Y")==as.Date("1/2/2007","%d/%m/%Y"))|(as.Date(core[,1],"%d/%m/%Y")==as.Date("2/2/2007","%d/%m/%Y"))),]
yy<-core2[,3]
png("plot1.png",width=480,height=480,units="px")

hist(as.numeric(matrix(yy)), col="RED", xlab= "Global_active_power (in kilowatts)", main ="Global Active Power" )
dev.off()