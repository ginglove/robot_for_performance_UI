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
TESTCASE_FILES="$path/robot_for_performance_UI/5_test_cases/run_robot.py"
RESULT_FOLDER="$path/robot_for_performance_UI/results"

EXPORT_CSV_FILES="$path/robot_for_performance_UI/5_test_cases/parsing_report_html.py"

CSV_FILES="$path/robot_for_performance_UI/results/execution_time_report.csv"
REPORT_FILES="$path/robot_for_performance_UI/results/performance_report.csv"
ROBOT_FILES="$path/robot_for_performance_UI/5_test_cases/place_Order.robot"
USR_INFOR_FILES="$path/robot_for_performance_UI/5_test_cases/user.txt"
USR_PASSWORD="123456"

############ REMOVE RESULT FOLDER ##################
# echo "=== Remove result folder==="
# echo "$RESULT_FOLDER"
# rm -rf $RESULT_FOLDER/*


############ RUNNING TEST ##################
echo "=== Run robot test==="
curr_time= date +'%d-%m-%Y %T'
print "$curr_time"
python3 $TESTCASE_FILES $ROBOT_FILES $USR_INFOR_FILES $USR_PASSWORD $RESULT_FOLDER

############ SAVE EXECUTION TIME TO CSV FILE ##################
end_time= date +'%d-%m-%Y %T'
print "$end_time"
echo "=== Save Execution Time==="
python3 $EXPORT_CSV_FILES $USR_INFOR_FILES $CSV_FILES $RESULT_FOLDER

echo "=== GEN CSV REPORT==="
python3 $GEN_CSV_REPORT_FILES $CSV_FILES $REPORT_FILES

########################### ENABLE BELOW SECTION TO DISABLE TEST ##########################
echo "=== Run Robot !!! Done !!! ==="