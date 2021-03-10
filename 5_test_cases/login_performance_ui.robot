*** Settings ***
Documentation    Suite description
Resource      ../imports.robot

*** Variables ***
${USERNAME}     030454   
${PASSWORD}    123456
*** Test Cases ***
Login Test
     #log            ${URL}
     [Common] - Open Chrome Browser with mode           https://trading-uat.hsc.com.vn/
     [Kw] - Input into Account and Password       ${USERNAME}         ${PASSWORD}
     [Kw] - Click login button
     [Common] - Execute JavaScripts Wait Element Is Visible           //div[@id='logo']
     [KW] Select Price
     ${Price_Chart}    Get Text       //span[@class="u last pointer"]
     Should Be Equal     ${Price_order}     ${Price_Chart}
     Close Browser