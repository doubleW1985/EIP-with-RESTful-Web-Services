<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
      
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    	
<!--Bootstrap from CDN-->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--Bootstrap from CDN-->

<!--W3.CSS-->
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!--W3.CSS-->

      <title>D2 EIP</title>

      <link rel="stylesheet" href="css/D2_EIPCSS.css" type="text/css" />
      
<!-- Multi Dropdown for Navbar-->
      <link rel="stylesheet" href="css/multidropdown.css" type="text/css" />
      <script type="text/javascript" src="js/multidropdown.js"></script>
<!-- Multi Dropdown for Navbar-->   

<!--Interactive Graph-->
      <link rel="stylesheet" href="css/graph.css" type="text/css" />
      <script type="text/javascript" src="js/jquery.flot.min.js"></script>
<!--Interactive Graph-->

<!--bootstrap-select-->
      <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
      <!-- Latest compiled and minified JavaScript -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
<!--bootstrap-select-->

<!--D2_EIP02 Init-->
      <script type="text/javascript" src="js/NewPOInit.js"></script>
<!--D2_EIP02 Init-->

<!--For PODetailTable-->
    <link rel="stylesheet" href="css/poDetailTable.css" type="text/css" />
    <!--<script type="text/javascript" src="js/jquery.min.js"></script>-->
    <link rel="stylesheet" href="css/addNew&Sum.css" type="text/css" />
<!--For PODetailTable-->



    </head>
    
    <body>

      <div class="upon_navbar">
        <img src="img/logoD2_2s.png" style=" width: 225px; height: auto; "></img>
        <span style=" float: right; margin: 25px 15px; ">Hello，Double</span>
      </div>

<!--Navbar-->
      <div class="navbar navbar-inverse" role="navigation">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
     
          <div class="collapse navbar-collapse">
              <ul class="nav navbar-nav navbar-right">
                <li><a href="#">進貨管理</a></li>
                <li class="dropdown"><a href="#" data-toggle="dropdown" >銷貨管理 <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="D2_EIP02.jsp">新增訂單</a></li>
                    <li><a href="D2_EIP03.jsp">查詢訂單</a></li>
                  </ul>
                </li>
                <li><a href="#">存貨管理</a></li>
                <li><a href="#">人事管理</a></li>
              </ul>
            </div>
        </div>
      </div>
<!--Navbar-->

