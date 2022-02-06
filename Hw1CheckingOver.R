
OA<-c(27, 33)
NoOA<-c(183, 147)
datat<-cbind(OA, NoOA)
chisq.test(datat)
chisquare(datat, correct=F)


#Checking HW1
library(openxlsx)
data<-read.xlsx("ICU.xlsx")
#How would you get percentages here?
table(data$STA)

#Checking logistic regression output

fit<-glm(STA~1, data=data, family=binomial(link="logit"))
summary(fit)

#Age predictor
fit2<-glm(STA~AGE, data=data, family=binomial(link="logit"))
summary(fit2)
invlogit(-3.05+0.027*45)


#Sex predictor

#flip to set female as the reference category

fit3<-glm(STA~SEX, data=data, family=binomial(link = "logit"))
summary(fit3)


