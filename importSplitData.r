library(caret)
ForestData<-read.csv("train.csv")
set.seed(16)
index <- createDataPartition(ForestData$Id, p=.8,list=FALSE,times=1)
head(index)
ForestData.Train<-ForestData[index,]
ForestData.Test<-ForestData[-index,]