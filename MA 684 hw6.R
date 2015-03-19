hw6<- read.csv(file.choose())
attach(hw6)

democrats<-99
democrats[party==1]<-1
democrats[party==2 | party==3]<-0
republicans<-99
republicans[party==2]<-1
republicans[party==1 | party==2]<-0

reg.out<- lm(paware ~ age + sexf + yearsed + democrats + republicans)

summary(reg.out)
summary.aov(reg.out)