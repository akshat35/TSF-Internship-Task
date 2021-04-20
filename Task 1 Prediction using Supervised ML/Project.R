dataset=read.csv('Scores.csv')

library(caTools)
set.seed(123)
split=sample.split(dataset$Scores,SplitRatio = 3/5)
train_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)
regressor=lm(formula= Scores ~ Hours,
             data=train_set)

y_pred=predict(regressor,newdata = test_set)
library(ggplot2)
ggplot()+
  geom_point(aes(x=train_set$Hours,y=train_set$Scores),
             colour='black') +
  geom_line(aes(x=train_set$Hours,y=predict(regressor,newdata = train_set),
                colour='blue')) + 
  ggtitle('Scores vs Hours studied(Train set)')+
  xlab('Hours of study') + 
  ylab('Scores')

y_pred1=data.frame( Hours=c(9.25))
predict(regressor, newdata= y_pred1)