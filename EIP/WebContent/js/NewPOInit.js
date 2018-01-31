function newPOInit() {
  var i, x, tablinks;
  x = document.getElementsByClassName("po");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
     tablinks[i].className = tablinks[i].className.replace(" w3-border-red", "");
  }
  x[0].style.display = "block";
  tablinks[0].className += " w3-border-red";
}

function EmpData() {
	$.ajax({
		url: "D2/WebService/GetEmps",
		type: "GET",
		async: false,
		cache: false,
		success: function(result) {
			var EmpsOld = $('#POSales').val();
			$('#POSales').empty();
			
			for(var i=0; i<result.length; i++){
				$('#POSales').append(
						  $('<option>').text(result[i].FirstName + ", Ext " + result[i].Extension).attr('value', result[i].EmployeeID)
				  );
			}
			$('#POSales').selectpicker('refresh');
			
			var POSalesChild = document.getElementById("POSales").children;
			for(var i=1; i<POSalesChild.length; i++){
				if(POSalesChild[i].value == EmpsOld){
					POSalesChild[i].setAttribute('selected', true);
			    }
			}
			$('#POSales').selectpicker('refresh');	
		},
		error: function(xhr,status,error) {
			console.log(xhr.status);
			console.log(status);
		},
			
	});
}

function CusData() {
	$.ajax({
		url: "D2/WebService/GetCuss",
		type: "GET",
		async: false,
		cache: false,
		success: function(result) {
			var CussOld = $('#POCusName').val();
			$('#POCusName').empty();
			
			for(var i=0; i<result.length; i++){
				$('#POCusName').append(
						  $('<option>').text(result[i].CompanyName).attr('value', result[i].CustomerID)
				  );
			}
			$('#POCusName').selectpicker('refresh');
			
			var POCusNameChild = document.getElementById("POCusName").children;
			for(var i=1; i<POCusNameChild.length; i++){
				if(POCusNameChild[i].value == CussOld){
					POCusNameChild[i].setAttribute('selected', true);
			    }
			}
			$('#POCusName').selectpicker('refresh');
		},
		error: function(xhr,status,error) {
			console.log(xhr.status);
			console.log(status);
		},
			
	});
}

function ProData() {
	$.ajax({
		url: "D2/WebService/GetPros",
		type: "GET",
		async: false,
		cache: false,
		success: function(result) {
			var ProsOld = $('#PODPro').val();  
			$('#PODPro').empty();
			
			$('#PODPro').append(
					  $('<option>').text("Select Product").attr('value', 0)
			);
			for(var i=0; i<result.length; i++){
				$('#PODPro').append(
						  $('<option>').text(result[i].ProductID + "-" + result[i].ProductName).attr('value', result[i].ProductID)
				  );
			}
			
			var PODProChild = document.getElementById("PODPro").children;
			for(var i=0; i<PODProChild.length; i++){
				if(PODProChild[i].value == ProsOld){
					document.getElementById("PODPro").selectedIndex = ProsOld;
			    }
			}
		},
		error: function(xhr,status,error) {
			console.log(xhr.status);
			console.log(status);
		},
		
	});
}

//Get Employees Data from Web Worker and Ajax
function EmpsWorkerAjax(){
	if (window.Worker) {
		var workerEmps = new Worker('js/EmpsWorker.js');
		workerEmps.postMessage('');
		workerEmps.onmessage = function (event) {
			var EmpsObj = JSON.parse(event.data);
			var EmpsOld = $('#POSales').val();
			$('#POSales').empty();
			
			for(var i=0; i<EmpsObj.length; i++){
				$('#POSales').append(
						  $('<option>').text(EmpsObj[i].FirstName + ", Ext " + EmpsObj[i].Extension).attr('value', EmpsObj[i].EmployeeID)
				  );
			}
			$('#POSales').selectpicker('refresh');
			
			var POSalesChild = document.getElementById("POSales").children;
			for(var i=1; i<POSalesChild.length; i++){
				if(POSalesChild[i].value == EmpsOld){
					POSalesChild[i].setAttribute('selected', true);
			    }
			}
			$('#POSales').selectpicker('refresh');
		}
	}else{
		EmpData();
	}
}

//Get Customers Data from Web Worker and Ajax
function CussWorkerAjax() {
	if (window.Worker) {
		var workerCuss = new Worker('js/CussWorker.js');
		workerCuss.postMessage('');
		workerCuss.onmessage = function (event) {
			var CussObj = JSON.parse(event.data);
			var CussOld = $('#POCusName').val();
			$('#POCusName').empty();
			
			for(var i=0; i<CussObj.length; i++){
				$('#POCusName').append(
						  $('<option>').text(CussObj[i].CompanyName).attr('value', CussObj[i].CustomerID)
				  );
			}
			$('#POCusName').selectpicker('refresh');
			
			var POCusNameChild = document.getElementById("POCusName").children;
			for(var i=1; i<POCusNameChild.length; i++){
				if(POCusNameChild[i].value == CussOld){
					POCusNameChild[i].setAttribute('selected', true);
			    }
			}
			$('#POCusName').selectpicker('refresh');
		}		
	}else{
		CusData();
	}	
}

//Get Products Data from Web Worker and Ajax
function ProsWorkerAjax() {
	$('#AddRow').css('display', 'none');
	if (window.Worker) {
		var workerPros = new Worker('js/ProsWorker.js');
		workerPros.postMessage('');		
		workerPros.onmessage = function (event) {
			var ProsObj = JSON.parse(event.data);
			var ProsOld = $('#PODPro').val();
			$('#PODPro').empty();
			
			$('#PODPro').append(
					  $('<option>').text("Select Product").attr('value', 0)
			);
			for(var i=0; i<ProsObj.length; i++){
				$('#PODPro').append(
						  $('<option>').text(ProsObj[i].ProductID + "-" + ProsObj[i].ProductName).attr('value', ProsObj[i].ProductID)
				  );
			}
			
			var PODProChild = document.getElementById("PODPro").children;
			for(var i=0; i<PODProChild.length; i++){
				if(PODProChild[i].value == ProsOld){
					document.getElementById("PODPro").selectedIndex = ProsOld;
			    }
			}
		}
	}else{
		ProData();
	}
	setTimeout(
		function(){
			if(($('#PODPro option').length) > 2){
				$('#AddRow').css('display', 'inline-block');
			}else{
				alert("請重新點擊訂單明細該頁面！\nPlease reclick this Tab!");
			}
		}, 1500);
}

/////////////////////////////////////////////////////////////////////Start Point
//Before Web Worker
//async: false =>
//[Deprecation] 
//Synchronous XMLHttpRequest on the main thread is deprecated 
//because of its detrimental effects to the end user's experience.
//$(document).ready(function(){
//	newPOInit();
//	EmpData();
//	CusData();
//	ProData();
//});	

//After Web Worker
$(document).ready(function(){
	newPOInit();
	EmpsWorkerAjax();
});

