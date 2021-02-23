*** Settings ***
Documentation    Suite description
Resource      ../imports.robot

***Keywords***
[KW] Select StockID 
    Click Element   //div[@row-index="0"]//div[@class="btnStockMenu"]
    Click Element   //div[@row-index="0"]//div[@col-id="BestOfferPrice1"]
    ${maCK_1}     Get Text    //div[@row-index="0"]//div[@class="btnStockMenu"]
    ${giaCK_1}    Get Text    //div[@row-index="0"]//div[@col-id="BestOfferPrice1"]
    Set Global Variable     ${maCK}     ${maCK_1}
    Set Global Variable     ${giaCK}     ${giaCK_1}
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
    #Wait Until Element Is Visible   ${lb_StocksID} 
    Sleep   10s
[KW] Verify Order Success 
    ${maCK_2}     Get Text    ${lb_StocksID}
    ${giaCK_2}     Get Text    ${lb_Price}
    Set Global Variable     ${maCK1}     ${maCK_2}
    Set Global Variable     ${giaCK1}     ${giaCK_2}
    Should Be Equal     ${maCK}     ${maCK1}
    Should Be Equal     ${giaCK}     ${giaCK1}
