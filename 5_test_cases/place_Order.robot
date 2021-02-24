*** Settings ***
Documentation    Suite description
Resource      ../imports.robot

***Variables***
${StocksID}     HCM    
${Quantity}     100
${Price}        31
***Test Cases***
Buy Stock Trading
    [Tags]  Buy
    [KW] Login     
    [KW] Select StockID
    [KW] Select Price 
    [Common] - Input text into textbox     ${txt_Quantity}       ${Quantity}
    [KW] Click Button Buy 
    [KW] Click Button Confirm Buy 
    [KW] Verify Order Success
    Close Browser
