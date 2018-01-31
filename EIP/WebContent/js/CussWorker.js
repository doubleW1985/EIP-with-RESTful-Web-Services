function CussWorker() {
    xmlhttp = new XMLHttpRequest();
	
	xmlhttp.open("GET", "http://localhost:8080/EIP/D2/WebService/GetCuss", false);
	xmlhttp.onreadystatechange = function () {
		if(xmlhttp.readyState == 4  && xmlhttp.status == 200){	        			
			postMessage(xmlhttp.responseText);
//			var CussTimer = setInterval(function(){ CussWorker(); }, 10000);
		}else {
			throw xmlhttp.status + xmlhttp.responseText;
		}		
	};
	xmlhttp.send();	
}

onmessage = function(event) {
	CussWorker();
}
