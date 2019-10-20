History = 3
Math = 1
Art = 4
Reading = 3
Science = 3

data = [['History', History, 2, 1, 0.12],
        ['Math', Math, 4, 2, 0.23],
        ["Art", Art, 5, 2, 0.75 ],
        ["Reading", Reading,10, 4, 0.23],
        ["Science", Science,30,5,  0.23],
        ["History", History,14,6, 0.34 ],
        ["History", History,7,7, 0.45 ],
        ["Art", Art,3,8, 0.23 ],
        ["Reading", Reading,1,9, 0.45 ]]
for i in range(0, 9):
    data[i].append(round(data[i][2]/data[i][1]/data[i][4], 2))

data.sort(key=lambda x: x[5])
data

print('Class'+ '\t\tClass Credit' + '\tDays Left' + '\tAssignment Number' + '\tAssignemnt Weight')
for i in range(0, 9):
    print(str(data[i][0])
          + "\t\t\t" + str(data[i][1])
          + "\t\t" + str(data[i][2])
          + "\t\t" + str(data[i][3])
          + "\t\t\t" + str(data[i][4]))
