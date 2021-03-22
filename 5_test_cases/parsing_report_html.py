import os
import random
import subprocess
import time
import webbrowser
import sys 
import csv
from datetime import datetime,timedelta
import calendar
import time
from influxdb_client import InfluxDBClient, Point, WritePrecision
from influxdb_client.client.write_api import SYNCHRONOUS

from lxml import etree
from bs4 import BeautifulSoup
from datetime import datetime
import xml.etree.ElementTree as ET

def time_to_sec(time_str):
    x = time.strptime(time_str.split('.')[0],'%H:%M:%S')
    return timedelta(hours=x.tm_hour,minutes=x.tm_min,seconds=x.tm_sec).total_seconds()

def remove_empty_lines(filename):
    if not os.path.isfile(filename):
        print("{} does not exist ".format(filename))
        return
    with open(filename) as filehandle:
        lines = filehandle.readlines()

    with open(filename, 'w') as filehandle:
        lines = filter(lambda x: x.strip(), lines)
        filehandle.writelines(lines) 

usernamesFile = sys.argv[1]
csvReportsFile = sys.argv[2]
resultFolders= sys.argv[3]
client=sys.argv[4]
token=sys.argv[5]
bucket=sys.argv[6]

token = token
org = "VN"
bucket = bucket

total_value=0
client = InfluxDBClient(url=client, token=token)


f = open(usernamesFile, 'r')
lines = f.readlines()
f.close()
for line in lines:
    user = line.strip()
    userPath = resultFolders +"/"+ user
    mytree = ET.parse(userPath+'/output.xml')
    myroot = mytree.getroot()
    status_suite=""
    for type_tag in myroot.findall('statistics/suite/stat'):
        fail=type_tag.get('fail')
        if(fail=='0'):
            for type_tag in myroot.findall('suite/status'):
                value = type_tag.get('starttime')
                value_endtime=type_tag.get('endtime')
                value_total_time=float(time_to_sec(value_endtime[9:21])-float(time_to_sec(value[9:21])))
                write_api = client.write_api(write_options=SYNCHRONOUS)
                current_time_timestamp=time.time_ns()                
                with open(csvReportsFile, mode='a') as time_report_file:
                    employee_writer = csv.writer(time_report_file, delimiter=',')
                    employee_writer.writerow([user, value_total_time])
                    time_report_file.close()
                data = "running_status,execution_time=second execution_time="+str(value_total_time)[:2]+" "+str(current_time_timestamp)+""
                write_api.write(bucket, org, data)
        else:
            for type_tag in myroot.findall('suite/test/status'):
                value = type_tag.get('starttime')
                value_endtime=type_tag.get('endtime')
                value_0="1"
                data = "running_status,status=fail status="+value_0
                write_api = client.write_api(write_options=SYNCHRONOUS)
                write_api.write(bucket, org, data)                  
                print('Fail stat is '+fail)           



