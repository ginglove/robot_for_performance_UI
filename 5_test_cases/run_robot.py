#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
 Example Python script to concurrently run multiple parametrized Robot Framework tests
 Expects following input files:
    - suite.robot:     Robot Framework test case file
    - user_list.txt:   List of usernames (one per line)
'''

import os
import random
import subprocess
import time
import webbrowser
import sys 


# config variable from command line

suiteFile = sys.argv[1]
usernamesFile = sys.argv[2]
testUsersPassword = sys.argv[3]
resultFolders= sys.argv[4]



#clean up base folder

# no output to console please
FNULL = open(os.devnull, 'w')

# load list of usernames
f = open(usernamesFile, 'r')
lines = f.readlines()
f.close()


# spawn subprocess for each user
userPathes = []
processes = set()
for line in lines:
    user = line.strip()
    userPath = resultFolders +"/"+ user
    userPath.replace(" ","")
    print(userPath)
    cmdParts = [
            'robot',
            # abitrary amount of variables can be added here
            '--variable', 'USERNAME:' + user,
            '--variable', 'PASSWORD:' + testUsersPassword,
            '-v browser:chrome',
            '-t', 'Login Test',
            '-d' + userPath + '',
            '' + suiteFile,
    ]
    processes.add(subprocess.Popen(cmdParts, stdout=FNULL))
    # random timeout to simulate more realistic user behavior
    # time.sleep(random.randint(0, 4))

# wait until all subprocesses finished
for proc in processes:
    proc.wait()

# collect output and open log files of failed tests
# for username, path in userPath:
#     f = open(path + '/output.xml')
#     content = f.read()
#     f.close()
#     if 'status="FAIL"' in content:
#         print(username + '\t'*5 + '[\033[91mFailed\033[0m]')
#         webbrowser.open(path + '/report.html')
#     else:
#         print(username + '\t'*5 + '[\033[92mOK\033[0m]')