<!--Main Body-->
      <div class="container" style=" position: relative; top: 170px; background-color: white;  padding: 50px 65px; ">
        
        <!--New PO Tabs-->
        <div class="w3-row">
          <a href="javascript:void(0)" onclick="PODataOnclick();">
            <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">基本資料</div>
          </a>
          <a href="javascript:void(0)" onclick="POBuyerOnclick();">
            <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">訂收貨人</div>
          </a>
          <a href="javascript:void(0)" onclick="PODetailOnclick();">
            <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">訂單明細</div>
          </a>
        
         
                    
        </div>
      
        <div id="POData" class="w3-container po" style=" display: none; padding-top: 20px; ">
          <form class="form-horizontal" action="" id="formPOData">
            <div class="form-group">
              <label class="control-label col-sm-2" for="PONo">訂單編號</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" id="PONo" name="PONo" placeholder="Order ID" disabled>
              </div>
              <label class="control-label col-sm-2 for02label" for="PODate">訂單日期</label>
              <div class="col-sm-4">          
                <input type="date" class="form-control" id="PODate" name="PODate" placeholder="Enter Date">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="POSales">銷售代表</label>
              <div class="col-sm-4">
                <select class="selectpicker" data-live-search="true" title="Sales Name" data-width="100%" data-size="5"
                id="POSales" name="POSales">
                </select>                
              </div>
              <label class="control-label col-sm-2 for02label" for="POForex">幣別/匯率</label>
              <div class="col-sm-4">          
                <select class="selectpicker" data-live-search="true" title="Currency" data-width="100%" data-size="5"
                id="POForex" name="POForex" onchange="ForexSelect()">
                  <option value="TWD">TWD<span>（1.000）</span></option>
                  <option value="HKD">HKD<span>（3.749）</span></option>
                  <option value="JPY">JPY<span>（0.268）</span></option>
                  <option value="CNY">CNY<span>（4.619）</span></option>
                  <option value="USD">USD<span>（29.130）</span></option>                  
                </select>              
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="POTax">稅率</label>
              <div class="radio col-sm-4">
                <label><input type="radio" id="POTaxEx" name="POTax" onclick="SalesTax()">未稅&nbsp;VAT excluded</label>
                <label><input type="radio" id="POTaxIn" name="POTax" onclick="SalesTax()">含稅&nbsp;VAT included</label>
              </div>  
              <label class="control-label col-sm-2 for02label" for="PONote">備註</label>
              <div class="col-sm-4">          
                <textarea class="form-control" rows="3" id="PONote" name="PONote" placeholder="Notes"></textarea>
              </div>
            </div>
          </form>
        </div>
   
        <div id="POBuyer" class="w3-container po" style=" display: none; padding-top: 20px; ">
          <form class="form-horizontal" action="" id="formPOBuyer">
            <div class="forTitleinTabs">
              <i class="glyphicon glyphicon-th-list"></i><span>&nbsp;進口商Buyer</span>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="POCusName">買方名稱</label>
              <div class="col-sm-4">
                <select class="selectpicker" data-live-search="true" title="Buyer Name" data-width="100%" data-size="5"
                id="POCusName" name="POCusName" onchange="POCusNameOnchange();">            
                </select>
              </div>
              <label class="control-label col-sm-2 for02label" for="POCusTel">聯絡電話</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" id="POCusTel" name="POCusTel" placeholder="Contact Tel"  disabled>
              </div>              
              <!--  
              <label class="control-label col-sm-2 for02label" for="POCusName">買方名稱</label>
              <div class="col-sm-4">          
                <input type="text" class="form-control" id="POCusName" name="POCusName" placeholder="Buyer Name">
              </div>
              -->
            </div>
            <!--  
            <div class="form-group">
              <label class="control-label col-sm-2" for="POCusTel">聯絡電話</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" id="POCusTel" name="POCusTel" placeholder="Contact Tel">
              </div>
              <label class="control-label col-sm-2 for02label" for="POCusFax">傳真號碼</label>
              <div class="col-sm-4">          
                <input type="text" class="form-control" id="POCusFax" name="POCusFax" placeholder="Contact Fax">
              </div>
            </div>
            -->
            <div class="form-group">
              <label class="control-label col-sm-2" for="POCusMail">電子信箱</label>
              <div class="col-sm-4">          
                <input type="email" class="form-control" id="POCusMail" name="POCusMail" placeholder="Contact E-Mail" disabled>
              </div>
              <label class="control-label col-sm-2 for02label" for="POCusPmt">付款條件</label>
              <div class="col-sm-4">          
                <input type="text" class="form-control" id="POCusPmt" name="POCusPmt" placeholder="Payment Term" disabled>
              </div>              
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="POInvoiceTo">請款地址</label>
              <div class="col-sm-10">          
                <input type="text" class="form-control" id="POInvoiceTo" name="POInvoiceTo" placeholder="Invoice To">
              </div> 
            </div>
            
            <hr class="hrstyle">

            <div class="forTitleinTabs">
              <i class="glyphicon glyphicon-th-list"></i><span>&nbsp;受貨人Consignee</span>
            </div>
            <label class="checkbox-inline" style=" display: inline-block; "><input type="checkbox" value="" id="SameAsBuyer" name="SameAsBuyer" onclick="SameBuyer()">同買方&nbsp;Same As Buyer</label>
            <div class="form-group">
              <label class="control-label col-sm-2" for="POConsignee">受貨窗口</label>
              <div class="col-sm-4">          
                <input type="text" class="form-control" id="POConsignee" name="POConsignee" placeholder="Consignee">
              </div>
              <label class="control-label col-sm-2 for02label" for="POIncoterms">貿易條件</label>
              <div class="col-sm-4">
                <select class="selectpicker" data-live-search="true" title="Incoterms" data-width="100%" data-size="5"
                id="POIncoterms" name="POIncoterms">
                  <option>工廠交貨（EXW）</option>
                  <option>貨交運送人（FCA）</option>
                  <option>運費付訖（CPT）</option>
                  <option>運保費付訖（CIP）</option>
                  <option>終點站交貨（DAT）</option>
                  <option>目的地交貨（DAP）</option>
                  <option>稅訖交貨（DDP）</option>
                  <option>船邊交貨（FAS）</option>
                  <option>船上交貨（FOB）</option>
                  <option>運費在內（CFR）</option>
                  <option>運保費在內（CIF）</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="POShipTo">運送地址</label>
              <div class="col-sm-10">          
                <input type="text" class="form-control" id="POShipTo" name="POShipTo" placeholder="Ship To">
              </div> 
            </div>            
          </form>
        </div>       
            
        <div id="PODetail" class="w3-container po" style=" display: none; padding-top: 20px; ">
          <form class="form-horizontal" action="" id="formPODetail" style=" margin-bottom: 15px; ">
            <div class="inline">
              <div class="left" style=" font-family: Arial Black; font-size: 18px; color: #23527c; ">
              <!--  <span class="table-add"><span class="glyphicon glyphicon-plus"></span>Add New Product</span>-->
              </div>
              <div class="right">
              <table style=" text-align: right; ">
                <tr>
                  <td>SubTotal&nbsp;&nbsp;</td>
                  <td id="SubTotalTd" name="SubTotalTd">0</td>
                </tr>
                <tr>
                  <td>Sales Tax&nbsp;&nbsp;</td>
                  <td id="SalesTaxTd" name="SalesTaxTd">0</td>
                </tr>
                <tr style=" font-family: Arial Black; font-size: 18px; color: #23527c; ">
                  <td>Total&nbsp;&nbsp;</td>
                  <td><span id="TotalCur" name="TotalCur"></span><span id="TotalTd" name="TotalTd">0</span></td>
                </tr>        
              </table>
              </div>
            </div>

            <div id="tablePODetail" class="table-editable" style=" height: 225px; overflow-y: auto; ">
              <div style=" overflow-x: auto; margin-left: 200px; ">
              <input type="hidden" id="idx" name="idx" value="0" />              
              <table id="tablePOD" class="table">
                <thead>
                  <tr>
                    <th class="text-center" style=" position: absolute; width: 200px; left: 0; border-bottom: 1px solid #ddd; ">品名<br>Product</th>
                    <th class="text-center">定價<br>UnitPrice</th>
                    <th class="text-center">折扣<br>Discount</th>
                    <th class="text-center">數量<br>Quantity</th>
                    <th class="text-center">單位<br>QtyPerUnit</th>
                    <th class="text-center">合計<br>Amount</th>
                    <th class="text-center">自製<br>HomeMade</th>
                    <th class="text-center">備註<br>Notes</th>        
                    <th class="text-center"></th>
                  </tr>        
                </thead>
                
                <tbody id="tbdPOD">
                  <tr onmouseover="trHoverOn(this)" onmouseout="trHoverout(this)" subid="MZonePOD">
                    <td contenteditable="false" class="text-center" style=" vertical-align: middle; position: absolute; width: 200px; left: 0; " id="PODProTd" name="PODProTd"><!-- border-top: 0.8px solid #ddd; -->
                      <select class="forPODetailTd" id="PODPro" name="PODPro" required style=" height: 20.8px; margin-top: 0.20em; " onchange="PODProOnchange(this);">                  
                      	<option value="0">Select Product</option>
                      </select>                                 
                    </td>
                    <td contenteditable="false" class="text-center" style=" vertical-align: middle; " id="PODUPTd" name="PODUPTd"></td>
                    <td contenteditable="false" class="text-center" style=" vertical-align: middle; " id="PODDisTd" name="PODDisTd">
                      <input type="number" value="100" min="0" max="100" id="PODDiscount" name="PODDiscount" required
                        style=" border: 0px; width: 60px; text-align: center; " placeholder="%"
                        onmouseup="Functions(this)" onkeyup="Functions(this)">
                    </td>
                    <td contenteditable="false" class="text-center" style=" vertical-align: middle; " id="PODQtyTd" name="PODQtyTd">
                      <input type="number" value="1" min="1" id="PODQty" name="PODQty" required
                        style=" border: 0px; width: 60px; text-align: center; " placeholder="Qty"
                        onmouseup="Functions(this)" onkeyup="Functions(this)">
                    </td>
                    <td contenteditable="false" class="text-center" style=" vertical-align: middle; " id="PODUnitTd" name="PODUnitTd"></td>
                    <td contenteditable="false" class="text-center" style=" vertical-align: middle; " id="PODToTd" name="PODToTd">0</td>
                    <td contenteditable="false" class="text-center" style=" vertical-align: middle; " id="PODHMTd" name="PODHMTd"></td>
                    <td contenteditable="false" class="text-center" style=" vertical-align: middle; " id="PODNoteTd" name="PODNoteTd">
                      <input type="text" id="PODNote" name="PODNote" style=" border: 0px; ">
                    </td>
                    <td contenteditable="false" class="text-center" style=" vertical-align: middle; " id="PODDelTd" name="PODDelTd">
                      <span class="table-add glyphicon glyphicon-plus" id="AddRow" style=" display: none; "></span>
                    </td>
                  </tr>       
                </tbody>
              </table>
              </div>
            </div>            
          </form>
        </div>
       
        <div class="btn-group btn-group-justified for02btn">
          <a class="btn btn-danger" onclick="submitForms()">送　出</a>
          <a class="btn btn-default active" href="D2_EIP02.jsp">取　消</a>
        </div>        
        
        <script type="text/javascript" src="js/NewPOTabs.js"></script>
        <script type="text/javascript" src="js/D2_EIPJS.js"></script>
        <!--New PO Tabs-->
  
  
  
  
      </div>
<!--Main Body-->




    </body>
</html>