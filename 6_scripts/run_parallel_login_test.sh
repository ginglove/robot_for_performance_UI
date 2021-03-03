#!/bin/bash
################## VERIFY RUNNING ENVIRONMENT ##################
whoami
groups
pwd
ls -la
python3.7 --version
chromedriver --version


################## CONFIG ENV ##################
curr_path="$PWD"
path="$(dirname "$(dirname $PWD)")"
parentpath="$(dirname "$(dirname "$(dirname $PWD)")")"
echo "path : $curr_path"
TESTCASE_FILES="$curr_path/5_test_cases/run_robot.py"
RESULT_FOLDER="$curr_path/results"

EXPORT_CSV_FILES="$curr_path/5_test_cases/parsing_report_html.py"
GEN_CSV_REPORT_FILES="$curr_path/5_test_cases/gen_report.py"

CSV_FILES="$curr_path/results/execution_time_report.csv"
REPORT_FILES="$curr_path/results/performance_report.csv"
ROBOT_FILES="$curr_path/5_test_cases/login_performance_ui.robot"
USR_INFOR_FILES="$curr_path/5_test_cases/user.txt"
USR_PASSWORD="123456"

############ REMOVE RESULT FOLDER ##################
echo "=== Remove result folder==="
echo "$RESULT_FOLDER"
rm -rf $RESULT_FOLDER/*

############ RUNNING TEST ##################
echo "=== Run robot test==="
curr_time= date +'%d-%m-%Y %T'
echo "$curr_time"
python $TESTCASE_FILES $ROBOT_FILES $USR_INFOR_FILES $USR_PASSWORD $RESULT_FOLDER

############ SAVE EXECUTION TIME TO CSV FILE ##################
end_time= date +'%d-%m-%Y %T'
echo "$end_time"
echo "=== Save Execution Time==="
python3.7 $EXPORT_CSV_FILES $USR_INFOR_FILES $CSV_FILES $RESULT_FOLDER


############ GEN CSV REPORT ##################
echo "=== GEN CSV REPORT==="
python3.7 $GEN_CSV_REPORT_FILES $CSV_FILES $REPORT_FILES
########################### ENABLE BELOW SECTION TO DISABLE TEST ##########################
echo "=== Run Robot !!! Done !!! ==="