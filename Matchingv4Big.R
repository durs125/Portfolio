
#This code takes offence data and compares it to a list of known offenses
#All software contained in this repository is Copyright David Infortunio. 
library("gdata")
library("stringr")
#library("stringr", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.2")
library("openxlsx")
library("gdata")
#library("gdata", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.2")
#library("ff", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.2")
library("ff")
#library("doParallel", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.2")
library("doParallel")
#library("doMC", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.2")
library("doMC")
registerDoMC(cores=3)
registerDoParallel(cores=3)
#offences<-read.csv.ffdf("/home/david/Documents/appleseed/DebtList3.csv")
#system.time(expr=offences<-read.csv.ffdf("/home/david/Documents/appleseed/DebtList.csv"))
#The following gets the list of offences

#the following should be changed to find the school data
setwd("/home/david/Documents/appleseed/debtorsPrison")
citat<-read.csv2(file="limitedToClassCNoMar.csv", sep=',', header=TRUE)  
citat2<-citat
#citat<-citat2


#citat<-citat2[6000:7000,]

offences<-read.csv("/home/david/Documents/appleseed/DebtList4.csv")

offences[,1]<-sapply(offences[,1],trim)
offences2<-offences


citation<-citat$Offense  
citation<-trim(citation)


citation<-as.array(citation)

citation<-citation[]
        
        
# this breaks down the charges data to pull out the offence
system.time(citation2<-str_extract(citation,".*"))
citation2<-trim(citation2)

citation2<-cbind(citation2,str_extract(citation,"MPH ZONE"))
citation2<-cbind(citation2,str_extract(citation,"([:space:]).*"))
citation2<-cbind(citation2,str_extract(citation,"(.{2,12}[:space:])")) #third column
  citation2<-cbind(citation2,str_extract(citation,"(?<=/).*"))
citation2<-cbind(citation2,str_extract(citation,".*(/)"))
x<-agrep(citation2, offences[,1], ignore.case = TRUE,value = TRUE, fixed=TRUE)
if (length(x)!=0)
        sapply(X=citation2[2:10,1],FUN=agrep, offences[,1],  max.distance=1)
f<-function(x) x[1]

system.time(ZZ<-mclapply(sapply(X=citation2[,1],agrep, as.character(offences[,1]),  max.distance = list(sub = 1,insertions=0,deletions=1),ignore.case=TRUE),f,mc.cores=3, mc.preschedule=FALSE))



zz<-as.numeric(as.matrix(ZZ))





#mcparallel(A1<- as.numeric(as.matrix(lapply(sapply(X=trim(citation2[is.na(zz),2]),agrep, offences[,1],  max.distance = list(sub = 0,insertions=0,deletions=1),ignore.case=TRUE),f))),name="A2",mc.affinity=1)

#mcparallel(B1<- as.numeric(as.matrix(lapply(sapply(X=trim(citation2[is.na(zz),3]),agrep, offences[,1],  max = list(sub = 0,insertions=0,deletions=1)),f))),"B2",mc.affinity=2)


#mcparallel(C1<- as.numeric(as.matrix(lapply(sapply(X=trim(citation2[is.na(zz),4]),agrep, offences[,1], max = list(sub = 0,insertions=0,deletions=1),ignore.case=TRUE),f))),"C2",mc.affinity=3)

#mcparallel(D1<- as.numeric(as.matrix(lapply(sapply(X=trim(citation2[is.na(zz),5]),agrep, offences[,1],  max = list(sub = 0,insertions=0,deletions=1)),f))),"D2")

#mccollect()


zz[is.na(zz)]<- as.numeric(as.matrix(mclapply(sapply(X=trim(citation2[is.na(zz),2]),agrep, offences[,1],  max.distance = list(sub = 0,insertions=0,deletions=1),ignore.case=TRUE),f)))
zz[is.na(zz)]<- as.numeric(as.matrix(mclapply(sapply(X=trim(citation2[is.na(zz),3]),agrep, offences[,1],  max = list(sub = 0,insertions=0,deletions=1)),f)))
zz[is.na(zz)]<- as.numeric(as.matrix(mclapply(sapply(X=trim(citation2[is.na(zz),4]),agrep, offences[,1], max = list(sub = 0,insertions=0,deletions=1),ignore.case=TRUE),f)))
zz[is.na(zz)]<- as.numeric(as.matrix(mclapply(sapply(X=trim(citation2[is.na(zz),5]),agrep, offences[,1],  max = list(sub = 0,insertions=0,deletions=1)),f)))
zz[is.na(zz)]<- as.numeric(as.matrix(mclapply(sapply(X=trim(citation2[is.na(zz),6]),agrep, offences[,1],  max = list(sub = 0,insertions=0,deletions=1)),f)))
#zz2<-zz

#zz2[is.na(zz)]<-A1
#zz2[is.na(zz2)]<-B1[is.na(zz2)]
#zz2[is.na(zz2)]<-C1[is.na(zz2)]
#zz2[is.na(zz)]<-D1[is.na(zz2)]


citat<-rename.vars(citat,from="Offense",to="OffenseEdited")

output<-cbind(citat, offences[zz,2:3])
#output2<-output[order(output[,length(output)]),]
output2<-output
#rename your columns

 
notNA<-is.na(output2[,1])
output4<-output2[(!notNA),]

#direct the file output
write.csv(output4,"debtorPrisonElPasov2.csv")
        
        
