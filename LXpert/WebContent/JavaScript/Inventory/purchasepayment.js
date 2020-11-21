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


function LoadPayment(startLetter) 
{
	var divis=document.getElementById('divis').value;
	var payment=document.getElementById('payment').value;
	var vendorid=document.getElementById('vendorid').value;
	var Status=document.getElementById('Status').value;
	var month=document.getElementById('month').value;
	var year=document.getElementById('year').value; 
    var url = "../inventory?actionS=INVPurchasePayment&type=1&payment="+payment+"&id="+escape(startLetter)+"&vendorid="+vendorid+"&month="+month+"&year="+year;
    url = url+"&Status="+Status+"&divis="+divis;
    initRequest(url);
 	req.onreadystatechange = PaymentRequest;
 	req.open("GET", url, true);
 	req.send(null);
}


function LoadPayments(ctr) 
{
	var divis=document.getElementById('divis').value;
	var payment=document.getElementById('payment').value;
	var vendorid=document.getElementById('vendorid').value;
	var Status=document.getElementById('Status').value;
	var month=document.getElementById('month').value;
	var year=document.getElementById('year').value; 
    var url = "../inventory?actionS=INVPurchasePayment&type=2&payment="+payment+"&id="+escape(ctr.value)+"&vendorid="+vendorid+"&month="+month+"&year="+year;
    url = url+"&Status="+Status+"&divis="+divis;
    initRequest(url);
 	req.onreadystatechange = PaymentRequest;
 	req.open("GET", url, true);
 	req.send(null);
}




function PaymentRequest() 
{	
	if(req.readyState == 4) 
	{    	
		ClearTable('PaymentTable');
		ClearTabler('totRec');
		 
     	if (req.status == 200)
     	{
     		PaymentMessages();
     	}
	}
}

function PaymentMessages() 
{
	var str=""; 
	var batchs = req.responseXML.getElementsByTagName("Payments")[0];   
	str=str+"<table width='100%'  class='boldEleven'  id='myTable'     cellpadding=2 cellspacing=1 bgcolor='#9900CC'>";
	var dt="";
	var ch="";
	for(loop = 0; loop < batchs.childNodes.length; loop++) 
    {
		var batch = batchs.childNodes[loop];
      	var Purchaseid = batch.getElementsByTagName("Purchaseid")[0].childNodes[0].nodeValue;
      	var Vendorname = batch.getElementsByTagName("Vendorname")[0].childNodes[0].nodeValue;
      	var Totalamount = batch.getElementsByTagName("Totalamount")[0].childNodes[0].nodeValue;
      	var Paidamount = batch.getElementsByTagName("Paidamount")[0].childNodes[0].nodeValue;
      	var Blanace = batch.getElementsByTagName("Blanace")[0].childNodes[0].nodeValue;
      	var Status = batch.getElementsByTagName("Status")[0].childNodes[0].nodeValue;
		if(loop%2==0)
			str=str+"<tr class='MRow1'>";
		else
		    str=str+"<tr  class='MRow2'>";	
		
		str=str+"<td class='boldEleven'>"+(loop+1)+".</td>";
		str=str+"<td class='boldEleven'>"
		if(parseFloat(Paidamount) > 0)
		{
			ch="<input name='pid' type='checkbox' value='"+Purchaseid +"' />"	;
			str=str+ch+Purchaseid 
			
		}
		else
		{
		str = str+Purchaseid ;
		}	
		
		str=str+"<td class='boldEleven'>"+Vendorname ;
		str=str+"<td class='boldEleven' align='right'>"+Totalamount ;
		str=str+"<td class='boldEleven' align='right'>"+Paidamount ;
		str=str+"<td class='boldEleven' align='right'>"+Blanace ;
		str = str +"<td class='boldEleven' align='right'>";
		
		if(Status  =="P")
			str = str +"<font color='Magenta'>Par.Pay</font>";
		else if(Status  =="N")
			str = str +"<font color='red'>Pending....</font>";
		else if(Status  =="Y")
			str = str +"<font color='blue'>Completed</font>";
		
   }
    
	 
	str=str+"</table>";
	var tb=document.getElementById('PaymentTable');
	tb.innerHTML=str  ; 
	
	 str=" <font class='bolddeepred'><b>Total no of Records :: "  + loop+"</b></font>";
  	 var tb=document.getElementById('totRec');
  	 tb.innerHTML=str 
} 


