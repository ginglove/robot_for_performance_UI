*** Settings ***
Documentation    Suite description
Resource      ../imports.robot

***Keywords***
[KW] Select StockID 
    [Common] - click element   ${orderStockID}
    ${maCK_1}     Get Text    ${orderStockID}
    Set Global Variable     ${StocksID_order}     ${maCK_1}
[KW] Select Price 
    [Common] - click element   ${orderPrice}
    ${giaCK_1}    Get Text    ${orderPrice}
    Set Global Variable     ${Price_order}     ${giaCK_1}
[KW] Input Into Buy Stock Trading
    [Arguments]         ${StocksID}         ${Quantity}     ${Price}
    [Common] - Input text into textbox     ${txt_StocksID}        ${StocksID}
    [Common] - Input text into textbox     ${txt_Quantity}       ${Quantity}
    [Common] - Input text into textbox     ${txt_Price}       ${Price}

[KW] Click Button Buy 
    [Common] - click element   ${btn_Buy}    
    Wait Until Element Is Visible   ${btn_Confirm} 

[KW] Click Button Confirm Buy 
    [Common] - click element   ${btn_Confirm} 
    Sleep   10s
[KW] Verify Order Success 
    ${maCK_2}     Get Text    ${lb_StocksID}
    ${giaCK_2}     Get Text    ${lb_Price}
    Set Global Variable     ${StocksID_success}     ${maCK_2}
    Set Global Variable     ${Price_success}     ${giaCK_2}
    Should Be Equal     ${StocksID_order}     ${StocksID_success}
    Should Be Equal     ${Price_order}     ${Price_success}
