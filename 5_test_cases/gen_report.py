import os
import random
import subprocess
import time
import webbrowser
import sys 
import csv
import math
import statistics

#performanceFileReport = sys.argv[1]
def percentile(data, percentile):
    size = len(data)
    data=sorted(data)
    return data[int(math.ceil((size * percentile) / 100)) - 1]

def min_value(data):
    data=sorted(data)
    return min(data)

def max_value(data):
    data=sorted(data)
    return max(data)

def median_value(data):
    data=sorted(data)
    return statistics.median(data)

def tps_count(transaction,total_time):
    return int(transaction)/int(total_time)

# performanceFileReport_path="/home/giang/Documents/robot_ui_performance/robot_for_performance_UI/results/execution_time_report.csv"
# csvReportsFile = "/home/giang/Documents/robot_ui_performance/robot_for_performance_UI/results/performance_report.csv"
performanceFileReport_path=sys.argv[1]
csvReportsFile = sys.argv[2]
executionTime = []
total_value=0
total_time=0
with open(performanceFileReport_path) as csvfile:
    inputcsv = csv.reader(csvfile, delimiter=',')
    for row in inputcsv:
        executionTime.append(row[1])
        total_value+=1
        total_time+=float(str(row[1]))
p_min=min_value(executionTime)
p_median=median_value(executionTime)
p_max=max_value(executionTime)
p25=percentile(executionTime,25)
p50=percentile(executionTime,50)
p75=percentile(executionTime,75)
p90=percentile(executionTime,90)
p95=percentile(executionTime,95)
p99=percentile(executionTime,99)
tps=tps_count(total_value,total_time)
with open(csvReportsFile, mode='a') as time_report_file:
    employee_writer = csv.writer(time_report_file, delimiter=',')
    employee_writer.writerow([total_value,tps,p_min,p_median,p_max,p25,p50,p75,p90,p95,p99])