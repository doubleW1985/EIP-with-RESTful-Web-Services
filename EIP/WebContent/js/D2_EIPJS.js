//Currency Select
function ForexSelect() {
    document.getElementById("TotalCur").innerHTML =
    document.getElementById("POForex").value;
}

//When PO Customer onChange
function POCusNameOnchange() {
	var POCusNameVal = $('#POCusName').val();
	$('#POCusTel').val('');
	$('#POCusMail').val('');
	$('#POCusPmt').val('');
	$('#POInvoiceTo').val('');
	$('#SameAsBuyer').prop('checked', false);
	$('#POConsignee').val('');
	$('#POShipTo').val('');	
	
	if(POCusNameVal != null){
		if (window.Worker) {
			var workerCussName = new Worker('js/CussWorker.js');
			workerCussName.postMessage('');
			workerCussName.onmessage = function (event) {
				var CussNameObj = JSON.parse(event.data);	
				CussNameObj.forEach(function(item){
				    if(item.CustomerID == POCusNameVal){
						$('#POCusTel').val(item.Phone + ", Fax " + item.Fax);
						$('#POCusMail').val(item.Email); 
						$('#POCusPmt').val(item.PaymentTerm); 
						$('#POInvoiceTo').val(item.Address +　" " + item.City +　" " + item.PostalCode +　" " + item.Country);
				    }
				});
			}		
		}else{
			$.ajax({
				url: "D2/WebService/GetCuss",
				type: "GET",
				async: false,
				cache: false,
				success: function(result) {
					result.forEach(function(item){
					    if(item.CustomerID == POCusNameVal){
							$('#POCusTel').val(item.Phone + ", Fax " + item.Fax);
							$('#POCusMail').val(item.Email);
							$('#POCusPmt').val(item.PaymentTerm);
							$('#POInvoiceTo').val(item.Address +　" " + item.City +　" " + item.PostalCode +　" " + item.Country);
					    }
					});
				},
				error: function(xhr,status,error) {
					console.log(xhr.status);
					console.log(status);
				},
			});
		}
	}
}

//When PO Product onChange
function PODProOnchange(x) {
	var PODProVal = x.value;
	
	var trPOD = x.parentNode.parentNode;
    var tdsPOD = trPOD.childNodes;
    
    tdsPOD[3].innerHTML = "";
    tdsPOD[9].innerHTML = "";
    tdsPOD[11].innerHTML = "0";
    tdsPOD[13].innerHTML = "";
	
	if(PODProVal != null){
		if (window.Worker) {
			var workerPODPro = new Worker('js/ProsWorker.js');
			workerPODPro.postMessage('');
			workerPODPro.onmessage = function (event) {
				var PODProObj = JSON.parse(event.data);
				PODProObj.forEach(function(item){
				    if(item.ProductID == PODProVal){
				    	tdsPOD[3].innerHTML = item.UnitPrice;
				        tdsPOD[9].innerHTML = item.QuantityPerUnit;
				        tdsPOD[13].innerHTML = item.Homemade;
				    	Functions(x);
				    }
				});
			}
		}else{
			$.ajax({
				url: "D2/WebService/GetPros",
				type: "GET",
				async: false,
				cache: false,
				success: function(result) {
					result.forEach(function(item){
						if(item.ProductID == PODProVal){
							tdsPOD[3].innerHTML = item.UnitPrice;
					        tdsPOD[9].innerHTML = item.QuantityPerUnit;
					        tdsPOD[13].innerHTML = item.Homemade;
					    	Functions(x);
					    }
					});
				},
				error: function(xhr,status,error) {
					console.log(xhr.status);
					console.log(status);
				},
			});
		}
	}
}

//Table Hover Control
function trHoverOn(x) {
    var TdinTr = x.childNodes;
    x.style.backgroundColor = "	#FFF3EE";
    TdinTr[1].style.backgroundColor = "	#FFF3EE";
}

function trHoverout(x) {
    var TdinTr = x.childNodes;
    x.style.backgroundColor = null;
    TdinTr[1].style.backgroundColor = null;          
}

