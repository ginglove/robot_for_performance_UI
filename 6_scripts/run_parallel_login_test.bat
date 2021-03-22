@echo ################## VERIFY RUNNING ENVIRONMENT ##################
python --version
chromedriver --version

pip install lxml
set mypath=%cd%
set TESTCASE_FILES=%mypath%\..\5_test_cases\run_robot.py
set RESULT_FOLDER=%mypath%\..\results


set EXPORT_CSV_FILES=%mypath%\..\5_test_cases\parsing_report_html.py
set GEN_CSV_REPORT_FILES=%mypath%\..\5_test_cases/gen_report.py

set CSV_FILES=%mypath%\..\results\execution_time_report.csv
set REPORT_FILES=%mypath%\..\results/performance_report.csv
set ROBOT_FILES=%mypath%\..\5_test_cases\login_performance_ui.robot
set USR_INFOR_FILES=%mypath%\..\5_test_cases\user.txt
set USR_PASSWORD="123456"
set INFLUX_PATH="http://localhost:8086"
set TOKEN="Fb47G4UY78vjEM0341wGvueMOiISLhfJRfGor2opnsUcH7AEe_cLoCRm5vAdI2sOzQq7T9xyVcQxulBAkQJXdg=="
set BUCKET="time"

@echo Result folder is %RESULT_FOLDER%
del /s /q %RESULT_FOLDER%\*

@echo #### Run Test #### 
python %TESTCASE_FILES% %ROBOT_FILES% %USR_INFOR_FILES% %USR_PASSWORD% %RESULT_FOLDER%

@echo #### Save Execution Time ####
python %EXPORT_CSV_FILES% %USR_INFOR_FILES% %CSV_FILES% %RESULT_FOLDER% %INFLUX_PATH% %TOKEN% %BUCKET%

@echo #### Gen CSV report ####
python %GEN_CSV_REPORT_FILES% %CSV_FILES% %REPORT_FILES% %INFLUX_PATH% %TOKEN% %BUCKET%