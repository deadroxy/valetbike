file = open('bikes.txt', 'r')
Lines = file.readlines()
file.close()

stationList = [21,24,30,25,29,33,20,26,23,27,31,28,32,22]
 
count = 1
finalLine = ''
# Strips the newline character
for line in Lines:
    id = line[5:-6]
    if id != "NULL":
        id = stationList.index(int(id))+1
    finalLine+='('+str(count)+','+line[0:4]+','+str(id)+",'2021-09-12 20:50:51.740289','2021-09-12 20:50:51.740289'),"
    print('('+str(count)+','+line[0:4]+','+str(id)+",'2021-09-12 20:50:51.740289','2021-09-12 20:50:51.740289'),")
    count += 1
# print(finalLine)
file2 = open('bikesReady.txt', 'w')
file2.truncate(0)
file2.writelines(finalLine)
file2.close()