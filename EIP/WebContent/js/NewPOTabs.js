// https://www.w3schools.com/w3css/w3css_tabulators.asp

function newPO(evt, POs) {
  var i, x, tablinks;
  x = document.getElementsByClassName("po");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
     tablinks[i].className = tablinks[i].className.replace(" w3-border-red", "");
  }
  document.getElementById(POs).style.display = "block";
  evt.currentTarget.firstElementChild.className += " w3-border-red";
}

//Events for NewPOTabs
function PODataOnclick() {
	newPO(event, 'POData');
	EmpsWorkerAjax();
}

function POBuyerOnclick() {
	newPO(event, 'POBuyer');
	CussWorkerAjax();
}

function PODetailOnclick() {
	newPO(event, 'PODetail');
	ProsWorkerAjax();	
}


