<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="../error/index.jsp"%>
<%@ page import="com.my.org.erp.common.CommonFunctions"%>

<%
try
{

String PR = CommonFunctions.QueryExecute("SELECT CHR_PR_BYPASS FROM m_inventorysetting WHERE INT_ROWID=1")[0][0];
String prrequest=PR;
if(PR.equals("Y"))
 PR = "onChange = 'LoadPurchaseRequest()'";
//out.println(PR); 
String taxids[][] =  CommonFunctions.QueryExecute("Select INT_TAXID,CHR_TAXNAME from inv_m_tax");
String optiontaxname="<option value=''>Select Tax</option>";
for(int u=0; u<taxids.length; u++)
	optiontaxname =optiontaxname+"<option value='"+taxids[u][0]+"'>"+taxids[u][1]+"</option>";



String warrantyinsert="";
warrantyinsert = warrantyinsert + "<option  value='1' selected='selected'>1 - Year</option>";
warrantyinsert = warrantyinsert + "<option  value='0'>No Warranty </option>";
for(int u=2;u<=10;u++)
	warrantyinsert = warrantyinsert + "<option  value='"+u+"'>"+u+" - Years</option>";
 
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:: INVENTORY ::</title><%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="JavaScript" src="../JavaScript/Inventory/InvenCustomerAJAX.js"></script>
<script language="javascript" src="../JavaScript/Inventory/InvenAJAX.js"></script>

<script language="javascript" src="../JavaScript/jquery/jquery-1.7.1.js"></script>
<script language="javascript" src="../JavaScript/jquery/ui/jquery.ui.core.js"></script>
<script language="javascript" src="../JavaScript/jquery/ui/jquery.ui.widget.js"></script>
<script language="javascript" src="../JavaScript/jquery/ui/jquery.ui.datepicker.js"></script>
<script>
 

$(function() {
		$( "#saleDate" ).datepicker({ minDate: -200, maxDate: "+7D" });
	});
 

	</script>
<link href="../JavaScript/jquery/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css">








<script type="text/javascript">
var divi="";
function selectLoaditemproduct(ctr,div) {
	try
	{
		var prrequest = document.getElementById('prrequest').value;
		if(prrequest == "Y") 
		{
			Loaditemproduct(ctr,div) 
		}
		else 
		{
			Loaditemproducts(ctr,div) 
		}
	}
	catch(err)
	{
		alert(err);
	}
}



function Loaditemproduct(ctr,div) 
{
	var vendorid = document.getElementById('vendorid').value;
	var purchaserequest = document.getElementById('purchaserequest').value;
	var url = "../inventory?actionS=INVItemProductdependsPurchaseRequest&id="+escape(ctr.value);
	url = url + "&purchaserequest="+purchaserequest+"&vendorid="+vendorid ; 
	divi = div;
	initRequest(url);
	req.onreadystatechange = itemproductRequest;
    req.open("GET", url, true);
    req.send(null);
}

//Regarding purchase request
function Loaditemproducts(ctr,div) 
{
try
	{
	var url = "../inventory?actionS=INVItemProduct&id="+escape(ctr.value);//escape(document.getElementById(ctr).value) ;
	divi = div;
	initRequest(url);
	req.onreadystatechange = itemproductRequest;
    req.open("GET", url, true);
    req.send(null);
	}
	catch(err)
	{
		alert(err);
	}	
}

function itemproductRequest() 
{
    if(req.readyState == 4) 
    {  
    	if (req.status == 200) 
    	{		  	
         	itemproductMessages();
        }
    }
}

function itemproductMessages() 
{
	try
	{
		var batchs = req.responseXML.getElementsByTagName("items")[0];   
		var idposition = divi.replace("div","");
		s1 ='item'+idposition;
		var str="<select name='"+s1+"'   style='width:160'  id='"+s1+"' size='1' class='formText135' onblur=\"assignValues(this,'"+idposition+"')\">"; 
			for(loop = 0; loop < batchs.childNodes.length; loop++) 
			{
				var batch = batchs.childNodes[loop];
				Id= batch.getElementsByTagName("Id")[0];
				Idname= batch.getElementsByTagName("Idname")[0];
				str = str+"<option value='"+Id.childNodes[0].nodeValue+"'>"+Idname.childNodes[0].nodeValue+"</option>";
		   }
		   str=str+"</select>";
		   var tb=document.getElementById(divi);
		   tb.innerHTML=str  ; 
	}
	catch(err)
	{
		alert(err);
	}		   
}

 
 
function assignValues(ctr,pos) 
{
	
	var type = document.getElementById("itype"+pos).value;
	var typeid = ctr.value;
	var url = "../inventory?actionS=INVItemProductAssign&type="+escape(type)+"&typeid="+typeid ;
	initRequest(url);
	req.onreadystatechange = itemproductpriceRequest;
    req.open("GET", url, true);
    req.send(null);

}

function itemproductpriceRequest() 
{
    if(req.readyState == 4) 
    {  
    	if (req.status == 200) 
    	{		  	
         	itemproductpriceMessages();
        }
    }
}

function itemproductpriceMessages() 
{
	try {
		var batchs = req.responseXML.getElementsByTagName("Assigns")[0];   
		var idposition = divi.replace("div","");
		s1 ='item'+idposition;
		for(loop = 0; loop < batchs.childNodes.length; loop++) 
		{
				var batch = batchs.childNodes[loop];
				Desc= batch.getElementsByTagName("Desc")[0].childNodes[0].nodeValue;
				Price= batch.getElementsByTagName("Price")[0].childNodes[0].nodeValue;
				PPrice= batch.getElementsByTagName("PPrice")[0].childNodes[0].nodeValue;
				Ptype= batch.getElementsByTagName("Ptype")[0].childNodes[0].nodeValue;
				Ptax= batch.getElementsByTagName("Ptax")[0].childNodes[0].nodeValue;
				document.getElementById("desc"+idposition).value = Desc;
				document.getElementById("qty"+idposition).value = "1";
				document.getElementById("uprice"+idposition).value = PPrice;
				document.getElementById("discount"+idposition).value ="0";
				document.getElementById("unitdiscount"+idposition).value = "0";
				document.getElementById("stax"+idposition).value = Ptax;
				assignTaxValue("stax"+idposition);

				document.getElementById("consumables"+idposition).value =  Ptype;
				//setOptionValue("stax"+idposition , Ptax); 
				
				totals1.style.visibility="visible";
				totaldiscount1.style.visibility="visible";
				tax1.style.visibility="visible";
				salestax1.style.visibility="visible";
				salestaxamount1.style.visibility="visible";
				//nettotal1.style.visibility="visible";
				//console.log("17");
				
				calculateValue("qty"+idposition);
				calculateTotal();
				
	   }
	   calculateTotal();
	   assignGrandTotal();
     
	}
	catch(err)
	{
		console.log(err.message);
		alert(err);
	}	
 }
 
 
 
 
 
 
function LoadPurchaseRequest()
{
	try
	{
		var vendorid = document.getElementById('vendorid').value;
		var url = "../inventory?actionS=LoadPurchaseRequest&vendorid="+vendorid;
		initRequest(url);
		req.onreadystatechange=LoadPurchaseRequestRequest;
   		req.open("GET", url, true);
  		req.send(null);
	}
	catch(err)
	{
		alert(err);
	}
}


function LoadPurchaseRequestRequest() 
{
	try
	{
	   if(req.readyState == 4) 
	   { 
			var _targ=document.getElementsByName('purchaserequest')[0];       
			_targ.options.length=0;
			_targ.options[0]=new Option('Select purchase request','0'); 
			if (req.status == 200) 
			{		  	
					LoadPurchaseRequestMessages();
			}
	   }
	}
	catch(err)
	{
		alert(err);
	}
}


function LoadPurchaseRequestMessages() 
{	 
 
 	try
	{   
		var batchs = req.responseXML.getElementsByTagName("Rows")[0]; 
		var _targ=document.getElementsByName('purchaserequest')[0];       
		_targ.options.length=0;
		_targ.options[0]=new Option('Select purchase request','0');  
		var str=""; 
		for(loop = 0; loop < batchs.childNodes.length; loop++) 
		{	     
			var batch = batchs.childNodes[loop];
			var Id = batch.getElementsByTagName("Id")[0].childNodes[0].nodeValue;
			var Name = batch.getElementsByTagName("Name")[0].childNodes[0].nodeValue;
			_targ.options[loop+1]=new Option(  (Id+" For "+Name) ,Id);
		}
	}
	catch(err)
	{
		alert(err);
	}
}



</script>





<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style>



</head>
<body    onLoad="document.frm.purchaserequest.focus();">
<%@ include file="indexinv.jsp"%>
<form  AUTOCOMPLETE = "off"   action="../SmartLoginAuth" method="post" name="frm" id="frm" onSubmit=" return valid()">

<script type="text/javascript"><!--

	var itemArray = new Array();
	var idrow=0;
	var deleteArray = new Array();
	var checkArray ;
	var drow=0;
	
	//totals,tax,salestax,nettotal, these controls are hidden
	function Load()
	{
		totals1.style.visibility="hidden";
		totaldiscount1.style.visibility="hidden";
		tax1.style.visibility="hidden";
		salestax1.style.visibility="hidden";
		salestaxamount1.style.visibility="hidden";
		nettotal1.style.visibility="hidden";
	}
	
	//Intialise the Variables
	var row =1;
 	var r =1;
	var v1="";
 	var v2="";
 	var v3="";
 	var v4="";
 	var v5="";
 	var v6="";
 	var v7="";
 	var v8="";
 	var v9="";
 
 	//Dynamically insert a row in a table  -- ITEM
	function insRow()
	{
		var x=document.getElementById('myTable').insertRow(row)
		var s0= "itype"+r;
		var s1= "item"+r;
		var s2 = "desc"+r;
		var s3 ="qty"+r;
		var s4 = "uprice"+r;
		var s5 = "discount"+r;
		var s6 = "unitdiscount"+r;
		var s7 = "total"+r;
		var s8 = "consumables"+r;
		
		var s9 = "stax"+r;
		var s10 = "staxpercentage"+r;
		var s11 = "staxamount"+r;
		var s13 = "warranty"+r;
		
		var div ="div"+r;
		
		 
		 
		 
		/*var vf1 = "onKeyPress=\"isNumberFloat('"+s3+"' )\"";
		var vf2 = "onKeyPress=\"isNumberFloat('"+s4+"' )\"";
		var vf3 = "onKeyPress=\"isNumberFloat('"+s5+"' )\"";
		var vf4 = "onKeyPress=\"isNumberFloat('"+s6+"' )\"";
		var vf5 = "onKeyPress=\"isNumberFloat('"+s7+"' )\"";
	 	*/
		
		var vf1 = "onKeyPress=\" return numeric_only(event,'"+s3+"','15') \"";
		var vf2 = "onKeyPress=\" return numeric_priceonly(event,'"+s4+"','15') \"";
		var vf3 = "onKeyPress=\" return numeric_only(event,'"+s5+"','15') \"";
		var vf4 = "onKeyPress=\" return numeric_only(event,'"+s6+"','15') \"";
		var vf5 = "onKeyPress=\" return numeric_only(event,'"+s7+"','15') \"";
		 
		  
		
		 x.insertCell(0).innerHTML="<select  class='formText135'  name='"+s0+"' id ='"+s0+"' onblur=selectLoaditemproduct(this,'"+div+"')><option  value='1'>I</option><option  value='2'>P</option></select>";
		 x.insertCell(1).innerHTML="<div id='"+div+"'></div>";
		
		 x.insertCell(2).innerHTML="<input type='text' size=10  title='Description' class='formText135'  name='"+s2+"' id ='"+s2+"' />";
		x.insertCell(3).innerHTML="<input type='text' size=10    onblur=\"calculateValue('"+s3+"')\" title='Quantity' class='formText135'  name='"+s3+"' id ='"+s3+"' " +vf1+" style='text-align:right' value='1'  maxlength='4' />";
		
		x.insertCell(4).innerHTML="<select class='formText135'   style='width:100'  name='"+s13+"' id ='"+s13+"'   ><%=warrantyinsert%></select>";
		
		x.insertCell(5).innerHTML="<input type='text' size=10    onblur=\"calculateValue('"+s3+"')\" title='Unit Price' class='formText135'  name='"+s4+"' id ='"+s4+"' " +vf2+"  style='text-align:right' value='0'  maxlength='15' />";
		
		x.insertCell(6).innerHTML="<input type='text' size=10    onblur=\"calculateDiscount('"+s3+"')\" title='Discount' class='formText135'  name='"+s5+"' id ='"+s5+"' " +vf3+"  style='text-align:right'  maxlength='3' />";
		
		x.insertCell(7).innerHTML="<input type='text' size=10    title='UnitDiscount' class='formText135'  name='"+s6+"' id ='"+s6+"' " +vf4+" readonly='readonly' style='text-align:right'  maxlength='3' />";
		
		x.insertCell(8).innerHTML="<select class='formText135'    style='width:100'  name='"+s9+"' id ='"+s9+"' onBlur=assignTaxValue('"+s9+"') ><%=optiontaxname%></select>";
		x.insertCell(9).innerHTML="<input type='text' size=10 class='formText135'  name='"+s10+"' id ='"+s10+"'  readonly='readonly' style='text-align:right' value='0'/>";
		x.insertCell(10).innerHTML="<input type='text' size=10 class='formText135'  name='"+s11+"' id ='"+s11+"'  readonly='readonly' style='text-align:right'/>";
		
		x.insertCell(11).innerHTML="<input type='text' size=10    title='Total' class='formText135'  name='"+s7+"' id ='"+s7+"' " +vf5+"   readonly='readonly' style='text-align:right'/> <input type='hidden' name='"+s8+"' id ='"+s8+"' />";
		
		x.insertCell(12).innerHTML="<input class='buttonbold'  type='button' value='Delete' onclick='deleteRow(this.parentNode.parentNode.rowIndex,"+r+")'>";
		itemArray[idrow] = r	;
		row = row+1;
		r = r+1;
		idrow=idrow+1;
	}
 
 
	//If any changes in Combobox then the corresponding values are assign to corresponding controls
	function assignValue(itm)
	{
  		var idname = itm.name;
  		//var idposition = (idname.substring(4,(idname.length-4)));
  		var idposition = idname.replace("item","");
 		var  itemid = itm.value;
 		for(i=0; i<cvalue1.length-1; i++)
 		{
   			var rowvalue = cvalue1[i].split(",")
			if(rowvalue[2]=== itemid)
   			{
   				document.getElementById('desc'+idposition).value = rowvalue[4];
   				document.getElementById('uprice'+idposition).value = rowvalue[7];
 				document.getElementById('total'+idposition).value = rowvalue[7];			
				totals1.style.visibility="visible";
				totaldiscount1.style.visibility="visible";
				tax1.style.visibility="visible";
				salestax1.style.visibility="visible";
				salestaxamount1.style.visibility="visible";
				nettotal1.style.visibility="visible";
				calculateTotal();
				document.getElementById('discount'+idposition).value = 0;
   				document.getElementById('unitdiscount'+idposition).value = 0;
   				document.getElementById('qty'+idposition).value = 1;
   			}	
 		}
		calculateTotal();
		assignGrandTotal();
 	}

	//Calculate Nettotal 
	function calculateTotal()
	{
		var tvs =0.0;
		display();
   		var svalue="";
   		for(u=0; u<checkArray.length-1;u++)
   			tvs= tvs+parseFloat(document.getElementById('total'+checkArray[u]).value);
		document.getElementById("totals").value=Round(tvs);	
		calculateBasevalue(); 	
	}

	//Calculate base Value
	function calculateBasevalue()
	{
		var tvs =0.0;
		display();
   		var svalue="";
   		for(u=0; u<checkArray.length-1;u++)
   			tvs= tvs+parseFloat(document.getElementById('uprice'+checkArray[u]).value * document.getElementById('qty'+checkArray[u]).value );
			
		document.getElementById("basevalue").value=Round(tvs);		
	}
	
	
	//Calculate Nettotal in Quantity Changes
	function calculateValue(ctr)
	{
		try
		{
			var quantity = document.getElementById(ctr).value;
			var idposition = ctr.replace("qty","");
			var productcode= parseInt(document.getElementById("item"+idposition).value);
			if(productcode != 0)
			{
				if(quantity>=1)
			 	{
					var uprice = parseFloat(document.getElementById("uprice"+idposition).value);
					var discount =parseFloat(document.getElementById("discount"+idposition).value);
					var udiscount = parseFloat(document.getElementById("unitdiscount"+idposition).value);
					var staxpercentage = parseFloat(document.getElementById("staxpercentage"+idposition).value);
					udiscount =(discount/100)*uprice;
					 
					document.getElementById("unitdiscount"+idposition).value = udiscount;
				
					uprice = uprice - udiscount;
					document.getElementById("staxamount"+idposition).value = Round((quantity*uprice) *parseFloat(staxpercentage) /100);
					var taxamount = Round((quantity*uprice) *parseFloat(staxpercentage) /100);
					var total =  Round((quantity*uprice) +taxamount);
					document.getElementById("total"+idposition).value = Round( total );
					calculateTotal();
					assignGrandTotal(); 
				 
				}
				else
				{
					alert("Quantity Should not be Zero");
					qty.focus();
				}
			}
			else
			{
				alert("Kindly Select the Product Code");
				
			}
		}
		catch(err)
		{
			alert(err);
		}	
			
	}

	 

   function calculateDiscount(ctr)
   {
   		try
		{
   			
			var position = ctr.replace("qty","");	
			var productcode= parseInt(document.getElementById("item"+position).value);
			if(productcode != 0)
			{
				var discount = document.getElementById('discount'+position).value;
				var uprice = document.getElementById('uprice'+position).value;
				var udiscount =(discount/100)*uprice;
				document.getElementById('unitdiscount'+position).value=udiscount;
				
				var quantity = document.getElementById('qty'+position).value;
				if(quantity>=1)
				{ 
					uprice = uprice - udiscount;
					var staxpercentage = parseFloat(document.getElementById("staxpercentage"+position).value);
					document.getElementById("staxamount"+position).value = Round((quantity*uprice) *parseFloat(staxpercentage) /100);
					var taxamount = Round((quantity*uprice) *parseFloat(staxpercentage) /100);
					var total =  Round((quantity*uprice) +taxamount);
					document.getElementById("total"+position).value = Round( total );
					calculateTotal();
					assignGrandTotal();
				}
				else
				{
					alert("Quantity Should not be Zero");
					ctr.focus();
				}
			}
			else
			{
				alert("Kindly Select the Product Code");
				
			}
		}
		catch(err)
		{
			alert(err);
		}
   }
	 

	//Delete Row
	function deleteRow(i,rx)
	{
		document.getElementById('myTable').deleteRow(i);
		row = row-1;
		if(row<=1)
			Load();
		deleteArray[drow] =rx;
		drow = drow+1;
		display();
		calculateTotal();
		assignGrandTotal();
	}

	//******************************
	function display()
	{
		var hs="";
		var hs1="";
		var hs2="";
		for(u=0; u<itemArray.length; u++)
			hs = hs+itemArray[u]+",";
		for(u=0; u<deleteArray.length; u++)
			hs1 = hs1+deleteArray[u]+",";
		var Array1 = hs.split(",");
		var Array2 = hs1.split(",");
		for(u=0; u<Array2.length; u++)
		{
			var a1value = Array2[u];
			for(v=0; v<Array1.length; v++)
			{
				if(Array2[u] == Array1[v])
					Array1[v]="";
			}
		}
		hs2="";
		for(v=0; v<Array1.length; v++)
			if(Array1[v]!="")
				hs2 = hs2 +	Array1[v]+",";
		checkArray = hs2.split(",");	
		document.getElementById('param').value=hs2;
		
		//alert("Added :: \n"+hs+"\n\n\n Deleted :: \n"+hs1+"\n\nChecked \n"+hs2);
	}
	//**********************************


	function paramAssign(svalue)
	{
		document.getElementById('param').value=svalue;
	}

	 
	
	function valid()
	{
   		try
		{
			prrequest = document.getElementById('prrequest').value;
		
			if( 
				checkNull("cashSaleNo","Enter Purchase Invoice Number")
				&& checkServerDateLock('serverdate','saleDate','serverdatelock')
				&&	checkNullSelect("vendorid","Select Vendor ","Select")
				&& 	checkNullSelect("payment","Select Payment ","Select")
				&& 	checkNullSelect("division","Select Division ","Select")
				//&& 	checkNullSelect("purchaserequest","Select purchaserequest ","0")
				)
				{
					if(prrequest == "Y")
							checkNullSelect("purchaserequest","Select purchaserequest ","0");
				}
				else
					return false;
				
		 
			display();
			if(parseInt(checkArray.length-1)<1)
			{
				alert("Please Add atleast one Item / Product");
				document.getElementById('buttonitemadd').focus();
				return false;
			}
			
			var svalue="";
			for(u=0; u<checkArray.length-1;u++)
				svalue =svalue+"itype"+checkArray[u]+","+"item"+checkArray[u]+","+"desc"+checkArray[u]+","+"qty"+checkArray[u]+","+"uprice"+checkArray[u]+","+"discount"+checkArray[u]+","+"unitdiscount"+checkArray[u]+","+"stax"+checkArray[u]+","+"total"+checkArray[u]+",";
			var s = "cashSaleNo,saleDate,vendorid,payment,division,";//purchaserequest,
			s = s+svalue+"totals,totaldiscount,tax,salestax,salestaxamount,nettotal,memo,ref,frieghtcharge,roundedoption,";
			var v = s.split(",");
			var flag =false;
			
			if(prrequest == "Y") {
				checkNullSelect("purchaserequest","Select purchaserequest ","0")
				proposedpurchasedatecheck()	
			}
			
			if( 
				checkNull("cashSaleNo","Enter Purchase Invoice Number")
				&& checkServerDateLock('serverdate','saleDate','serverdatelock')
				&&	checkNullSelect("vendorid","Select Vendor ","Select")
				&& 	checkNullSelect("payment","Select Payment ","Select")
				&& 	checkNullSelect("division","Select Division ","Select")
				//&& 	checkNullSelect("purchaserequest","Select purchaserequest ","0")
				//&& 	proposedpurchasedatecheck()	
				&& 	checkNull("memo","Enter the Desription.....")
				)
			{	
				
			
				for( i=0; i<v.length-1; i++)
				{
					
					var ck = "Enter Data..."+v[i];
					if(checkNull(v[i],ck))
						d=1;
					else
						return false;
						
				}
				return true;	
			}
			else
			{
				return false;
			}
			
		}
		catch(err)
		{
			alert(err);
		}
	}
<%
	String taxid[][] =  CommonFunctions.QueryExecute("Select INT_TAXID,CHR_TAXNAME,DOU_VALUE from inv_m_tax");
	String lvalue="";
	for(int x=0; x<taxid.length;x++)
	{
		for(int y=0; y<3;y++)
		{
			lvalue = lvalue+taxid[x][y]+",";
		}
		lvalue = lvalue+"~";	
	}
	%>

	var taxvalue = "<%=lvalue%>";
	var taxvalue1 =taxvalue.split("~");

	function assignTotals(taxs)
	{
		
		var taxid = taxs.value;
		var nettotal=0.0;
		for(i=0; i<taxvalue1.length-1; i++)
 		{
   			var rowvalue = taxvalue1[i].split(",")
   			if(rowvalue[0]=== taxid)
			{
				document.getElementById("salestax").value = rowvalue[2];
				assignGrandTotal(taxs);
				//nettotal = (parseFloat(rowvalue[2])/100 )*document.getElementById("totals").value;
				//document.getElementById("nettotal").value = parseFloat(document.getElementById("totals").value)+nettotal;
			}	
   		}
   		
	}
	
	function assignTaxValue(ctr)
	{
		
		var taxid = document.getElementById(ctr).value;
		if(taxid == "")
		{
			alert("Please Select Tax");
			setOptionValue(ctr,'0');
			//document.getElementById(ctr).focus();
		}
		else
		{		
			var idposition = ctr.replace("stax","");
			var productcode= parseInt(document.getElementById("item"+idposition).value);
			if(productcode != 0)
			{
				var qty = parseFloat(document.getElementById("qty"+idposition).value);
				var uprice = parseFloat(document.getElementById("uprice"+idposition).value);
				var discount =parseFloat(document.getElementById("discount"+idposition).value);
				var udiscount = parseFloat(document.getElementById("unitdiscount"+idposition).value);
				var total = parseFloat(document.getElementById("total"+idposition).value);
				uprice = uprice - udiscount;
				
				
				for(i=0; i<taxvalue1.length-1; i++)
				{
					var rowvalue = taxvalue1[i].split(",")
					if(rowvalue[0]=== taxid)
					{
						document.getElementById("staxpercentage"+idposition).value = rowvalue[2];
						document.getElementById("staxamount"+idposition).value = Round((qty*uprice) *parseFloat(rowvalue[2]) /100);
						
						var taxamount = Round((qty*uprice) *parseFloat(rowvalue[2]) /100);
						var total =  Round((qty*uprice) +taxamount);
						document.getElementById("total"+idposition).value = Round( total );
					}	
				}
				calculateTotal();
				assignGrandTotal();
			}
			else
			{
				alert("Kindly Select the Product Code");
			}
		}
	}
	
				
	
	function assignGrandTotal()
	{
		try {
		calculateTotal();
			
			var basevalue = parseFloat(document.getElementById("basevalue").value);
			var tot = parseFloat(document.getElementById("totals").value);
			var discount = parseFloat(document.getElementById("totaldiscount").value);
			var discountamount=0.0;
			if(discount>0)
				discountamount= (discount/100)*tot;
			else
				discountamount	=0.0;
				
			tot = tot-	discountamount;	
			

			//console.log(tot);

			var sstax=document.getElementById("salestax").value;
			if(sstax == "" )
				sstax=="0";
			var salestax = parseFloat(sstax);
			//console.log(tot);

			var salestaxamount=0.0;
			if(document.getElementById("basevaluecheck").checked)
				salestaxamount = parseFloat((salestax/100)*basevalue);
			else
				salestaxamount = parseFloat((salestax/100)*tot);
				
			//console.log(salestaxamount);
			document.getElementById("salestaxamount").value = salestaxamount.toFixed(2);
			var frieghtcharge = parseFloat(document.getElementById("frieghtcharge").value);
			tot = tot + frieghtcharge;
			document.getElementById("roundedoption").value= (Math.round(tot) - tot).toFixed(2);
			var roundedoption = parseFloat(document.getElementById("roundedoption").value);
			//console.log(roundedoption);
			var grandtotal = Round((tot+salestaxamount+roundedoption));
			//console.log(tot+"/"+salestaxamount+"/"+roundedoption);
			document.getElementById("nettotal").value=(grandtotal).toFixed(2);
		}
		catch(err) {
			console.log(err);
		}	
			 
		
	}




--></script>


<script language="javascript" src="../JavaScript/Inventory/PurchaseRequestDate.js"></script>
<script language="javascript" src="../JavaScript/Inventory/PurchaseRequestDetails.js"></script>



<div align="center"><br />
<table width="100%" border="0" cellspacing="1" cellpadding="1">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
		<table class="BackGround1" cellspacing="0" cellpadding="0" width="95%"
			align="center" border="0">
			<tbody>
				<tr>
					<td colspan="2" rowspan="2" valign="top"><img height="7"
						src="../Image/Smart Inventory/TLCorner.gif" width="7" /></td>
					<td class="BorderLine" height="0"><spacer height="1" width="1"
						type="block" /></td>
					<td colspan="2" rowspan="2" valign="top"><img height="7"
						src="../Image/Smart Inventory/TRCorner.gif" width="7" /></td>
				</tr>
				<tr>
					<td height="6"><spacer height="1" width="1" type="block" /></td>
				</tr>
				<tr>
					<td class="BorderLine" width="1"><spacer height="1" width="1"
						type="block" /></td>
					<td width="6"><spacer height="1" width="1" type="block" /></td>
					<td>
					<table width="100%" border="0" align="center" cellpadding="1"
						cellspacing="1">
						<tr>
							<td width="650"></td>
						</tr>
						<tr>
							<td>
							<div align="center"><strong>DIRECT PURCHASE ADD</strong></div>							</td>
						</tr>
						<tr>
							<td>
							<table width="100%" border="0" align="center" cellpadding="1"
								cellspacing="1">

								<tr>
									<td width="128" class="boldEleven">
								  <div align="left">Vendor Invoice No.<span class="boldred"> *</span></div>									</td>
									<td width="225" class="boldEleven">
<input tabindex="0" name="cashSaleNo" type="text" class="formText135" id="cashSaleNo"   onBlur="upperMe(this)"    												onKeyPress="" size="30" maxlength="30" /></td>
									<td width="121" class="boldEleven">Purchase Date<span class="boldred"> *</span></td>
								  <td width="420" class="boldEleven">
<input tabindex="2"		name="saleDate" type="text" class="formText135" id="saleDate" size="15" readonly /> 
 <script language='JavaScript'	type="text/javascript">
		<!--			
				 
				setCurrentDate('saleDate'); 
		//-->
</script></td>
								</tr>
								<tr>
									<td class="boldEleven">
									<div align="left">Vendor<span class="boldred"> *</span></div>									</td>
								  <td class="boldEleven">
									
									
<select name="vendorid" class="formText135" id="vendorid" tabindex="1" style="width:200" <%=PR%> >
<option value='Select'>Select</option>
<%
	String vendorids[][] =  CommonFunctions.QueryExecute("Select INT_VENDORID,CHR_VENDORNAME from  inv_m_vendorsinformation  ORDER BY CHR_VENDORNAME");
	for(int u=0; u<vendorids.length; u++)
		out.print("<option value='"+vendorids[u][0]+"'>"+vendorids[u][1] +"</option>");//+" / "+vendorids[u][0]
%>
</select>
<input name="gststateid" type="hidden" id="gststateid"></td>
									<td class="boldEleven">Payment Terms<span class="boldred"> *</span></td>
									<td class="boldEleven">
<select name="payment" class="formText135" id="payment" tabindex="3" style="width:200">
<option value='Select'>Select</option>
<%
	String paymentids[][] = CommonFunctions.QueryExecute("Select INT_PAYMENTTERMID,CHR_PAYMENTNAME from inv_m_paymentterms");
	for(int u=0; u<paymentids.length; u++)
		out.print("<option value='"+paymentids[u][0]+"'>"+paymentids[u][1]+"</option>");
%>
</select>									</td>
								</tr>
								 
								<tr>
									<td valign="top" class="boldEleven">Division <span class="boldred">*</span></td>
									<td class="boldEleven"><select name="division"	class="formText135" id="division" tabindex="1" style="width:200">
                                      <option value='Select'>Select</option>
                                      <%
	String division[][] =  CommonFunctions.QueryExecute("Select INT_DIVIID,CHR_DIVICODE from inv_m_division   WHERE INT_DIVIID >0 AND CHR_OFFICEIDS LIKE '%"+session.getAttribute("INVOFFICEID")+"%'  ORDER BY CHR_DIVICODE,CHR_DEFAULT"); 
	for(int u=0; u<division.length; u++)
		out.print("<option value='"+division[u][0]+"'>"+division[u][1]  +"</option>");
%>
                                    </select><script>setOptionValue('division',"<%=division[0][0]%>");</script></td>
									<td class="boldEleven">Purchase Request</td>
								    <td class="boldEleven">
<select name="purchaserequest" class="formText135" id="purchaserequest" onChange="loadPurchaseRequestDetails()" style="width:200" >
<option value="WITHOUTPR">Select Purchase Request </option> 
 <%
								
/*String PRequestDatat[][] =  CommonFunctions.QueryExecute("SELECT  a.CHR_POREQUESTNO,FIND_A_CUSTOMER_NAME(a.INT_CUSTOMERID) FROM inv_t_purchaserequest a  WHERE a.CHR_CLOSEDSTATUS='Y' AND a.CHR_PR_PARTIALLY_RECEIVED !='Y'  AND    a.INT_BRANCHID="+session.getAttribute("INVBRANCH") +"  GROUP BY a.CHR_POREQUESTNO  ORDER BY FIND_A_CUSTOMER_NAME(a.INT_CUSTOMERID)");
for(int u=0; u<PRequestDatat.length; u++)
	out.print("<option value='"+PRequestDatat[u][0]+"'>"+PRequestDatat[u][0] +" --  for "+ PRequestDatat[u][1]+"</option>");*/
%>
								    </select>
									<input name="proposedpurchasedate" type="hidden" id="proposedpurchasedate" value=""> 
									
									
									<script language="javascript">setCurrentDate('proposedpurchasedate'); </script>									
									
									If Partially Received then click<input name="partialreceived" type="checkbox" id="partialreceived" value="Y" checked> </td>
								</tr>
								<tr>
								  <td valign="top" class="boldEleven">&nbsp;</td>
								  <td class="boldEleven">&nbsp;</td>
								  <td class="boldEleven">&nbsp;</td>
								  <td class="boldEleven">&nbsp;</td>
							  </tr>
								
							  
								<tr>
								  <td colspan="4" valign="top" class="boldEleven"><div id="datecheck"></div></td>
							  </tr>
							</table>							</td>
						</tr>
						<tr>
							<td height="9">
							<div id="divscroll"  style="OVERFLOW:auto;width:auto;height:auto">
							<table id="myTable" width="100%" border="1" cellpadding="1"
								cellspacing="1">

								<th class="boldEleven">
								<div align="left"><strong>Type</strong></div>								</th>
								<th class="boldEleven"><b>Item</b></th>
								<th class="boldEleven"><b>Description</b></th>
								<th class="boldEleven"><b>Quantity/Unit</b></th>
								<th class="boldEleven"><b>Warranty</b></th>
								<th class="boldEleven"><b>Unit Price</b></th>
								<th class="boldEleven"><b>Discount(%)</b></th>
								<th class="boldEleven"><b>Unit Discount</b></th>
								
								<th class="boldEleven"><b>Tax</b></th>
								<th class="boldEleven"><b>Tax (%)</b></th>
								<th class="boldEleven"><b>Tax Amount </b></th>
								<th class="boldEleven"><b>Total</b></th>
								<th class="boldEleven">&nbsp;</th>
							</table>
							</div>							</td>
						</tr>
						<tr>
							<td>
<div align="left" >
<script language="javascript">
function insRowcheck()
{
	try
	{
		prrequest = document.getElementById('prrequest').value;
		if(prrequest == "Y") 
		{
			if(
				checkNullSelect("vendorid","Select Vendor",'Select')
				&& checkNullSelect("purchaserequest","Select purchase request",'0')
			   )
					insRow();
		}
		else
		{
			insRow();
		}
	}
	catch(err)
	{
		alert(err);
	}
}
</script>
<input type="button" class="tMLAscreenHead" onClick="insRowcheck()"  value="Add"   accesskey="s"   id="buttonitemadd" tabindex="8">
</div>							</td>
						</tr>
						<tr>
							<td></td>
						</tr> 
						
						<tr>
								  <td colspan="4" valign="top" class="boldEleven"><div id="prdetails" style="OVERFLOW:auto;width:100%;height:300px"  ></div></td>
							  </tr>
							  
						<tr>
						  <td valign="top" class="boldEleven"><table width="100%" border="0" cellspacing="2">
                            <tr>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                            </tr>
                          </table></td>
					  </tr>
						<tr>
							<td valign="top" class="boldEleven">
							<table width="100%" border="0" align="center" cellpadding="1"
								cellspacing="1">
                                
                                
                                
                                <tr>
								  <td class="boldEleven">Base Value </td>
								  <td colspan="2" class="boldEleven"><input tabindex="11" name="basevalue"
										onKeyPress="numericValue('basevalue','12')" type="text"
										class="formText135" id="basevalue" readonly ='readonly' 
										style='text-align:right' /></td>
								  <td class="boldEleven">&nbsp;</td>
								  <td colspan="2" class="boldEleven">&nbsp;</td>
								  <td class="boldEleven" id="nettotal1">&nbsp;</td>
							  </tr>
                                
							    
							    <tr>
							      <td width="273" rowspan="3" valign="top" class="boldEleven"><div align="left">Description <span class="boldred">*</span></div></td>
							      <td width="249" rowspan="3" valign="top" class="boldEleven"><textarea name="memo" cols="35"
										rows="5" class="formText135" id="memo" onKeyUp="textArea('memo','200')" tabindex="9">Inward</textarea></td>
							      <td width="282" rowspan="3" valign="bottom" class="boldEleven">
								  
								  <%--<table border="0" align="right">
						            <tr class="boldEleven">
							            <td width="89%" align="right" class="boldEleven">Tax calculated from Base value                                        </td>
							            <td width="11%"><input  class="formText135" name="basevaluecheck" type="checkbox" id="basevaluecheck" value="Y" onClick="assignGrandTotal()"></td>
					                </tr>
					              </table>--%>
								  <input type="hidden" name="basevaluecheck" id="basevaluecheck" value="Y" />								  </td>
							      <td width="92" valign="top" class="boldEleven">&nbsp;</td>
									<td width="3" valign="top" class="boldEleven">&nbsp;</td>
									<td width="281" valign="top" class="boldEleven"><div align="left">Total</div></td>
									<td width="253" valign="top" class="boldEleven" id="totals1">

									<div align="left"><input tabindex="11" name="totals"
										onKeyPress="numericValue('totals','12')" type="text"
										class="formText135" id="totals" readonly
										style='text-align:right' /></div>									</td>
								</tr>
								<tr>
								  <td valign="top" class="boldEleven">&nbsp;</td>
								  <td colspan="2" valign="top" class="boldEleven">
									<%--<div align="left">Total Discount (%)<span class="boldred"> *</span></div>--%>									</td>
									<td width="253" valign="top" class="boldEleven"
										id="totaldiscount1">
									<%-- <div align="left"><input
										name="totaldiscount" type="text" class="formText135"
										id="totaldiscount"
										style='text-align:right' tabindex="12" onBlur="assignGrandTotal()"
										  value="0" maxlength="8">
								  
								  <!--<input name="tax" type="hidden" id="tax" value="0" />
								  <input name="salestax" type="hidden" id="salestax" value="0" />
								  <input name="salestaxamount" type="hidden" id="salestaxamount" value="0" />
								  -->
								  </div>--%>
								  
								 <input type="hidden" name="totaldiscount" id="totaldiscount" value="0" />								  									</td>
								</tr>
								<tr>
								  <td valign="top" class="boldEleven">&nbsp;</td>
								  <td colspan="2" valign="top" class="boldEleven">
									<%--<div align="left">Tax Group<span class="boldred"> *</span></div>--%>									</td>
									<td width="253" valign="top" class="boldEleven" id="tax1">
									 <%--<div align="left"><select name="tax" class="formText135"
										id="tax" onChange="assignTotals(this)" tabindex="13" style="width:100">
										 
										<%=optiontaxname%>
									</select>
									</div> --%>	
									<input type="hidden" name="tax" id="tax" value="1" />								  </td>
								</tr>
								<tr>
									<td rowspan="4" align="left" valign="top" class="boldEleven">
									<div align="left">Reference<span class="boldred"> *</span> 
									  <input name="filename"
										type="hidden" value="DirectPurchase" /> <input name="actionS"
										type="hidden" value="INVDirectPurchaseAdd" /> <input
										name="param" type="hidden" id="param" value='0,'>
										
									  <%
									  	String dateCheckData[][] =  CommonFunctions.QueryExecute("SELECT DATE_FORMAT(now(),'%d-%m-%Y'),DAT_LOCK,MONTHNAME(NOW()),MONTH(NOW()),YEAR(NOW()) FROM m_institution  WHERE INT_ID=1");
									  %>
									  <input name="serverdate" type="hidden" id="serverdate" value="<%=dateCheckData[0][0]%>" />
									  <input name="serverdatelock" type="hidden" id="serverdatelock" value="<%=dateCheckData[0][1]%>" />
									  <input name="prrequest" type="hidden" id="prrequest" value="<%=prrequest%>" />
								    </div>									</td>
                                    <td colspan="2" rowspan="4" valign="top" class="boldEleven">
									<div align="left"> 
										
										<select name="ref" id="ref"
										class="formText135" size="5" style="width:200">
										<jsp:include page="Staffload.jsp" flush="true" />
									</select>
								    </div>									</td>
                                    <td valign="top" class="boldEleven">&nbsp;</td>
                                    <td colspan="2" valign="top" class="boldEleven">
									<%--<div align="left">Sales Tax (%)</div>--%>									</td>
									<td width="253" valign="top" class="boldEleven" id="salestax1">
									 <%--<div align="left"><input name="salestax" value="0"
										type="text" class="formText135" id="salestax"
										readonly="readonly" tabindex="14" style='text-align:right' />
									</div> --%>
									<input type="hidden" name="salestax" id="salestax" value="0" />																		</td>
								</tr>
								<tr>
								  <td class="boldEleven">&nbsp;</td>
									<td colspan="2" class="boldEleven">
									<%--<div align="left">Sales Tax Amount</div>--%>									</td>
									<td class="boldEleven" id="salestaxamount1">
									<%-- <div align="left"><input name="salestaxamount" value="0"
										type="text" class="formText135" id="salestaxamount"
										readonly="readonly" tabindex="14" style='text-align:right' />
									</div> --%>
									<input type="hidden" name="salestaxamount" id="salestaxamount" value="0" />																		</td>
								</tr>
								<tr>
								  <td class="boldEleven">&nbsp;</td>
								  <td class="boldEleven">&nbsp;</td>
								  <td class="boldEleven">Frieght charge
                                    <input name="frieghtamount" type="text"
										class="formText135" id="frieghtamount"
										style='text-align:right' title="Fright Charge"  onBlur="calculateFrieght()" onKeyPress="return numeric_priceonly(event,'frieghtamount','7') " value="0" size="10" maxlength="6" />&nbsp;&nbsp;&nbsp;&nbsp;<input name="frieghttax" type="text"
										class="formText135" id="frieghttax"
										style='text-align:right'   title="Fright Charge %"    onBlur="calculateFrieght()" onKeyPress="return numeric_priceonly(event,'frieghttax','7') " value="0" size="10" maxlength="6" />&nbsp;(%)&nbsp;&nbsp;
									
									<script language="javascript">
										function calculateFrieght(){
												try
												{
													var frieghtamount = parseFloat(document.getElementById("frieghtamount").value);
													var frieghttax = parseFloat(document.getElementById("frieghttax").value);
													var value =0;
													value = parseFloat(frieghtamount * (frieghttax/100));
													value = parseFloat(value + frieghtamount); 
													document.getElementById("frieghtcharge").value = value;
													assignGrandTotal();
												}
												catch(err)
												{
													alert(err);
												}
										
										}
									
									</script>
									</td>
								  <td class="boldEleven" id="roundedoption1"><input name="frieghtcharge" type="text"
										class="formText135" id="frieghtcharge" readonly
										style='text-align:right' tabindex="15"  onBlur="assignGrandTotal()" onKeyPress="return numeric_priceonly(event,'frieghtcharge','7') " value="0" maxlength="6" /></td>
							  </tr>
								<tr>
								  <td class="boldEleven">&nbsp;</td>
								  <td class="boldEleven">&nbsp;</td> 
								  <td class="boldEleven">Rounded <span class="boldred"> *</span></td>
								  <td class="boldEleven" id="roundedoption1"><input name="roundedoption" type="text"
										class="formText135" id="roundedoption"
										style='text-align:right' tabindex="15"  onBlur="assignGrandTotal()" onKeyPress="return numeric_priceonly(event,'roundedoption','12') " value="0" maxlength="5" /></td>
							  </tr>
								<tr>
									<td class="boldEleven">
									<div align="left"></div>									</td>
									<td colspan="2" class="boldEleven">
									<div align="left"></div>									</td>
									<td class="boldEleven">&nbsp;</td>
									<td class="boldEleven">&nbsp;</td>
									<td class="boldEleven"><div align="left">Net Total</div></td>
									<td class="boldEleven" id="nettotal1" >
									<div align="left"><input name="nettotal" type="text"
										class="formText135" id="nettotal" tabindex="15" value="0"
										style='text-align:right' /></div>									</td>
								</tr>
								<tr>
									<td colspan="7" class="boldEleven">
									<div align="center"><input name="Submit" type="submit"
										class="tMLAscreenHead"  value="Add"   accesskey="s"    />
									&nbsp;&nbsp; <input name="Submit2" type="button"
										class="tMLAscreenHead" value="  Close  "
										onClick="redirect('Direct Purchase.jsp')" /></div>
									<div align="center"></div>
									<div align="left"></div>
									<div align="left"></div>									</td>
								</tr>
							</table>							</td>
						</tr>
					</table>
					</td>
					<td nowrap="nowrap" width="4"><spacer height="1" width="1"
						type="block" /></td>
					<td class="BorderLine" width="1"><spacer height="1" width="1"
						type="block" /></td>
				</tr>
				<tr>
					<td colspan="2" rowspan="2"><img height="7"
						src="../Image/Smart Inventory/BLCorner.gif" width="7" /></td>
					<td height="6"><spacer height="1" width="1" type="block" /></td>
					<td colspan="2" rowspan="2"><img height="7"
						src="../Image/Smart Inventory/BRCorner.gif" width="7" /></td>
				</tr>
				<tr>
					<td class="BorderLine" height="0"><spacer height="1" width="1"
						type="block" /></td>
				</tr>
			</tbody>
		</table>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
</div>
 </form>

<script language="javascript">

function proposedpurchasedatecheck()
{
	try
	{
		 
		if(  checkNullSelect("purchaserequest","Select Purchase Request Number",'0')   ) 
			return DateComparision ("proposedpurchasedate","saleDate", "Kindly check your purchase and proposed purchase date....")
		else
			return false;
	}
	catch(err)
	{
		alert(err);
	}
}


</script>

<%@ include file="../footer.jsp"%>
<%
 }
 catch(Exception e)
 {
 	out.println(e.getMessage());
	System.out.println(e.getMessage());
 }
%>
</body>
</html>
