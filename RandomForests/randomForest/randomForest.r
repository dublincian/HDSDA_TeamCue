#install.packages("caret")
library(caret)
ForestData<-read.csv("trainnorm.csv")
summary(ForestData)
head(ForestData)

ForestData$Cover_Type<-as.factor(ForestData$Cover_Type)
ForestData$Soil<-as.factor(ForestData$Soil)
ForestData$Wilderness<-as.factor(ForestData$Wilderness)
set.seed(16)
index <- createDataPartition(ForestData$Id, p=.8,list=FALSE,times=1)
head(index)
ForestData.Train<-ForestData[index,]
ForestData.Test<-ForestData[-index,]
#install.packages("randomForest")
library(randomForest)
?randomForest
forest.rf1 <- randomForest(Cover_Type ~ ., data=ForestData.Train, importance=TRUE,proximity=TRUE)

print(forest.rf1)
round(importance(forest.rf1), 2)

forest.rf2 <- randomForest(Cover_Type ~ Elevation+Aspect+Slope, data=ForestData.Train, importance=TRUE,proximity=TRUE)
print(forest.rf2)
round(importance(forest.rf2), 2)

set.seed(123)
forest.rf3 <- randomForest(as.factor(Cover_Type) ~ Aspect+Slope+Horizontal_Distance_To_Hydrology+Vertical_Distance_To_Hydrology +	Horizontal_Distance_To_Roadways	+ Hillshade_9am	+ Hillshade_Noon + Hillshade_3pm + Horizontal_Distance_To_Fire_Points + Wilderness, data=ForestData.Train, importance=TRUE,proximity=TRUE)
varImpPlot(forest.rf3)
print(forest.rf3)
round(importance(forest.rf3), 2)
Prediction <- predict(forest.rf3, ForestData.Test)
result.rf3 <- data.frame(Id=ForestData.Test$Id, Cover_Typer=Prediction, row.names = ForestData.Test$Id)

