import os
import csv

def missing_hillshade_list(folder,input_csv):
    forest_data = os.path.join(folder,input_csv)

    missing3pm = {}

    with open(forest_data, 'rb') as csvfile:
        csvreader = csv.reader(csvfile,delimiter=',')

        header = True

        for row in csvreader:
            if header == True:
                header = False
                continue
            if row[9] == '0':
                missing3pm[int(row[0])] = list()
                missing3pm[int(row[0])].append(int(row[7]))
                missing3pm[int(row[0])].append(int(row[8]))

    print(missing3pm)
    print(len(missing3pm))

    return missing3pm

def missing_hillshade_values(folder,input_csv,hs_dict):
    forest_data = os.path.join(folder,input_csv)

    outputvalues = {}
    keylist = []
    noon_3_diff = 0
    i = 0
    hs_keys = list(hs_dict.keys())

    with open(forest_data, 'rb') as csvfile:
        csvreader = csv.reader(csvfile,delimiter=',')

        header = True

        for row in csvreader:
            if header == True:
                header = False
                continue
            if row[9] != '0':#calculate the average change between noon and 3
                noon_3_diff = noon_3_diff + (int(row[8])-int(row[9]))
                i = i + 1
            for key, value in hs_dict.iteritems():
                if int(row[7]) == value[0] and int(row[8]) == value[1] and row[9] != '0':
                    if key not in keylist:
                        outputvalues[key] = list()
                        keylist.append(key)
                    outputvalues[key].append(int(row[9]))#append 3pm value of any record with an identical 9am and noon value

    csvfile.close()

    with open(forest_data, 'rb') as csvfile:
        csvreader = csv.reader(csvfile,delimiter=',')
                
        header = True
        skiplist = list(outputvalues.keys())#list of keys with missing 3pm but which have values assigned from first loop

        for row in csvreader:
            if header == True:
                header = False
                continue
            for key, value in hs_dict.iteritems():
                if key in skiplist:#skip those which were assigned in first loop
                    continue
                elif int(row[7]) in range(value[0]-2,value[0]+2) and int(row[8]) in range(value[1]-2,value[1]+2) and row[9] != '0':
                    if key not in keylist:
                        outputvalues[key] = list()
                        keylist.append(key)
                    outputvalues[key].append(int(row[9]))#append 3pm value of any record with noon and 9pm +/- 2                 

    csvfile.close()

    average_diff = int(noon_3_diff/i)

    skiplist = list(outputvalues.keys())#update skiplist with second loop
    for key, value in hs_dict.iteritems():
        if key not in skiplist:
            outputvalues[key] = list()
            outputvalues[key].append(value[1]+average_diff)
            
    missingvalues = {} #id of records with missing 3pm and value to append

    for key, value in outputvalues.iteritems():
        _3pmvalue = int(sum(value)/len(value))
        missingvalues[key] = _3pmvalue

    print(missingvalues)
    print(len(missingvalues))

    return missingvalues

def write_values(folder,input_csv,output_csv,missing_dict):
    i_csv = os.path.join(folder,input_csv)
    o_csv = os.path.join(folder,output_csv)

    missing_keys = list(missing_dict.keys())

    with open(o_csv,'wb') as csvfile1:
        csvwriter = csv.writer(csvfile1,delimiter=',')

        with open(i_csv, 'rb') as csvfile:
            csvreader = csv.reader(csvfile,delimiter=',')

            for row in csvreader:
                if row[0] == 'Id':
                    csvwriter.writerow([row[0],row[1],row[2],row[3],row[4],row[5],row[6],row[7],row[8],row[9],row[10],row[11],row[12]])
                elif int(row[0]) in missing_keys:
                    csvwriter.writerow([row[0],row[1],row[2],row[3],row[4],row[5],row[6],row[7],row[8],missing_dict[int(row[0])],row[10],row[11],row[12]])
                else:
                    csvwriter.writerow([row[0],row[1],row[2],row[3],row[4],row[5],row[6],row[7],row[8],row[9],row[10],row[11],row[12]])
    return

def main():
    folder = r'H:\DWM\Kaggle\Data'
    input_csv = r'train_reduced.csv'
    output_csv = r'missing_hillshade.csv'

    hs_dict = missing_hillshade_list(folder,input_csv)
    missing_dict = missing_hillshade_values(folder,input_csv,hs_dict)
    write_values(folder,input_csv,output_csv,missing_dict)

if __name__ == '__main__':
    main()
    print ('Done!')
