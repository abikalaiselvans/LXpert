var isIE;
var req;
var names;

 
function initRequest(url) 
{
    if (window.XMLHttpRequest) 
    {
        req = new XMLHttpRequest();
    } 
    else if (window.ActiveXObject) 
    {
        isIE = true;
        req = new ActiveXObject("Microsoft.XMLHTTP");
    }
}
 

function ClearTable(ctr1)
{
	 var str="<center><br><br><br><font class='bolddeepred'>Data not found...</font></br></br></br>";
	 var tb=document.getElementById(ctr1);	 
  	 tb.innerHTML=str     
}


function ClearTabler(ctr1)
{
	 var str="<center><br><br><br><font class='bolddeepred'>Total No of Records : 0</font></br></br></br>";
	 var tb=document.getElementById(ctr1);	 
  	 tb.innerHTML=str     
}


function LoadCustomerContactPerson()
{
	try
	{
	 	var customer = document.getElementById('customer').value;
	 	var url = "../marketing?actionS=LoadCustomerContactPerson&customer="+customer ;
	 	req.onreadystatechange=LoadCustomerContactPersonRequest;
	    req.open("GET", url, true);
	    req.send(null);
	}
	catch(err)
	{
		alert(err);
	}
}
 
 function LoadCustomerContactPersonRequest() 
 {
 	try
 	{
 		document.getElementById('department').value ="";
 		document.getElementById('cperson').value ="";
 		document.getElementById('designination').value ="";
	    if(req.readyState == 4) 
	    {    	
	    	if (req.status == 200) 
	        {		  	
	    		LoadCustomerContactPersonMessages();
	        }
	    }
	}
	catch(err)
	{
		alert(err.description);
	} 
}
 
 
function LoadCustomerContactPersonMessages() 
{	 
 try
 {
		var batchs = req.responseXML.getElementsByTagName("Rows")[0]; 
		 
		for(loop = 0; loop < batchs.childNodes.length; loop++) 
	    {	     
	        var batch = batchs.childNodes[loop];
	        var dept1 = batch.getElementsByTagName("dept1")[0].childNodes[0].nodeValue;
		    var dept2 = batch.getElementsByTagName("dept2")[0].childNodes[0].nodeValue;
		    var contact1 = batch.getElementsByTagName("contact1")[0].childNodes[0].nodeValue;
		    var contact2 = batch.getElementsByTagName("contact2")[0].childNodes[0].nodeValue;
		    var Desigination1 = batch.getElementsByTagName("Desigination1")[0].childNodes[0].nodeValue;
		    var Desigination2 = batch.getElementsByTagName("Desigination2")[0].childNodes[0].nodeValue;
		    document.getElementById('department').value = dept1 ;
		    document.getElementById('cperson').value =contact1;
		    document.getElementById('designination').value =Desigination1;
	    }
  	}
 	catch(err)
 	{
 		alert(err.description);
 	}    	
}


