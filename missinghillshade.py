import os
import csv

def missing_hillshade(folder,input_csv):
    forest_data = os.path.join(folder,input_csv)

    missing3pm = {}
    forest_list = []

    with open(forest_data, 'rb') as csvfile:
        csvreader = csv.reader(csvfile,delimiter=',')

        header = True

        for row in csvreader:
            if header == True:
                header = False
                continue
            forest_list.append([int(row[0]),int(row[7]),int(row[8]),int(row[9])])


        for item in forest_list:
            if item[3] == 0:
                missing3pm[item[0]] = [int(item[1]),int(item[2])]
        
        replacement = {}
        #replacement = defaultdict(list)

        for key, value in missing3pm.iteritems():
            for item in forest_list:
                print(item)
                if item[1] == value[0] and item[2] == value[1] and item[3] != 0:
                    print(item[1],item[2],item[3])
                    replacement[key] = list()
                    replacement[key].append(int(item[3]))
        
    print(replacement)

def main():
    folder = r'H:\DWM\Kaggle\Data'
    input_csv = r'train_reduced.csv'

    missing_hillshade(folder,input_csv)

if __name__ == '__main__':
    main()
    print ('Done!')
