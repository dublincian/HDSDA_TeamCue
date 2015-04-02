#
# Project: Predict Bike Sharing Demand using R
# Author : Gopinath Munisifreddy
# Date   : Aug-18-2014
#


#Loading training file as well as test file - CHANGE THIS PATH APPROPRIATELY
train <- read.csv("D:\\data-science\\bikesharing\\train.csv")
test <- read.csv("D:\\data-science\\bikesharing\\test.csv")

#install required libraries
install.packages("lubridate") 
install.packages('randomForest')
library(lubridate)
library(randomForest)

#Compute hour of the day
train$hour <-hour(train$datetime)
test$hour <- hour(test$datetime)

#Compute day of the week
train$dow <- wday(train$datetime)
test$dow <- wday(test$datetime)

test$count<-0
#Create a random forest
fit <- randomForest(as.factor(Cover_Type) ~ Aspect+Slope+Horizontal_Distance_To_Hydrology+Vertical_Distance_To_Hydrology +  Horizontal_Distance_To_Roadways	+ Hillshade_9am	+ Hillshade_Noon + Hillshade_3pm + Horizontal_Distance_To_Fire_Points + Wilderness + Soil, data=ForestData.Train, ntree = 700, importance=TRUE)
#Uncomment the following line if you want to see how your model plot looks like
#varImpPlot(fit)

#Predict values and save output
Prediction <- predict(fit, test)
submit <- data.frame(datetime = test$datetime, count = Prediction)
write.csv(submit, file = "random-forest.csv", row.names = FALSE)