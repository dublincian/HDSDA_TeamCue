import os
import csv

def soil_type(folder,input_csv,output_csv):
    forest_data = os.path.join(folder,input_csv)
    reduced_csv = os.path.join(folder,output_csv)

    input_list = []

    with open(forest_data, 'rb') as csvfile:
        csvreader = csv.reader(csvfile,delimiter=',')

        header = True

        for row in csvreader:
            if header == True:
                header = False
                continue
            input_list.append(row)

    with open(reduced_csv,'wb') as csvfile1:
        csvwriter = csv.writer(csvfile1,delimiter=',')

        csvwriter.writerow(['Id','Elevation','Aspect','Slope','HDist_Hydrology','VDist_Hydrology','HDist_Roadways','HS_9am','HS_Noon','HS_3pm','HDist_Fire','Wilderness','Soil','Cover_Type'])
        for site in input_list:
            soil = 0
            wilderness = 0
            
            if site[11] == '1':
                wilderness = 11
            elif site[12] == '1':
                wilderness = 12
            elif site[13] == '1':
                wilderness = 13
            elif site[14] == '1':
                wilderness = 14
            
            if site[15] == '1':
                soil = 15
            elif site[16] == '1':
                soil = 16
            elif site[17] == '1':
                soil = 17
            elif site[18] == '1':
                soil = 18
            elif site[19] == '1':
                soil = 19
            elif site[20] == '1':
                soil = 20
            elif site[21] == '1':
                soil = 21
            elif site[22] == '1':
                soil = 22
            elif site[23] == '1':
                soil = 23
            elif site[24] == '1':
                soil = 24
            elif site[25] == '1':
                soil = 25
            elif site[26] == '1':
                soil = 26
            elif site[27] == '1':
                soil = 27
            elif site[28] == '1':
                soil = 28
            elif site[29] == '1':
                soil = 29
            elif site[30] == '1':
                soil = 30
            elif site[31] == '1':
                soil = 31
            elif site[32] == '1':
                soil = 32
            elif site[33] == '1':
                soil = 33
            elif site[34] == '1':
                soil = 34
            elif site[35] == '1':
                soil = 35
            elif site[36] == '1':
                soil = 36
            elif site[37] == '1':
                soil = 37
            elif site[38] == '1':
                soil = 38
            elif site[39] == '1':
                soil = 39
            elif site[40] == '1':
                soil = 40
            elif site[41] == '1':
                soil = 41
            elif site[42] == '1':
                soil = 42
            elif site[43] == '1':
                soil = 43
            elif site[44] == '1':
                soil = 44
            elif site[45] == '1':
                soil = 45
            elif site[46] == '1':
                soil = 46
            elif site[47] == '1':
                soil = 47
            elif site[48] == '1':
                soil = 48
            elif site[49] == '1':
                soil = 49
            elif site[50] == '1':
                soil = 50
            elif site[51] == '1':
                soil = 51
            elif site[52] == '1':
                soil = 52
            elif site[53] == '1':
                soil = 53
            elif site[54] == '1':
                soil = 54
            #elif site[55] == '1':
                #soil = 55
 
            csvwriter.writerow([site[0],site[1],site[2],site[3],site[4],site[5],site[6],site[7],site[8],site[9],site[10],wilderness,soil,site[55]])

    return

def main():
    folder = r'H:\DWM\Kaggle\Data'
    input_csv = r'train.csv'
    output_csv = r'train_reduced_v2.csv'

    soil_type(folder,input_csv,output_csv)

if __name__ == '__main__':
    main()
    print ('Done!')
