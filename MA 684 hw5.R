depression<-read.csv(file.choose())
attach(depression)
reg.out<- lm(dep_symptoms ~ sexmale + age + yrsed + drinks)
summary(reg.out)
summary.aov(reg.out)

light<-99
light[drinkcat==1]<-1
light[drinkcat==0 | drinkcat==2]<-0
heavy<-99
heavy[drinkcat==2]<-1
heavy[drinkcat==0 | drinkcat==1]<-0

reg.out1<- lm(dep_symptoms ~ sexmale + age + yrsed + light + heavy )
summary(reg.out1)
summary.aov(reg.out1)
reg.reduced<- lm(dep_symptoms ~ sexmale + age + yrsed)
summary(reg.reduced)
summary.aov(reg.reduced)


newdata<-data.frame(sexmale=1 + age=30 + yrsed=16 + drinks=0)
predict(reg.out, data.frame(sexmale=1 , age=30 , yrsed=16 , drinks=0), interval="predict")
