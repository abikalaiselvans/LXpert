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


function LoadTermsandconditions(startLetter)
{
	try
	{
	 	var url = "../inventory?actionS=LoadTermsandconditions&startLetter="+escape(startLetter);
	 	var tob=document.getElementById('divscroll');
		tob.innerHTML="<br><br><center> <img src='../images/loading_gif.gif' width='508' height='381'></center>" ;
		initRequest(url);
		req.onreadystatechange=LoadTermsandconditionsRequest;
	    req.open("GET", url, true);
	    req.send(null);
	}
	catch(err)
	{
		alert(err);
	}
}
 
 function LoadTermsandconditionsRequest() 
 {
 	try
 	{
	    if(req.readyState == 4) 
	    {    	
	    	
	        ClearTable('divscroll');  
	        ClearTabler('totRec');  
	    	if (req.status == 200) 
	        {		  	
	    		LoadTermsandconditionsMessages();
	        }
	    }
	}
	catch(err)
	{
		alert(err.description);
	} 
}
 
 
function LoadTermsandconditionsMessages() 
{	 
 try
 {
	  
	 var batchs = req.responseXML.getElementsByTagName("Rows")[0];   
	 var str=""; 
	 str=str+"<table width='100%'  class='boldEleven'  id='myTable'     cellpadding=2 cellspacing=1 bgcolor='#9900CC' >";
	 str=str+"<tr class='MRow1'>";
	 str=str+"<td  class='boldEleven'><center><b>S.NO</b></center></td>";
	 str=str+"<td  class='boldEleven'><center><b>TERMS AND CONDITIONS</b></center></td>";
	 str=str+"<td  class='boldEleven'><center><b>DESCRIPTIONS</b></center></td>";
	 str=str+"</tr>";
	 for(loop = 0; loop < batchs.childNodes.length; loop++) 
	 {	     
        var batch = batchs.childNodes[loop];
        var Rowid = batch.getElementsByTagName("Rowid")[0].childNodes[0].nodeValue;
	    var Name = batch.getElementsByTagName("Name")[0].childNodes[0].nodeValue;
	    var Description = batch.getElementsByTagName("Description")[0].childNodes[0].nodeValue;
	    
	    
	    if(loop%2==1)
			str=str+"<tr class='MRow1'>";
		else
		    str=str+"<tr  class='MRow2'>";		
		str=str+"<td  class='boldEleven'><input id='rowid' name='rowid' type='checkbox' value='"+Rowid+"' />"+(loop+1)+"</td>";
		str=str+"<td  class='boldEleven'> "+Name+"</td>";
		str=str+"<td  class='boldEleven'> "+Description+"</td>";
		str=str+"</tr>";
		window.status=(loop+1);
	 }
      
	 if(batchs.childNodes.length <1)
		str=str+"<td colspan='5' class='bolddeepred'><br><br><br><center>Data not found..</center></td>";
	 str=str+"</table>";
    
	 var tb=document.getElementById('divscroll');
  	 tb.innerHTML=str   ;
  	 tb=document.getElementById('totRec');
  	 tb.innerHTML= "<font color='red'>Total no of Records : "+batchs.childNodes.length+"</font>"; 
  	}
 	catch(err)
 	{
 		alert(err.description);
 	}    	
}


