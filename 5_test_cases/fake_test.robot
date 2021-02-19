*** Settings ***
Documentation    Suite description
Resource      ../imports.robot

*** Variables ***
${USERNAME}        
${PASSWORD}
*** Test Cases ***
Login Test
     #log            ${URL}
     [Common] - Open Chrome Browser with mode           https://google.com.vn
     [Common] - Input text into textbox     //input[@name='q']        ${URL}
     [Common] - Input text into textbox
     Close Browser
# #     Acquire Lock   MyLock
# #     Log   This part is critical section
# #     Release Lock   MyLock
#     ${valuesetname}=    Acquire Value Set
#     ${username}=     Get Value From Set   USERNAME
#     ${password}=     Get Value From Set   PASSWORD
#     Log   Do something with the values (for example access host with username and password)
#     Log        ${username}
#     Log        ${password}
#     Release Value Set
#     Log   After value set release others can obtain the variable values