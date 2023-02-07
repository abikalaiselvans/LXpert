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
 
  
function loadFinalInterview (startLetter) 
{    
	var mon=document.getElementById('month').value; 	
	var yr=document.getElementById('year').value;  
	var jobtitle=document.getElementById('jobtitle').value; 
	var jobgrade=document.getElementById('jobgrade').value; 
	var day=document.getElementById('day').value; 
	var Status=document.getElementById('Status').value; 
	var office=document.getElementById('office').value; 
	var url = "../SmartHRM?actionS=loadFinalInterview&mon="+escape(mon)+"&yr="+escape(yr)+"&startLetter="+escape(startLetter)+"&jobtitle="+jobtitle+"&jobgrade="+jobgrade+"&day="+day+"&Status="+Status+"&office="+office; 
   	initRequest(url);
    req.onreadystatechange = loadFinalInterviewRequest;
    req.open("GET", url, true);
    req.send(null);
}
function loadFinalInterviewRequest() 
{
    if(req.readyState == 4) {    
        ClearTable('applicationTable');
        ClearTabler('totalRec');
        if (req.status == 200) {

			var ebutton = document.getElementById('Edit');
			var dbutton = document.getElementById('Delete');
			ebutton.disabled=false;
			dbutton.disabled=false;

			loadFinalInterviewDetails();
        }
		else
		{
			var ebutton = document.getElementById('Edit');
			var dbutton = document.getElementById('Delete');
			ebutton.disabled=true;
			dbutton.disabled=true;
		}
		
    }
}


