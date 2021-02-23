*** Settings ***
Documentation    Suite description
Resource      ../imports.robot

***Variables***
${StocksID}     HCM    
${Quantity}     100
${Price}        31
***Test Cases***
Buy Stock Trading
    [Tags]  1
    [KW] Login     
    [KW] Select StockID
     [Common] - Input text into textbox     ${txt_Quantity}       ${Quantity}
    # [Common] - Input text into textbox     ${txt_Price}       ${Price}
    #[KW] Input Into Buy Stock Trading       ${StocksID}         ${Quantity}     ${Price}
    [KW] Click Button Buy 
    [KW] Click Button Confirm Buy 
    [KW] Verify Order Success
    Close Browser
TC2
    [Tags]  2
    [KW] Login
    ${ID}   Get Text    //div[@row-index="0"]//div[@class="ag-cell ag-cell-not-inline-editing ag-cell-with-height ag-cell-last-left-pinned text-left symbolColumn ag-cell-value"]
    ${Price}    Get Text    //div[@class="ag-center-cols-clipper"]//div[@class="ag-row ag-row-even ag-row-level-0 ag-row-position-absolute ag-row-first ag-row-focus"]//div[@col-id="OrderPrice"]
    Close Browser