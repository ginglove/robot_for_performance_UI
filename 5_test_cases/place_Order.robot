*** Settings ***
Documentation    Suite description
Resource      ../imports.robot

***Variables***
${StocksID}     HCM    
${Quantity}     10
${Price}        31
***Test Cases***
Buy Stock Trading
    [KW] Login     
    [KW] Input Into Buy Stock Trading       ${StocksID}         ${Quantity}     ${Price}
    [KW] Click Button Buy 
    [KW] Click Button Confirm Buy 
    