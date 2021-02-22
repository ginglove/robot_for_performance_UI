*** Settings ***
Documentation    Suite description
Resource      ../imports.robot

***Keywords***
[KW] Input Into Buy Stock Trading
    [Arguments]         ${StocksID}         ${Quantity}     ${Price}
    [Common] - Input text into textbox     ${txt_StocksID}        ${StocksID}
    [Common] - Input text into textbox     ${txt_Quantity}       ${Quantity}
    [Common] - Input text into textbox     ${txt_Price}       ${Price}

[KW] Click Button Buy 
    Click Element   ${btn_Buy}
    Wait Until Element Is Visible   ${btn_Confirm} 

[KW] Click Button Confirm Buy 
    CLick Element   ${btn_Confirm} 

[KW] Verify Order Success 
    