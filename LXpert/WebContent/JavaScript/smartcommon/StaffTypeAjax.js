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

function  loadStaffType(str) 
{
	var url = "../SmartCommonAjax?actionS=loadStaffType&str="+str;
	initRequest(url);
	req.onreadystatechange = loadStaffTypeRequest;
    req.open("GET", url, true);
    req.send(null);
   
}

function loadStaffTypeRequest() 
{
    if(req.readyState == 4) 
    {    	
        
        ClearTable('loadStaffTypeTable');
        ClearTabler('totrec');
        if (req.status== 200) 
        {		  	
        	loadStaffTypeMessages();
        }
    }
}

function loadStaffTypeMessages() 
{	 
	var batchs = req.responseXML.getElementsByTagName("Rows")[0];   
   
    var str=""; 
    str=str+"<table width='100%'  class='boldEleven'  id='myTable'     cellpadding=2 cellspacing=1 bgcolor='#9900CC' >";
    for(loop = 0; loop < batchs.childNodes.length; loop++) 
    {
	    
	    var batch = batchs.childNodes[loop];
	    var Id = batch.getElementsByTagName("Id")[0].childNodes[0].nodeValue;
	    var Name = batch.getElementsByTagName("Name")[0].childNodes[0].nodeValue;
	    var Flag = batch.getElementsByTagName("Flag")[0].childNodes[0].nodeValue;
		  
        if(loop%2==1)
			str=str+"<tr class='MRow1'>";
		else
		    str=str+"<tr  class='MRow2'>";	
		   			 
		str=str+"<td   class='boldEleven'><input name='id' id='id' type='checkbox' value='"+Id+"' />"+(loop+1);
		str=str+"<td   class='boldEleven'>&nbsp;"+Name;
		if(Flag=="Y")
			str=str+"<td   class='bold'>YES" ;
		else
			str=str+"<td   class='bolddeepred'>No" ;
		
    }
   
    if(batchs.childNodes.length<1)
     	str=str+"<tr class='MRow1'><td class='bolddeepred'><center>Data not found...</center></td></tr>";
    
    	
    str=str+"</table>";
     var tb=document.getElementById('loadStaffTypeTable');
  	 tb.innerHTML=str  ; 
 	tb=document.getElementById('totrec');
  	tb.innerHTML= " <center><font class='bolddeepred'>Total No of Record : "+batchs.childNodes.length  +"</font></center>"; 
  	 
  	
}

  