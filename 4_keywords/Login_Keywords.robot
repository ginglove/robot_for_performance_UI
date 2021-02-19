*** Settings ***
Documentation    Suite description
Resource      ../imports.robot


*** Keywords ***
[Kw] - Open browser     
     [Common] - Open Chrome Browser with mode           ${url}

[Kw] - Input into Account and Password
     [Arguments]         ${USERNAME}         ${PASSWORD}
     [Common] - Input text into textbox     ${txt_Login}        ${USERNAME}
     [Common] - Input text into textbox     ${txt_Password}       ${PASSWORD}
[Kw] - Click login button 
     [Common] - click element           ${btn_Login}

[Kw] - Click login button and wait for Login txtbox display
     [Common] - click element     ${btn_login}
     [Common] - Select Iframe     ${iframe_login}
     [Common] - Input text into textbox     ${txtbox_form_account}        abcd
