import os
import random
import subprocess
import time
import webbrowser
import sys 
import csv

from lxml import etree
from bs4 import BeautifulSoup
import xml.etree.ElementTree as ET

usernamesFile = sys.argv[1]
csvReportsFile = sys.argv[2]
resultFolders= sys.argv[3]

f = open(usernamesFile, 'r')
lines = f.readlines()
f.close()
for line in lines:
    user = line.strip()
    userPath = resultFolders +"/"+ user
    print(user)
    mytree = ET.parse(userPath+'/output.xml')
    myroot = mytree.getroot()
    for type_tag in myroot.findall('suite/test/status'):
        value = type_tag.get('starttime')
        value_endtime=type_tag.get('endtime')
        value_total_time=float(value_endtime[15:21])-float(value[15:21])
        print(float(value_endtime[15:21])-float(value[15:21]))
    with open(csvReportsFile, mode='a') as time_report_file:
        employee_writer = csv.writer(time_report_file, delimiter=',')
        employee_writer.writerow([user, value_total_time])


