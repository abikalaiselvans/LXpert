var isIE;
var req;
var names;

 
function initRequest(url) {
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        req = new ActiveXObject("Microsoft.XMLHTTP");
    }
}
 
function ClearTable(ctr1)
{
	 var str="Nothing  found";
	 var tb=document.getElementById(ctr1);	 
  	 tb.innerHTML=str     
  	 
}

 
function customercreditlimit(startLetter)
 {
 	var month=document.getElementById('month').value;
 	var year=document.getElementById('year').value;
 	var url = "../Account?actionS=Payments&month="+escape(month)+"&year="+escape(year)+"&startLetter="+escape(startLetter);
    initRequest(url);
	req.onreadystatechange=PaymentsRequest;
    req.open("GET", url, true);
    req.send(null);
}
 
 function PaymentsRequest() 
 {
 	try
 	{
	    if(req.readyState == 4) 
	    {    	
	    	
	        ClearTable('divscroll');  
	        var tb=document.getElementById('divscroll');
	  	 	tb.innerHTML="" ;
	  	 	var tb1=document.getElementById('totRec');
	  	 	tb1.innerHTML=" " ;
	  		document.getElementById('Edit').disabled=true;  
	  		if (req.status == 200) 
	        {		  	
	          PaymentsMessages();
	        }
	    }
	}
	catch(err)
	{
		alert(err.description);
	} 
}
function PaymentsMessages() 
{	 
    var batchs = req.responseXML.getElementsByTagName("Rows")[0];   
    var str=""; 
    
	str=str+"<table width=100%  border='0' bordercolor='#EEEAFE' class='boldEleven' cellpadding='1' cellspacing='1'>";
  	str=str+"<tr  class='MRow2'>";
  	str=str+"<td  class='boldEleven'><b>S.No</b></td>";
    str=str+"<td  class='boldEleven'><b>Group Name</b> </td>";
    str=str+"<td  class='boldEleven'><b>Description</b></td>";
    str=str+"<td  class='boldEleven'><b>Date</b></td>";
    str=str+"<td  class='boldEleven'><b>Amount</b></td>";
    str=str+"</tr> ";
  
  	for(loop = 0; loop < batchs.childNodes.length; loop++) 
    {	     
        var batch = batchs.childNodes[loop];
        var Field1 = batch.getElementsByTagName("Field1")[0].childNodes[0].nodeValue;
	    var Field2 = batch.getElementsByTagName("Field2")[0].childNodes[0].nodeValue;
	    var Field3 = batch.getElementsByTagName("Field3")[0].childNodes[0].nodeValue;
	    var Field4 = batch.getElementsByTagName("Field4")[0].childNodes[0].nodeValue;
	    var Field5 = batch.getElementsByTagName("Field5")[0].childNodes[0].nodeValue;
	    
        if(loop%2==1)
			str=str+"<tr class='MRow1'>";
		else
		    str=str+"<tr  class='MRow2'>";		
		   
		str=str+"<td  class='boldEleven'><input name='expenseid' id='expenseid' type='checkbox' value='"+Field1+"'/>&nbsp;"+(loop+1);
		str=str+"<td  class='boldEleven'>&nbsp;"+Field2;
		str=str+"<td  class='boldEleven'>&nbsp;"+Field3;
		str=str+"<td  class='boldEleven'>&nbsp;"+Field4;
		str=str+"<td  class='boldEleven' align='right'>&nbsp;"+Field5;
		
		
    }
	 if(batchs.childNodes.length >0)
  	 {  	 	
     	document.getElementById('Edit').disabled=false;
     }
     else
     {
     	str=str+"<td colspan='8' class='bolddeepred'><br><br><br><center>Data not found..</center></td>";
     	document.getElementById('Edit').disabled=true;
     
     }	
	 str=str+"</table>";
     var tb=document.getElementById('divscroll');
  	 tb.innerHTML=str   ;
  	 
  	 tb=document.getElementById('totRec');
  	 tb.innerHTML= "<font color='red'>Total no of Records ::</font>"+batchs.childNodes.length; 
     	
}