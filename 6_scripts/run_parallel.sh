#!/bin/bash
################## VERIFY RUNNING ENVIRONMENT ##################
whoami
groups
pwd
ls -la
python3 --version
chromedriver --version


################## CONFIG ENV ##################
path="$(dirname "$(dirname $PWD)")"
parentpath="$(dirname "$(dirname "$(dirname $PWD)")")"
TESTCASE_FILES="$path/demo_UI_performance_test/5_test_cases/run_robot.py"
RESULT_FOLDER="$path/demo_UI_performance_test/results"

EXPORT_CSV_FILES="$path/demo_UI_performance_test/5_test_cases/parsing_report_html.py"

CSV_FILES="$path/demo_UI_performance_test/results/execution_time_report.csv"
ROBOT_FILES="$path/demo_UI_performance_test/5_test_cases/fake_test.robot"
USR_INFOR_FILES="$path/demo_UI_performance_test/5_test_cases/user.txt"
USR_PASSWORD="SECRET"

############ REMOVE RESULT FOLDER ##################
echo "=== Remove result folder==="
echo "$RESULT_FOLDER"
rm -rf $RESULT_FOLDER/*

############ RUNNING TEST ##################
echo "=== Run robot test==="
python3 $TESTCASE_FILES $ROBOT_FILES $USR_INFOR_FILES $USR_PASSWORD $RESULT_FOLDER

############ SAVE EXECUTION TIME TO CSV FILE ##################
echo "=== Save Execution Time==="
python3 $EXPORT_CSV_FILES $USR_INFOR_FILES $CSV_FILES $RESULT_FOLDER


########################### ENABLE BELOW SECTION TO DISABLE TEST ##########################
echo "=== Run Robot !!! Done !!! ==="