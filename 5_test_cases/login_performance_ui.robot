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
     ${suc_mua_hien_tai}  [Common] - Get Text     //div[@class='ant-row ant-form-item cash-balance-item']//label[contains(text(),'Sức mua hiện tại')]//parent::div//parent::div//following-sibling::div//span
     Run Keyword If      '${suc_mua_hien_tai}' == '-'       Run Keywords
     ...       should be true  ${FALSE}
     ...       ELSE           should be true  ${TRUE}
     #Close Browser