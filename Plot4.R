

download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
unzip("household_power_consumption.zip","household_power_consumption.txt")


coursera<-read.delim2("household_power_consumption.txt", sep=";")
core<-coursera

core2<-core3<-coursera[1:20,]
paste(core2[,1],core2[,2])


xx<-strptime(paste(core2[,1],core2[,2]),format="%d/%m/%Y %T")
core2<-core[((as.Date(core[,1],"%d/%m/%Y")==as.Date("1/2/2007","%d/%m/%Y"))|(as.Date(core[,1],"%d/%m/%Y")==as.Date("2/2/2007","%d/%m/%Y"))),]
xx1<-core2[,7]
xx2<-core2[,8]
xx3<-core2[,9]

z<-strptime(paste(core2[,1],core2[,2]),format="%d/%m/%Y %T")
core2<-core[((as.Date(core[,1],"%d/%m/%Y")==as.Date("1/2/2007","%d/%m/%Y"))|(as.Date(core[,1],"%d/%m/%Y")==as.Date("2/2/2007","%d/%m/%Y"))),]
zz<-core2[,3]


##

png("plot4.png",width=480,height=480,units="px")

par(mfcol=c(2,2))


plot(x=z,y=as.numeric(matrix(zz)), ylab="global active power", type="l")

plot(x=xx,y=as.numeric(matrix(xx1)), ylab="energy sub metering",type="l")

points(x=xx,y=as.numeric(matrix(xx2)), type="l", col="RED")

points(x=xx,y=as.numeric(matrix(xx3)), type="l", col=4)



legend(x=c(xx[750],xx[length(xx)]+70),y=c(30,39.5), bty="n",  legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col = c(1,2,4))
plot(x=z,y=as.numeric(matrix(core2[,5])), xlab="datetime", ylab="voltage", type="l")
plot(x=z,y=as.numeric(matrix(core2[,4])), xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()