function loadFinalInterviewDetails() 
{
    var batchs = req.responseXML.getElementsByTagName("Rows")[0];      
	 
	var str=""; 
    str=str+"<table width='100%' id='myTable' align=center    cellpadding=2 cellspacing=1 bgcolor='#9900CC' >";
    str=str+"<tr class='MRow1'>";
    str=str+"<td class='bold1'  >S.No</td>";  
    str=str+"<td class='bold1'  >App Code</td>";  
    str=str+"<td class='bold1' >App Name</td> ";  
    str=str+"<td class='bold1'  >Job Title</td>";  
	str=str+"<td class='bold1'  >1st Int Date</td>";  
	str=str+"<td class='bold1'  >Position </td>";  
	
	str=str+"<td class='bold1'  >1st Int Name</td>";  
	str=str+"<td class='bold1'  >Int Date </td>";  
	str=str+"<td class='bold1'  >1st Int Status</td>"; 
	
	str=str+"<td class='bold1'  >2nd Int Name</td>";  
	str=str+"<td class='bold1'  >2nd Int Date </td>";  
	str=str+"<td class='bold1'  >2nd Int Status</td>";  
	str=str+"<td class='bold1'  >Candidate Status</td>"; 
	 
	
	str=str+"</tr>";  
	for(loop = 0; loop < batchs.childNodes.length; loop++) 
    {
	     var batch = batchs.childNodes[loop];
	     var Id = batch.getElementsByTagName("Id")[0].childNodes[0].nodeValue;
	     var Code = batch.getElementsByTagName("Code")[0].childNodes[0].nodeValue;
	     var Name = batch.getElementsByTagName("Name")[0].childNodes[0].nodeValue;
		 var Jobgrade = batch.getElementsByTagName("Jobgrade")[0].childNodes[0].nodeValue;
		 var Jobcode = batch.getElementsByTagName("Jobcode")[0].childNodes[0].nodeValue;
		 var Jobtitle = batch.getElementsByTagName("Jobtitle")[0].childNodes[0].nodeValue;
		 var Dateofinterview = batch.getElementsByTagName("Dateofinterview")[0].childNodes[0].nodeValue;
		 var Position = batch.getElementsByTagName("Position")[0].childNodes[0].nodeValue;
		
		 var   FInterviewedby = batch.getElementsByTagName("FInterviewedby")[0].childNodes[0].nodeValue;
		 var   FInterviewedname= batch.getElementsByTagName("FInterviewedname")[0].childNodes[0].nodeValue;
		 var   FIntervieweddate= batch.getElementsByTagName("FIntervieweddate")[0].childNodes[0].nodeValue;
		 var   FInterviewedstatus= batch.getElementsByTagName("FInterviewedstatus")[0].childNodes[0].nodeValue;
		 var   SInterviewedby= batch.getElementsByTagName("SInterviewedby")[0].childNodes[0].nodeValue;
		 var   SInterviewedname= batch.getElementsByTagName("SInterviewedname")[0].childNodes[0].nodeValue;
		 var   SIntervieweddate= batch.getElementsByTagName("SIntervieweddate")[0].childNodes[0].nodeValue;
		 var   SInterviewedstatus= batch.getElementsByTagName("SInterviewedstatus")[0].childNodes[0].nodeValue;
		 var   Status= batch.getElementsByTagName("Status")[0].childNodes[0].nodeValue;
		 var   CandidateStatus= batch.getElementsByTagName("CandidateStatus")[0].childNodes[0].nodeValue;
		 var   Conculsion= batch.getElementsByTagName("Conculsion")[0].childNodes[0].nodeValue;
		 
		 
		 	
		     		
		
       if(loop%2==1)
			str=str+"<tr class='MRow1'>";
		else
		    str=str+"<tr  class='MRow2'>";	

	     
	   if(Conculsion =="Y")
	   		  str=str+"<td align='left' class='boldEleven'> "+(loop+1)+"</td>";
	   else
	   		str=str+"<td align='left' class='boldEleven'> <input type='checkbox' name='rowid'  id='rowid' value='"+Id+"'>&nbsp;"+(loop+1)+"</td>";
	    
	     
	    str=str+"<td align='left' class='boldEleven'>"+Code+"  </td>";  
		
		if((SInterviewedstatus == "N")  || (Conculsion =="Y" ) )
			str=str+"<td align='left' class='boldEleven'>"+Name+"  </td>"; 
		else
			str=str+"<td align='left' class='boldEleven'><a href='HRThirdInterviewUpdate.jsp?rowid="+Id+"'><font class='boldgreen'>"+Name+" </font></a> </td>";  
		str=str+"<td align='left' class='boldEleven'>"+Jobtitle+"  </td>";  
		str=str+"<td align='left' class='boldEleven'>"+Dateofinterview+"  </td>";  
		str=str+"<td align='left' class='boldEleven'>"+Position+"  </td>";  
		str=str+"<td align='left' class='boldEleven'>"+ FInterviewedname +"  </td>";  
		str=str+"<td align='left' class='boldEleven'>"+FIntervieweddate+"  </td>"; 
		     	
		if("Y" == FInterviewedstatus)
			str=str+"<td align='left' class='boldEleven'><font class='boldgreen'>Pass</font></td>";
		else
			str=str+"<td align='left' class='boldEleven'><font class='bolddeepred'>Fail</font></td>";
		
		
		
		str=str+"<td align='left' class='boldEleven'>"+ SInterviewedname +"  </td>";  
		str=str+"<td align='left' class='boldEleven'>"+SIntervieweddate+"  </td>"; 
		     	
		if("Y" == SInterviewedstatus)
			str=str+"<td align='left' class='boldEleven'><font class='boldgreen'>Pass</font></td>";
		else
			str=str+"<td align='left' class='boldEleven'><font class='bolddeepred'>Fail</font></td>";
		
		
		 
		if("S" == CandidateStatus)
			str=str+"<td align='left' class='boldEleven'><font class='boldgreen'>SHORTLIST</font></td>";
		else if("H" == CandidateStatus)
			str=str+"<td align='left' class='boldEleven'><font class='bolddeepred'>HOLD</font></td>";
		else if("R" == CandidateStatus)
			str=str+"<td align='left' class='boldEleven'><font class='bolddeepred'>REJECTED</font></td>";
		else 
			str=str+"<td align='left' class='boldEleven'><font class='bolddeepred'>Not Attend</font></td>";
		
		  
		     	
		 
	   
	   
     }

     str=str+"</table>";
     var tb=document.getElementById('applicationTable');
  	 tb.innerHTML=str   
	
  	if(batchs.childNodes.length >0)
	 {  	 	
  	var tb=document.getElementById('totalRec');
	 	tb.innerHTML="<center> <font  class='bolddeepred'>Total No of Records : "+batchs.childNodes.length+"</font></center>" ;
		
		
  }
  else
  {
  	str=str+"<tr class='MRow1'><td colspan='8' class='bolddeepred'><br><br><br><center>Data not found..</center></td></tr>";
  	 
  }	
 
 } 	
 
 
  