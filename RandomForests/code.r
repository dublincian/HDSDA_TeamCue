### Data Description ###

# Elevation - Elevation in meters
# Aspect - Aspect in degrees azimuth
# Slope - Slope in degrees
# Horizontal_Distance_To_Hydrology - Horz Dist to nearest surface water features
# Vertical_Distance_To_Hydrology - Vert Dist to nearest surface water features
# Horizontal_Distance_To_Roadways - Horz Dist to nearest roadway
# Hillshade_9am (0 to 255 index) - Hillshade index at 9am, summer solstice
# Hillshade_Noon (0 to 255 index) - Hillshade index at noon, summer solstice
# Hillshade_3pm (0 to 255 index) - Hillshade index at 3pm, summer solstice
# Horizontal_Distance_To_Fire_Points - Horz Dist to nearest wildfire ignition points
# Wilderness_Area (4 binary columns, 0 = absence or 1 = presence) - Wilderness area designation
# Soil_Type (40 binary columns, 0 = absence or 1 = presence) - Soil Type designation
# Cover_Type (7 types, integers 1 to 7) - Forest Cover Type designation


test <- read.csv("test.csv")
train <- read.csv("train.csv")
install.packages("randomForest")

#Viewing the data
summary(train)
str(train)
install.packages("car")
library(car)
names(train)
par()

### Exploring the data ###
install.packages("ggplot2")
library(ggplot2)
library(plyr)

#ggplot(data=train.df, aes(x=train.df$Elevation, y=train.df$Cover_Type))



### Elevation
hist(train$Elevation)
plot(density(train$Elevation))
qqnorm(train$Elevation)
qqline(train$Elevation)

###Aspect

hist(train$Aspect)
plot(density(train$Aspect))
qqnorm(train$Aspect)
qqline(train$Aspect)

###Slope
hist(train$Slope)
plot(density(train$Slope))
qqnorm(train$Slope)
qqline(train$Slope)


###Horizontal_Distance_To_Hydrology
hist(train$Horizontal_Distance_To_Hydrology)
plot(density(train$Horizontal_Distance_To_Hydrology))
qqnorm(train$Horizontal_Distance_To_Hydrology)
qqline(train$Horizontal_Distance_To_Hydrology)

###Vertical_Distance_To_Hydrology
hist(train$Vertical_Distance_To_Hydrology)
plot(density(train$Vertical_Distance_To_Hydrology))
qqnorm(train$Vertical_Distance_To_Hydrology)
qqline(train$Vertical_Distance_To_Hydrology)

###Hillshade_3pm ###
plot(train$Hillshade_3pm, train$Hillshade_Noon)
plot(train$Hillshade_Noon, train$Hillshade_9am)
plot(train$Hillshade_3pm,train$Hillshade_9am)


###aspect v noon ###
plot(train$Aspect, train$Hillshade_Noon)



#add new column and aggregate the soil types
#done in python



#Descriptives
install.packages("psych")
library(psych)
describe(trainresult$Elevation)

#Feature Scaling
#normalise the data to values between 0 and 1

#Elevation
trainnorm$Elevation = ((trainnorm$Elevation - min(trainnorm$Elevation))/(max(trainnorm$Elevation)-min(trainnorm$Elevation)) )
#Aspect
trainnorm$Aspect = ((trainnorm$Aspect - min(trainnorm$Aspect))/(max(trainnorm$Aspect)-min(trainnorm$Aspect)) )
#Slope
trainnorm$Slope = ((trainnorm$Slope - min(trainnorm$Slope))/(max(trainnorm$Slope)-min(trainnorm$Slope)) )



#change numeric values to factors
train$Cover_Type <- as.factor(train$Cover_Type)
str(train)

train <- read.csv("missing3pm.csv")
