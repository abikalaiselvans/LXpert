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
	 var str="<center><br><br><br><font class='bolddeepred'>Data not found...</font></br></br></br>";
	 var tb=document.getElementById(ctr1);	 
  	 tb.innerHTML=str     
}
 
function ClearTabler(ctr1)
{
	 var str="<center><br><font class='bolddeepred'>Total No of Records : 0</font></br>";
	 var tb=document.getElementById(ctr1);	 
  	 tb.innerHTML=str     
}



 
 
function LoadMobileContacts (startLetter)
 {
 	 
    var url = "../marketing?actionS=LoadMobileContacts&startLetter="+escape(startLetter)+"&group="+document.getElementById('group').value+"&searchby="+document.getElementById('searchval').value;;
   	initRequest(url);
	req.onreadystatechange=LoadMobileContactsRequest;
    req.open("GET", url, true);
    req.send(null);
}
 
 function LoadMobileContactsRequest() {
	  ClearTabler('totalrec');
      ClearTable('GroupTable');

    if(req.readyState == 4) {    	
		document.getElementById('Edit').disabled=true; 
		document.getElementById('Delete').disabled=true;   		
        if (req.status == 200) 
        {		  	
          var tb=document.getElementById('GroupTable');
		  tb.innerHTML="<font class='bolddeepred'> Loading Data</font>";
		  LoadMobileContactsMessages();
        }
    }
}

function LoadMobileContactsMessages() 
{	 
    var batchs = req.responseXML.getElementsByTagName("Rows")[0];   
    var str=""; 
	str=str+"<table width='100%'  class='boldEleven'  id='myTable'     cellpadding=3 cellspacing=1 bgcolor='#9900CC' >";
  	for(loop = 0; loop < batchs.childNodes.length; loop++) 
    {	     
        var batch = batchs.childNodes[loop];
        var Id = batch.getElementsByTagName("Id")[0].childNodes[0].nodeValue;
        var Group = batch.getElementsByTagName("Group")[0].childNodes[0].nodeValue;
	    var Name = batch.getElementsByTagName("Name")[0].childNodes[0].nodeValue;
	    var Mobile = batch.getElementsByTagName("Mobile")[0].childNodes[0].nodeValue;
	    var Age = batch.getElementsByTagName("Age")[0].childNodes[0].nodeValue;
	    var City = batch.getElementsByTagName("City")[0].childNodes[0].nodeValue;
	    var Staff = batch.getElementsByTagName("Staff")[0].childNodes[0].nodeValue;
	    var Email = batch.getElementsByTagName("Email")[0].childNodes[0].nodeValue;
	    
	    
	    if(loop%2==1)
			str=str+"<tr class='MRow1'>";
		else
		    str=str+"<tr  class='MRow1'>";		
		   
		str=str+"<td  class='boldEleven'><input name='id' id='id' type='checkbox' value='"+Id+"'/>&nbsp;"+(loop+1)+"</td>";
		str=str+"<td  class='boldEleven'>&nbsp;"+Group+"</td>";
		str=str+"<td  class='boldEleven'> <a href='MobileContactsAction.jsp?id="+Id+"' >"+Name +" </a> " +"</td>";
		str=str+"<td  class='boldEleven'>&nbsp;"+Mobile+"</td>";
		str=str+"<td  class='boldEleven'>&nbsp;"+Email+"</td>";
		str=str+"<td  class='boldEleven'>&nbsp;"+Age+"-yrs</td>";
		str=str+"<td  class='boldEleven'>&nbsp;"+City+"</td>";
		str=str+"<td  class='boldEleven'>&nbsp;"+Staff+"</td>";
		str=str+"</tr>";
		 
    }
    
	 var tb=document.getElementById('GroupTable');
  	 tb.innerHTML=str   ;
  	 
  	 tb=document.getElementById('totalrec');
  	 tb.innerHTML= "<center><font class='bolddeepred'>Total no of Records ::"+batchs.childNodes.length+"</font></center>";
	 if(batchs.childNodes.length >0)
  	{  	 	
     	document.getElementById('Edit').disabled=false;
     	document.getElementById('Delete').disabled=false;
    }
    else
    {
     	str=str+"<td colspan='8' class='bolddeepred'><br><br><br><center>Data not found..</center></td>";
     	document.getElementById('Edit').disabled=true;
     	document.getElementById('Delete').disabled=true;
     
    }	
	 str=str+"</table>";

     	
}







 /*function LoadMobileContactssearch(ctr)
 {
 	
 	var url = "../marketing?actionS=LoadMobileContacts&startLetter="+escape(ctr.value)+"&group="+document.getElementById('group').value+"&searchby="+document.getElementById('searchby').value; 
   	initRequest(url);
	req.onreadystatechange=LoadMobileContactsRequest;
    req.open("GET", url, true);
    req.send(null);
 }*/
 