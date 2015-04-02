test <- read.csv("test.csv")
testcombined <- read.csv("testcombined.csv")

###test_30pm###
plot(test$Hillshade_3pm, test$Hillshade_Noon)
plot(test$Hillshade_Noon, test$Hillshade_9am)
plot(test$Hillshade_3pm,test$Hillshade_9am)

testhillshadefix <- read.csv("testhillshadefix.csv")
View(testhillshadefix)

###Hillshade_3pm ###
plot(testhillshadefix$Hillshade_3pm, testhillshadefix$Hillshade_Noon)
plot(testhillshadefix$Hillshade_Noon, testhillshadefix$Hillshade_9am)
plot(testhillshadefix$Hillshade_3pm,testhillshadefix$Hillshade_9am)

#Feature Scaling
testhillshadefix_backup <- testhillshadefix

#normalise the data to values between 0 and 1

#Elevation
testhillshadefix$Elevation = ((testhillshadefix$Elevation - min(testhillshadefix$Elevation))/(max(testhillshadefix$Elevation)-min(testhillshadefix$Elevation)) )
#Aspect
testhillshadefix$Aspect = ((testhillshadefix$Aspect - min(testhillshadefix$Aspect))/(max(testhillshadefix$Aspect)-min(testhillshadefix$Aspect)) )
#Slope
testhillshadefix$Slope = ((testhillshadefix$Slope - min(testhillshadefix$Slope))/(max(testhillshadefix$Slope)-min(testhillshadefix$Slope)) )
#Horizontal_Distance_To_Hydrology
testhillshadefix$Horizontal_Distance_To_Hydrology = ((testhillshadefix$Horizontal_Distance_To_Hydrology - min(testhillshadefix$Horizontal_Distance_To_Hydrology))/(max(testhillshadefix$Horizontal_Distance_To_Hydrology)-min(testhillshadefix$Horizontal_Distance_To_Hydrology)) )

#Vertical_Distance_To_Hydrology
testhillshadefix$Vertical_Distance_To_Hydrology = ((testhillshadefix$Vertical_Distance_To_Hydrology - min(testhillshadefix$Vertical_Distance_To_Hydrology))/(max(testhillshadefix$Vertical_Distance_To_Hydrology)-min(testhillshadefix$Vertical_Distance_To_Hydrology)) )

#Horizontal_Distance_To_Roadways
testhillshadefix$Horizontal_Distance_To_Roadways = ((testhillshadefix$Horizontal_Distance_To_Roadways - min(testhillshadefix$Horizontal_Distance_To_Roadways))/(max(testhillshadefix$Horizontal_Distance_To_Roadways)-min(testhillshadefix$Horizontal_Distance_To_Roadways)) )

#Hillshade_9am
testhillshadefix$Hillshade_9am = ((testhillshadefix$Hillshade_9am - min(testhillshadefix$Hillshade_9am))/(max(testhillshadefix$Hillshade_9am)-min(testhillshadefix$Hillshade_9am)) )

#Hillshade_Noon
testhillshadefix$Hillshade_Noon = ((testhillshadefix$Hillshade_Noon - min(testhillshadefix$Hillshade_Noon))/(max(testhillshadefix$Hillshade_Noon)-min(testhillshadefix$Hillshade_Noon)) )

#Hillshade_3pm
testhillshadefix$Hillshade_3pm = ((testhillshadefix$Hillshade_3pm - min(testhillshadefix$Hillshade_3pm))/(max(testhillshadefix$Hillshade_3pm)-min(testhillshadefix$Hillshade_3pm)) )

#Horizontal_Distance_To_Fire_Points
testhillshadefix$Horizontal_Distance_To_Fire_Points = ((testhillshadefix$Horizontal_Distance_To_Fire_Points - min(testhillshadefix$Horizontal_Distance_To_Fire_Points))/(max(testhillshadefix$Horizontal_Distance_To_Fire_Points)-min(testhillshadefix$Horizontal_Distance_To_Fire_Points)) )

write.csv(testhillshadefix, "testnorm.csv", row.names = FALSE)
testnorm <- read.csv("testnorm.csv")
