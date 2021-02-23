*** Variables ***
${txt_StocksID}     //input[@class="ant-input addon-input-locker"]
${txt_Quantity}     //input[@class="ant-input addon-input-locker text-lg"]
${txt_Price}        //input[@class="ant-input inno-autocomplete-price addon-input-locker text-lg"]
${btn_Buy}          //button[@class="ant-btn ant-btn-buy ant-btn-lg ant-btn-block"]
${btn_Confirm}      //button[@class="ant-btn ant-btn-buy"]

# Order

# So Lenh
${lb_StocksID}      //div[@class="ag-pinned-left-cols-container"]//div[@class="ag-row ag-row-even ag-row-level-0 ag-row-position-absolute ag-row-first ag-row-focus"]//div[@class="ag-react-container"]
${lb_Quantity}      ${Quantity}
${lb_Price}         //div[@class="ag-center-cols-clipper"]//div[@class="ag-row ag-row-even ag-row-level-0 ag-row-position-absolute ag-row-first ag-row-focus"]//div[@col-id="OrderPrice"]