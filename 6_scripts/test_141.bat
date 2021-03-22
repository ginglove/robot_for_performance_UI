@echo off ################## VERIFY RUNNING ENVIRONMENT
python --version
chromedriver --version

dir

pip install lxml
set mypath=%cd%
set fullpath=%mypath%\..\Desktop\robot_for_performance_UI\
set TESTCASE_FILES=%mypath%\..\Desktop\robot_for_performance_UI\5_test_cases\run_robot.py
set RESULT_FOLDER=%mypath%\..\Desktop\robot_for_performance_UI\results


set EXPORT_CSV_FILES=%mypath%\..\Desktop\robot_for_performance_UI\5_test_cases\parsing_report_html.py
set GEN_CSV_REPORT_FILES=%mypath%\..\Desktop\robot_for_performance_UI\5_test_cases/gen_report.py

set CSV_FILES=%mypath%\..\Desktop\robot_for_performance_UI\results\execution_time_report.csv
set REPORT_FILES=%mypath%\..\Desktop\robot_for_performance_UI\results/performance_report.csv
set ROBOT_FILES=%mypath%\..\Desktop\robot_for_performance_UI\5_test_cases\login_performance_ui.robot
set USR_INFOR_FILES=%mypath%\..\Desktop\robot_for_performance_UI\5_test_cases\user.txt
set USR_PASSWORD="123456"



@echo Result folder is %RESULT_FOLDER%
del /s /q %RESULT_FOLDER%\*

@echo off Run Test
python %TESTCASE_FILES% %ROBOT_FILES% %USR_INFOR_FILES% %USR_PASSWORD% %RESULT_FOLDER%

@echo off Save Execution Time
python %EXPORT_CSV_FILES% %USR_INFOR_FILES% %CSV_FILES% %RESULT_FOLDER%

@echo off Gen CSV report
python %GEN_CSV_REPORT_FILES% %CSV_FILES% %REPORT_FILES%