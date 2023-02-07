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
  
function loadFirstInterview (startLetter) 
{    
	var mon=document.getElementById('month').value; 	
	var yr=document.getElementById('year').value;  
	var jobtitle=document.getElementById('jobtitle').value; 
	var jobgrade=document.getElementById('jobgrade').value; 
	var result=document.getElementById('result').value; 
	var day=document.getElementById('day').value; 
	var office=document.getElementById('office').value;
	var url = "../SmartHRM?actionS=loadFirstInterview&mon="+escape(mon)+"&yr="+escape(yr)+"&startLetter="+escape(startLetter)+"&jobtitle="+jobtitle+"&jobgrade="+jobgrade+"&result="+result+"&day="+day+"&office="+office; 
   	 
   	initRequest(url);
    req.onreadystatechange = loadFirstInterviewRequest;
    req.open("GET", url, true);
    req.send(null);
}
function loadFirstInterviewRequest() 
{
    if(req.readyState == 4) {    
        ClearTable('applicationTable');
        ClearTabler('totalRec');
        if (req.status == 200) {
 
			loadFirstInterviewDetails();
        }
		 
		
    }
}


function loadFirstInterviewDetails() {
    var batchs = req.responseXML.getElementsByTagName("Rows")[0];      
	var str=""; 
    str=str+"<table width='100%' id='myTable' align=center    cellpadding=2 cellspacing=1 bgcolor='#9900CC' >";
    str=str+"<tr class='MRow1'>";
    str=str+"<td class='bold1'  >S.No</td>";  
    str=str+"<td class='bold1'  >Appct. Code</td>";  
    str=str+"<td class='bold1' >Appct. Name</td> ";  
    str=str+"<td class='bold1'  >Job Title</td>";  
	str=str+"<td class='bold1'  >Int. Date</td>";  
	str=str+"<td class='bold1'  >Position </td>";  
	str=str+"<td class='bold1'  >Current Salary(Rs.)</td>";  
	str=str+"<td class='bold1'  >Expected Salary(Rs.)</td>";  
	str=str+"<td class='bold1'  >Notice Period </td>";  
	str=str+"<td class='bold1'  >Int. By</td>";  
	str=str+"<td class='bold1'  >Int. Status</td>";
	str=str+"<td class='bold1'  >Print</td>";  
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
		 var Exp = batch.getElementsByTagName("Exp")[0].childNodes[0].nodeValue;
		 var Age = batch.getElementsByTagName("Age")[0].childNodes[0].nodeValue;
		 var Csalary = batch.getElementsByTagName("Csalary")[0].childNodes[0].nodeValue;
		 var Esalary = batch.getElementsByTagName("Esalary")[0].childNodes[0].nodeValue;
		 var NoticeP = batch.getElementsByTagName("NoticeP")[0].childNodes[0].nodeValue;
		 var Interviewedby = batch.getElementsByTagName("Interviewedby")[0].childNodes[0].nodeValue;
		 var Intervieweddate = batch.getElementsByTagName("Intervieweddate")[0].childNodes[0].nodeValue;
		 var Interviewedstatus = batch.getElementsByTagName("Interviewedstatus")[0].childNodes[0].nodeValue;
		 var Secondinterviewstatus = batch.getElementsByTagName("Secondinterviewstatus")[0].childNodes[0].nodeValue;
		 
		
       if(loop%2==1)
			str=str+"<tr class='MRow1'>";
		else
		    str=str+"<tr  class='MRow2'>";	

	    if(Secondinterviewstatus=="Y")
	    	str=str+"<td align='left' class='boldEleven'> &nbsp;"+(loop+1);
	    else
	    	str=str+"<td align='left' class='boldEleven'> <input type='checkbox' name='rowid'  id='rowid' value='"+Id+"'>&nbsp;"+(loop+1)+"</td>";
		str=str+"<td align='left' class='boldEleven'>"+Code+"  </td>";  
		str=str+"<td align='left' class='boldEleven'>"+Name+"  </td>";  
		str=str+"<td align='left' class='boldEleven'>"+Jobtitle+"  </td>";  
		str=str+"<td align='left' class='boldEleven'>"+Dateofinterview+"  </td>";  
		str=str+"<td align='left' class='boldEleven'>"+Position+"  </td>";  
		str=str+"<td align='left' class='boldEleven' align='right'>"+Csalary+"  </td>";  
		str=str+"<td align='left' class='boldEleven' align='right'>"+Esalary+"  </td>"; 
		str=str+"<td align='left' class='boldEleven'>"+NoticeP+" - Days  </td>";
		str=str+"<td align='left' class='boldEleven'>"+Interviewedby+"  </td>";  
		if("Y" == Interviewedstatus)
			str=str+"<td align='left' class='boldEleven'><font class='boldgreen'>Pass</font></td>";
		else
			str=str+"<td align='left' class='boldEleven'><font class='bolddeepred'>Fail</font></td>";
		
		
		if(  "-" != Interviewedby)	
			str=str+"<td align='left' class='boldEleven'><a target='_blank' href='FirstInterviewPrint.jsp?rowid="+Id+"'><font class='boldgreen'>Print</font></a>  </td>"; 
		else
			str=str+"<td align='left' class='boldEleven'>&nbsp;</td>";
		
		str=str+"</tr>";
		 
	   
	   
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
 
 
  