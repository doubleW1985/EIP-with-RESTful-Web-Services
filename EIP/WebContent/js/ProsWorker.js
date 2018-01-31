function ProsWorker() {
    xmlhttp = new XMLHttpRequest();
	
	xmlhttp.open("GET", "http://localhost:8080/EIP/D2/WebService/GetPros", false);
	xmlhttp.onreadystatechange = function () {
		if(xmlhttp.readyState == 4  && xmlhttp.status == 200){
			postMessage(xmlhttp.responseText);
//			var ProsTimer = setInterval(function(){ ProsWorker(); }, 10000);
		}else {
			throw xmlhttp.status + xmlhttp.responseText;
		}		
	};
	xmlhttp.send();
}

onmessage = function(event) {
	ProsWorker();
}
