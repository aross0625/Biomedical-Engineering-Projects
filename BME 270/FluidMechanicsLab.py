import random
import time
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import xlrd
import statistics
import math

FlowRate1Workbook = pd.read_excel('FlowRate1.xlsx')
FlowRate2Workbook = pd.read_excel('FlowRate2.xlsx')

average1_1 = sum(FlowRate1Workbook['Group 1'])/len(FlowRate1Workbook['Group 1'])
average2_1 = sum(FlowRate1Workbook['Group 2'])/len(FlowRate1Workbook['Group 2'])
average3_1 = sum(FlowRate1Workbook['Group 3'])/len(FlowRate1Workbook['Group 3'])
average4_1 = sum(FlowRate1Workbook['Group 4'])/len(FlowRate1Workbook['Group 4'])
average5_1 = sum(FlowRate1Workbook['Group 5'])/len(FlowRate1Workbook['Group 5'])
average6_1 = sum(FlowRate1Workbook['Group 6'])/len(FlowRate1Workbook['Group 6'])
average7_1 = sum(FlowRate1Workbook['Group 7'])/len(FlowRate1Workbook['Group 7'])
average8_1 = sum(FlowRate1Workbook['Group 8'])/len(FlowRate1Workbook['Group 8'])
average9_1 = sum(FlowRate1Workbook['Group 9'])/len(FlowRate1Workbook['Group 9'])
average10_1 = sum(FlowRate1Workbook['Group 10'])/len(FlowRate1Workbook['Group 10'])

average1_2 = sum(FlowRate2Workbook['Group 1'])/len(FlowRate2Workbook['Group 1'])
average2_2 = sum(FlowRate2Workbook['Group 2'])/len(FlowRate2Workbook['Group 2'])
average3_2 = sum(FlowRate2Workbook['Group 3'])/len(FlowRate2Workbook['Group 3'])
average4_2 = sum(FlowRate2Workbook['Group 4'])/len(FlowRate2Workbook['Group 4'])
average5_2 = sum(FlowRate2Workbook['Group 5'])/len(FlowRate2Workbook['Group 5'])
average6_2 = sum(FlowRate2Workbook['Group 6'])/len(FlowRate2Workbook['Group 6'])
average7_2 = sum(FlowRate2Workbook['Group 7'])/len(FlowRate2Workbook['Group 7'])
average8_2 = sum(FlowRate2Workbook['Group 8'])/len(FlowRate2Workbook['Group 8'])
average9_2 = sum(FlowRate2Workbook['Group 9'])/len(FlowRate2Workbook['Group 9'])
average10_2 = sum(FlowRate2Workbook['Group 10'])/len(FlowRate2Workbook['Group 10'])

std1_1 = statistics.stdev(FlowRate1Workbook['Group 1'])
std2_1 = statistics.stdev(FlowRate1Workbook['Group 2'])
std3_1 = statistics.stdev(FlowRate1Workbook['Group 3'])
std4_1 = statistics.stdev(FlowRate1Workbook['Group 4'])
std5_1 = statistics.stdev(FlowRate1Workbook['Group 5'])
std6_1 = statistics.stdev(FlowRate1Workbook['Group 6'])
std7_1 = statistics.stdev(FlowRate1Workbook['Group 7'])
std8_1 = statistics.stdev(FlowRate1Workbook['Group 8'])
std9_1 = statistics.stdev(FlowRate1Workbook['Group 9'])
std10_1 = statistics.stdev(FlowRate1Workbook['Group 10'])

std1_2 = statistics.stdev(FlowRate2Workbook['Group 1'])
std2_2 = statistics.stdev(FlowRate2Workbook['Group 2'])
std3_2 = statistics.stdev(FlowRate2Workbook['Group 3'])
std4_2 = statistics.stdev(FlowRate2Workbook['Group 4'])
std5_2 = statistics.stdev(FlowRate2Workbook['Group 5'])
std6_2 = statistics.stdev(FlowRate2Workbook['Group 6'])
std7_2 = statistics.stdev(FlowRate2Workbook['Group 7'])
std8_2 = statistics.stdev(FlowRate2Workbook['Group 8'])
std9_2 = statistics.stdev(FlowRate2Workbook['Group 9'])
std10_2 = statistics.stdev(FlowRate2Workbook['Group 10'])

avg1array = [average1_1,average2_1,average3_1,average4_1,average5_1,average6_1,average7_1,average8_1,average9_1,average10_1]
avg2array = [average1_2,average2_2,average3_2,average4_2,average5_2,average6_2,average7_2,average8_2,average9_2,average10_2]
std1array = [std1_1,std2_1,std3_1,std4_1,std5_1,std6_1,std7_1,std8_1,std9_1,std10_1]
std2array = [std1_2,std2_2,std3_2,std4_2,std5_2,std6_2,std7_2,std8_2,std9_2,std10_2]

i = 0
LB1 = []
UB1 = []
LB2 = []
UB2 = []

for i in range(10):
    LB1.append(avg1array[i]-(1.96*(std1array[i]/math.sqrt(21))))
    LB2.append(avg2array[i]-(1.96*(std2array[i]/math.sqrt(21))))
    UB1.append(avg1array[i]+(1.96*(std1array[i]/math.sqrt(21))))
    UB2.append(avg2array[i]+(1.96*(std2array[i]/math.sqrt(21))))
    i = i+1

i = 0
while i < len(UB1):
    if i == 8:
        plt.plot((LB1[i],UB1[i]),(i+1,i+1),color='purple',linewidth=2)
    else:
        plt.plot((LB1[i],UB1[i]),(i+1,i+1),color='black',linewidth=1)
    i = i + 1

plt.axvline(x=6.616190476)
plt.title('Flow Rate 1')
plt.xlabel('Flow Rate (in^3/s)')
plt.show()


i = 0
while i < len(UB2):
    if i == 8:
        plt.plot((LB2[i],UB2[i]),(i+1,i+1),color='purple',linewidth=2)
    else:
        plt.plot((LB2[i],UB2[i]),(i+1,i+1),color='black',linewidth=1)
    i = i + 1

plt.axvline(x=4.61352381)
plt.title('Flow Rate 2')
plt.xlabel('Flow Rate (in^3/s)')
plt.show()
