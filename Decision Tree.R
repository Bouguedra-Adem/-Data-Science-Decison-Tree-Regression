#import library
 library(caTools)
 library(rpart)
 library(ggplot2)
#import data
 data=read.csv('DecisonTree/Position_Salaries.csv')
 data <- data[2:3]
 DecisonTree=rpart(formula =Salary ~ .,data = data,control = rpart.control(minsplit = 1))
 summary(DecisonTree)
#predicting a new result 
 y_pred=predict(DecisonTree,newdata = data.frame(Level=6.5))
#Visualising result 
x_grid=seq(min(data$Level),max(data$Level),0.01)
ggplot()+geom_point(aes(x =data$Level,y=data$Salary),colour='red')+
geom_line(aes(x =x_grid,y=predict(DecisonTree,newdata = data.frame(Level=x_grid))),colour='Blue')+
ggtitle('Decison Tree')+
xlab('Level')+
ylab('salary')  
  
  
  