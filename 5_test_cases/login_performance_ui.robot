*** Settings ***
Documentation    Suite description
Resource      ../imports.robot

*** Variables ***
${USERNAME}        
${PASSWORD}
*** Test Cases ***
Login Test
     #log            ${URL}
     [Common] - Open Chrome Browser with mode           https://trading-uat.hsc.com.vn/
     [Kw] - Input into Account and Password       ${USERNAME}         ${PASSWORD}
     [Kw] - Click login button
     [Common] - Execute JavaScripts Wait Element Is Visible           //div[@id='logo']
     Close Browser