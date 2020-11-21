var isIE;
var req;
var names;
var convalue=true;

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
	 var str="Nothing  found";
	 var tb=document.getElementById(ctr1);	 
  	 tb.innerHTML=str     
}



function loadConveyance(claimdate,empid)
{
 	var date=document.getElementById(claimdate).value;   	
    var url = "../Conveyance?actionS=Conveyance&claimdate="+escape(date)+"&empid="+empid;  
    initRequest(url);
    req.onreadystatechange = ConveyanceRequest;
    req.open("GET", url, true);
    req.send(null);
    
    
}
 
function ConveyanceRequest()
 {
    if(req.readyState == 4) {
         if (req.status == 200) {
          ConveyanceMessage();
          
        }
    }
}

function ConveyanceMessage() 
{	
    var batchs = req.responseXML.getElementsByTagName("Ids")[0];   	    
	var str=""; 
    var loop=0;
    //for(loop=0; loop<batchs.childNodes.length; loop++)
     //{
	    var batch = batchs.childNodes[loop];
        var Flag = batch.getElementsByTagName("Flag")[0];
       	if(Flag.childNodes[0].nodeValue == "TRUE")
       	{
       		document.getElementById('claimdatecheck').value="true"   	;
       		alert("Already Claim added this date..");
       		document.getElementById('sub1').disabled=true;
       		document.getElementById('buttonitemadd').disabled=true;
       	}	
       	else
       	{
       		document.getElementById('claimdatecheck').value="false"  	;
       		document.getElementById('sub1').disabled=false;
       		document.getElementById('buttonitemadd').disabled=false;
       	}
       	
    // }
 }