//PODetail Table Add Row      
$('#AddRow').click(function () {
	//Copy Original tr
	var tt = $('#tbdPOD tr[subid="MZonePOD"]').clone();
	var tdstt = tt[0].childNodes;

	tdstt[3].innerHTML = "";
	tdstt[5].childNodes[1].value = "100";
	tdstt[7].childNodes[1].value = "1";
	tdstt[9].innerHTML = "";
	tdstt[11].innerHTML = "0";
	tdstt[13].innerHTML = "";
	tdstt[15].childNodes[1].value = "";
	
	//Get Value of Idx for SZone
	var idxVal=$('#idx').val();
	var NewIndex = parseInt(idxVal,10)+1;
	$('#idx').val(NewIndex);
	
	//Adjust subid
	$(tt).attr('subid','SZone');
	$(tt).attr('subid2','SZone' + NewIndex);
	
	//Change AddRow to DelRow
	$('#AddRow', tt)
		.attr('id', 'DelRow' + NewIndex)
		.attr('subindex', NewIndex)
		.attr('class', 'table-remove glyphicon glyphicon-remove')
		.css('display', 'inline-block')
		.bind('click', RowDel);
	
	//Append copy to Table
	$('#tbdPOD').append(tt);
});

//PODetail Table Delete Row
function RowDel(){
	var xidx=$(this).attr('subindex');
	alert("確認刪除此筆？\nConfirm Deletion of items?");
	$('tr[subid2="SZone' + xidx + '"]').remove();
	Total();
}


//$('.table-remove').click(function () {
//    $(this).parents('tr').detach();
//}); 

//Amount Calculate
function Amount(x) {
    var tr = x.parentNode.parentNode;
    var tds = tr.childNodes;
    
    var UnitPrice = tds[3].innerHTML;
    var Discount = tds[5].childNodes[1].value/100;
    var Quantity = tds[7].childNodes[1].value;
    tds[11].innerHTML = (UnitPrice * Quantity * Discount).toFixed();
}

//When Consignee Same as Buyer
function SameBuyer() {
    var SameAsBuyer = document.getElementById("SameAsBuyer");
    var POConsignee = document.getElementById("POConsignee");
    var POShipTo = document.getElementById("POShipTo");
    var POCusNameVal = $('#POCusName').val();
    var POCusNameText = $('#POCusName option[value=' + POCusNameVal + ']').text();
    var POInvoiceTo = document.getElementById("POInvoiceTo");
    
    
    
    if(SameAsBuyer.checked) {
      POConsignee.value = POCusNameText;
      POShipTo.value = POInvoiceTo.value;
    }else {
      POConsignee.value = null;
      POShipTo.value = null;
    }
}

//Tax Calculate
function SalesTax() {
    var SubTotalTd = document.getElementById("SubTotalTd");
    var SalesTaxTd = document.getElementById("SalesTaxTd");
    var TotalTd = document.getElementById("TotalTd");
    
    if(document.getElementById("POTaxEx").checked) {
      SalesTaxTd.innerHTML = 0;
      TotalTd.innerHTML = parseInt(SubTotalTd.innerHTML) + parseInt(SalesTaxTd.innerHTML);
    }else if(document.getElementById("POTaxIn").checked) {
      SalesTaxTd.innerHTML = (parseInt(SubTotalTd.innerHTML) * 0.05).toFixed();
      TotalTd.innerHTML = parseInt(SubTotalTd.innerHTML) + parseInt(SalesTaxTd.innerHTML);
    }else {
      alert("請確認該筆訂單含稅否！\nPlease Check VAT excluded or included!");
      TotalTd.innerHTML = parseInt(SubTotalTd.innerHTML) + parseInt(SalesTaxTd.innerHTML);
    }                    
}

//Total Calculate
function Total() {
    var tbodyinPOD = document.getElementById("tablePOD").getElementsByTagName("tbody");
    var trsintbody = tbodyinPOD[0].getElementsByTagName("tr");
    
    var SubTotal = 0;
    for(var i=0; i<trsintbody.length; i++) {
      var Amount = parseInt(trsintbody[i].childNodes[11].innerHTML);
      SubTotal += Amount;
    }
    document.getElementById("SubTotalTd").innerHTML = SubTotal;
    
    //SubTotal &Sales Tax & Total
    SalesTax();
}

function Functions(x) {
    Amount(x);
    Total();
}