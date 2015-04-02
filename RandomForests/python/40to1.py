# use pandas package
import pandas

# assign the csv to a dataframe
df = pandas.read_csv("train.csv")

# define the new columns in the dataframe and set to 0
df['Soil'] = 0
df['Wilderness'] = 0

# loop through the columns that have 'Soil_Type'
# check the value (0 or 1) and if it's a 1, return all the characters after
# the part of the name that contains 'Soil_Type' as a string

for i in range(1,41):
    df['Soil'] = df['Soil'] + i*df['Soil_Type'+str(i)]

# loop through the columns that have 'Wilderness_Area'
# check the value (0 or 1) and if it's a 1, return all the characters after
# the part of the name that contains 'Wilderness_Area' as a string

for i in range(1,5):
    df['Wilderness'] = df['Wilderness'] + i*df['Wilderness_Area'+str(i)]

# After filling in all the new columns with the returned value
# drop all the columns that are now unnecessary 

soil_type_cols = [col for col in df if 'Soil_Type' in col]
wilderness_cols = [col for col in df if 'Wilderness_Area' in col]

df = df.drop(soil_type_cols+wilderness_cols, axis=1)

# write dataframe to csv file using pandas
df.to_csv("trainresult.csv")

