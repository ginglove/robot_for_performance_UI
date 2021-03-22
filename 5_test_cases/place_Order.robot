*** Settings ***
Documentation    Suite description
Resource      ../imports.robot

***Variables***
${USERNAME}     
${PASSWORD}
${StocksID}     HCM    
${Quantity}     100
${Price}        31
***Test Cases***
Buy Stock Trading
    [Tags]  Buy
    [Common] - Open Chrome Browser with mode           https://trading-uat.hsc.com.vn/
    [Kw] - Input into Account and Password       ${USERNAME}         ${PASSWORD}
    [Kw] - Click login button
    #[Common] - Execute JavaScripts Wait Element Is Visible           //div[@id='logo']   
    [KW] Select StockID
    [KW] Select Price 
    [Common] - Input text into textbox     ${txt_Quantity}       ${Quantity}
    [KW] Click Button Buy 
    [KW] Click Button Confirm Buy 
    [KW] Verify Order Success
    #Close Browser
