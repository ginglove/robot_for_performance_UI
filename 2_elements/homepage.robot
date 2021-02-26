*** Variables ***

${txt_StocksID}     //input[@class="ant-input addon-input-locker"]
${txt_Quantity}     //input[@class="ant-input addon-input-locker text-lg"]
${txt_Price}        //input[@class="ant-input inno-autocomplete-price addon-input-locker text-lg"]
${btn_Buy}          //button[@class="ant-btn ant-btn-buy ant-btn-lg ant-btn-block"]
${btn_Confirm}      //button[@class="ant-btn ant-btn-buy"]

# Stock Trading
${orderStockID}     //div[@row-index="0"]//div[@class="btnStockMenu"]
${orderPrice}       //div[@row-index="0"]//div[@col-id="LastPriceCol"]

# Order Book
${lb_StocksID}      //div[@row-index="0"]//div[@class="ag-cell ag-cell-not-inline-editing ag-cell-with-height ag-cell-last-left-pinned text-left symbolColumn ag-cell-value"]
${lb_Quantity}      ${Quantity}
${lb_Price}         //section[@class="inno-content"]//div[@class="ag-center-cols-container"]//div[@row-index="0"]//div[@col-id="OrderPrice"]