 
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


function loadEmd(startLetter)
{
	try
	{
	 	var office=document.getElementById('office').value;
		var EmdType=document.getElementById('EmdType').value;
		var month=document.getElementById('month').value;
		var year=document.getElementById('year').value;
		var tb=document.getElementById('EmdTable');
		var accept = document.getElementById('accept').value;
		var returned = document.getElementById('returned').value;
		
  		tb.innerHTML=""  ; 
		var url = "../inventory?actionS=INVloadEMD&startLetter="+escape(startLetter)+"&office="+office+"&EmdType="+EmdType+"&year="+year+"&month="+month+"&accept="+accept+"&returned="+returned;;
	 	initRequest(url);
		req.onreadystatechange=loadEmdViewRequest;
	    req.open("GET", url, true);
	    req.send(null);
	}
	catch(err)
	{
		alert(err);
	}
}
 
 function loadEmdViewRequest() 
 {
 	try
 	{
	    if(req.readyState == 4) 
	    {    	
	    	
	        ClearTable('EmdTable');  
	        ClearTabler('totRec');  
	    	if (req.status == 200) 
	        {		  	
				var tb=document.getElementById('EmdTable');
				tb.innerHTML="<font class='bolddeepred'> Loading Data</font>"; 
				loadEmdViewMessages();
	        }
	    }
	}
	catch(err)
	{
		alert(err.description);
	} 
}
 
 
function loadEmdViewMessages() 
{	 
 try
 {
	  
	 var batchs = req.responseXML.getElementsByTagName("Emd")[0];   
	 var str=""; 
	 str=str+"<table width='100%' class='boldEleven' id='myTable' cellpadding=2 cellspacing=1 bgcolor='#9900CC' >";
	 var tot =0;
	 for(loop = 0; loop < batchs.childNodes.length; loop++) 
	 {	     
        var batch = batchs.childNodes[loop];
        var Emdid = batch.getElementsByTagName("Emdid")[0].childNodes[0].nodeValue;
	    var EmdType = batch.getElementsByTagName("EmdType")[0].childNodes[0].nodeValue;
		var CustomerName = batch.getElementsByTagName("CustomerName")[0].childNodes[0].nodeValue;
	    var EmdAmt = batch.getElementsByTagName("EmdAmt")[0].childNodes[0].nodeValue;
		var TenderLastDate = batch.getElementsByTagName("TenderLastDate")[0].childNodes[0].nodeValue;
		var Status = batch.getElementsByTagName("Status")[0].childNodes[0].nodeValue;
		var Approval = batch.getElementsByTagName("Approval")[0].childNodes[0].nodeValue;
		var Entry = batch.getElementsByTagName("Entry")[0].childNodes[0].nodeValue;
		var Division = batch.getElementsByTagName("Division")[0].childNodes[0].nodeValue;
		var Emdnumber = batch.getElementsByTagName("Emdnumber")[0].childNodes[0].nodeValue;
		var F = batch.getElementsByTagName("F")[0].childNodes[0].nodeValue;
		
		
	    if(loop%2==1)
			str=str+"<tr class='MRow1'>";
		else
		    str=str+"<tr  class='MRow2'>";		
	    tot = tot+parseFloat(EmdAmt)
		
	    str = str+"<td  class='boldEleven' width=40>"+(loop+1)+".</td>";
	    str = str + "<td  class='boldEleven'  > " + Emdnumber+ "</td>";
		
		str = str+"<td  class='boldEleven' width=60> "+EmdType+"</td>";
		//str = str + "<td  class='boldEleven'> " + Division + "</td>";
		str = str+"<td  class='boldEleven'> "+CustomerName+"</td>";
		//str = str + "<td  class='boldEleven'> " + Entry + "</td>";
		str = str+"<td  class='boldEleven' align='right'> "+EmdAmt+"</td>";
		str = str+"<td  class='boldEleven'> "+TenderLastDate+"</td>";
		
		if(Approval == "Y")
			str=str+"<td  class='boldEleven'><font class='boldgreen'>Accept</font></td>";
		else if(Approval == "R")
			str=str+"<td  class='boldEleven'><font class='bolddeepred'>Reject</font></td>";
		else
			str=str+"<td  class='boldEleven'><font class='bolddeepred'>Pending</font></td>";
		
		if(Status == "Y")
			str=str+"<td  class='boldEleven'><font class='boldgreen'>Returned</font></td>";
		else
			str=str+"<td  class='boldEleven'><font class='bolddeepred'>Not Return</font></td>";
		
		
		if(Approval != "Y")
			str=str+"<td  class='boldEleven'><a href='EmdActionApproval.jsp?Rowid="+Emdid+"'><font class='bolddeepred'>Accept</font></a></td>";
		else
			str=str+"<td  class='boldEleven'>&nbsp;</td>";
		
		
		if(Status == "Y")
			str=str+"<td  class='boldEleven'>&nbsp;</td>";
		else
			str=str+"<td  class='boldEleven'><a href='EmdActionReceived.jsp?Rowid="+Emdid+"'><font class='bolddeepred'>Received</font></a></td>";
		
		
		if(Approval == "Y")
		{
			str=str+"<td  class='boldEleven'><a href=\"javascript:Printquery('UploadEMD_File.jsp?Rowid="+Emdid+"')\" title='Upload scnned copy' ><font class='boldgreen'>Upload</font></a>";
			if(F =="Y")
				str=str+"&nbsp;&nbsp;/&nbsp;&nbsp;<a target='_blank' href='../uploadfiles/EMD_File/"+Emdid+".pdf' download='"+Emdid+".pdf' ><font class='boldgreen'>Download</font></a> ";
			
	 	}
		else
			str=str+"<td  class='boldEleven'>&nbsp;</td>";
		
	 	
		
		//'../EMD_File/"+Emdid+".pdf'
	 }
	 str=str+"</tr>";
		
	 if(batchs.childNodes.length >0)
	 {
		 str=str+"<tr class='MRow1'>"; 
		 str=str+"<td  class='boldEleven'>&nbsp;</td>";
		 str=str+"<td  class='boldEleven'>&nbsp;</td>";
		 //str=str+"<td  class='boldEleven'>&nbsp;</td>";
		 str=str+"<td  class='boldEleven'>&nbsp;</td>";
		 //str=str+"<td  class='boldEleven'>&nbsp;</td>";
		 str=str+"<td  align='right' class='boldEleven'><font class='bolddeepred'>Total  : </font></td>";
		 str=str+"<td  align='right' class='boldEleven'><font class='bolddeepred'>"+tot.toFixed(2)+"</font></td>";
		 str=str+"<td  class='boldEleven'>&nbsp;</td>";
		 str=str+"<td  class='boldEleven'>&nbsp;</td>";
		 str=str+"<td  class='boldEleven'>&nbsp;</td>";
		 str=str+"<td  class='boldEleven'>&nbsp;</td>";
		 str=str+"<td  class='boldEleven'>&nbsp;</td>";
		 str=str+"<td  class='boldEleven'>&nbsp;</td>";
		 str=str+"</tr>";
	 } 
	 
	 if(batchs.childNodes.length <1)
		str=str+"<tr class='MRow1'><td colspan='5' class='bolddeepred'><br><br><br><center>Data not found..</center></td></tr>";
	 	
	 str=str+"</table>";
    
	 var tb=document.getElementById('EmdTable');
  	 tb.innerHTML=str   ;
  	 tb=document.getElementById('totRec');
  	 tb.innerHTML= "<font class='bolddeepred'>Total no of Records : "+batchs.childNodes.length+"</font>"; 
  	}
 	catch(err)
 	{
 		alert(err.description);
 	}    	
}

