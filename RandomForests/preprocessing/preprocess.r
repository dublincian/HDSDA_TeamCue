train <- read.csv("train.csv")

hillshade <- read.csv("hillshade.csv")
View(hillshade)

###Train_30pm###
plot(train$Hillshade_3pm, train$Hillshade_Noon)
plot(train$Hillshade_Noon, train$Hillshade_9am)
plot(train$Hillshade_3pm,train$Hillshade_9am)

trainhillshadefix <- read.csv("trainhillshadefix.csv")
View(trainhillshadefix)

###Hillshade_3pm ###
plot(trainhillshadefix$Hillshade_3pm, trainhillshadefix$Hillshade_Noon)
plot(trainhillshadefix$Hillshade_Noon, trainhillshadefix$Hillshade_9am)
plot(trainhillshadefix$Hillshade_3pm,trainhillshadefix$Hillshade_9am)

#Feature Scaling
trainhillshadefix_backup <- trainhillshadefix

#normalise the data to values between 0 and 1

#Elevation
trainhillshadefix$Elevation = ((trainhillshadefix$Elevation - min(trainhillshadefix$Elevation))/(max(trainhillshadefix$Elevation)-min(trainhillshadefix$Elevation)) )
#Aspect
trainhillshadefix$Aspect = ((trainhillshadefix$Aspect - min(trainhillshadefix$Aspect))/(max(trainhillshadefix$Aspect)-min(trainhillshadefix$Aspect)) )
#Slope
trainhillshadefix$Slope = ((trainhillshadefix$Slope - min(trainhillshadefix$Slope))/(max(trainhillshadefix$Slope)-min(trainhillshadefix$Slope)) )
#Horizontal_Distance_To_Hydrology
trainhillshadefix$Horizontal_Distance_To_Hydrology = ((trainhillshadefix$Horizontal_Distance_To_Hydrology - min(trainhillshadefix$Horizontal_Distance_To_Hydrology))/(max(trainhillshadefix$Horizontal_Distance_To_Hydrology)-min(trainhillshadefix$Horizontal_Distance_To_Hydrology)) )

#Vertical_Distance_To_Hydrology
trainhillshadefix$Vertical_Distance_To_Hydrology = ((trainhillshadefix$Vertical_Distance_To_Hydrology - min(trainhillshadefix$Vertical_Distance_To_Hydrology))/(max(trainhillshadefix$Vertical_Distance_To_Hydrology)-min(trainhillshadefix$Vertical_Distance_To_Hydrology)) )

#Horizontal_Distance_To_Roadways
trainhillshadefix$Horizontal_Distance_To_Roadways = ((trainhillshadefix$Horizontal_Distance_To_Roadways - min(trainhillshadefix$Horizontal_Distance_To_Roadways))/(max(trainhillshadefix$Horizontal_Distance_To_Roadways)-min(trainhillshadefix$Horizontal_Distance_To_Roadways)) )

#Hillshade_9am
trainhillshadefix$Hillshade_9am = ((trainhillshadefix$Hillshade_9am - min(trainhillshadefix$Hillshade_9am))/(max(trainhillshadefix$Hillshade_9am)-min(trainhillshadefix$Hillshade_9am)) )

#Hillshade_Noon
trainhillshadefix$Hillshade_Noon = ((trainhillshadefix$Hillshade_Noon - min(trainhillshadefix$Hillshade_Noon))/(max(trainhillshadefix$Hillshade_Noon)-min(trainhillshadefix$Hillshade_Noon)) )

#Hillshade_3pm
trainhillshadefix$Hillshade_3pm = ((trainhillshadefix$Hillshade_3pm - min(trainhillshadefix$Hillshade_3pm))/(max(trainhillshadefix$Hillshade_3pm)-min(trainhillshadefix$Hillshade_3pm)) )

#Horizontal_Distance_To_Fire_Points
trainhillshadefix$Horizontal_Distance_To_Fire_Points = ((trainhillshadefix$Horizontal_Distance_To_Fire_Points - min(trainhillshadefix$Horizontal_Distance_To_Fire_Points))/(max(trainhillshadefix$Horizontal_Distance_To_Fire_Points)-min(trainhillshadefix$Horizontal_Distance_To_Fire_Points)) )

write.csv(trainhillshadefix, "trainnorm.csv", row.names = FALSE)
trainnorm <- read.csv("trainnorm.csv")
