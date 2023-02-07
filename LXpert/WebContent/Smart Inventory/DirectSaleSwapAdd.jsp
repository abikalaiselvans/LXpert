<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" errorPage="../error/index.jsp"%>
<%
	try
	{
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:: INVENTORY ::</title><%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="javascript" src="../JavaScript/calendar1.js"></script>
<script language="JavaScript"
	src="../JavaScript/Inventory/InvenCustomerAJAX.js"></script>
<script language="javascript" src="../JavaScript/Inventory/InvenAJAX.js"></script>
<script language="javascript"
	src="../JavaScript/Inventory/InventAJAX.js"></script>


<script type="text/javascript">
var divi="";
function Loaditemproduct(ctr,div) 
{
	var url = "../inventory?actionS=INVItemProduct&id="+escape(ctr.value) ;
	divi = div;
	initRequest(url);
	req.onreadystatechange = itemproductRequest;
    req.open("GET", url, true);
    req.send(null);
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
	var batchs = req.responseXML.getElementsByTagName("items")[0];   
   	var idposition = divi.replace("div","");
	s1 ='item'+idposition;
	var str="<select name='"+s1+"'  id='"+s1+"' size='1' class='formText135' onblur=\"assignValues(this,'"+idposition+"')\">"; 
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
	var batchs = req.responseXML.getElementsByTagName("Assigns")[0];   
   	var idposition = divi.replace("div","");
	s1 ='item'+idposition;
	for(loop = 0; loop < batchs.childNodes.length; loop++) 
    {
	    	var batch = batchs.childNodes[loop];
	    	Desc= batch.getElementsByTagName("Desc")[0];
	    	Price= batch.getElementsByTagName("Price")[0];
			Stock= batch.getElementsByTagName("Stock")[0];
			Ptype= batch.getElementsByTagName("Ptype")[0];
			Plist= batch.getElementsByTagName("Plist")[0];
			document.getElementById("desc"+idposition).value = Desc.childNodes[0].nodeValue;
			document.getElementById("stock"+idposition).value = Stock.childNodes[0].nodeValue;
			document.getElementById("qty"+idposition).value = "";
			document.getElementById("uprice"+idposition).value = Price.childNodes[0].nodeValue;
			document.getElementById("discount"+idposition).value ="0";
			document.getElementById("unitdiscount"+idposition).value = "0";
			if(Ptype.childNodes[0].nodeValue == "C" )
			{
				document.getElementById("pitemlist"+idposition).value=Plist.childNodes[0].nodeValue;
				var tb=document.getElementById("swap"+idposition);
  				tb.innerHTML="<input onclick=\"assignSwap(this,"+idposition+")\" name='\"Swap\"+idposition' type='button'  value='Swap' class='buttonbold'/> ";
				var tb1=document.getElementById("SwapCheck"+idposition);
				tb1.innerHTML="<input  id='\"SwapCheckbox\""+idposition+"' name='\"SwapCheckbox\""+idposition+"' type='checkbox'  checked='checked'  />";
			}
			else
			{
				var tb=document.getElementById("swap"+idposition);
  				tb.innerHTML=""  ;
				var tb1=document.getElementById("SwapCheck"+idposition);
  				tb1.innerHTML=""  ;
			}
			
			totals1.style.visibility="visible";
			totaldiscount1.style.visibility="visible";
			tax1.style.visibility="visible";
			salestax1.style.visibility="visible";
			salestaxamount1.style.visibility="visible";
			nettotal1.style.visibility="visible";
			calculateTotal();
   }
   calculateTotal();
   assignGrandTotal();
    
 }
 
 
 
 
 function assignSwap(ctr,pitemlist)
 {
 	var p= "pitemlist"+pitemlist;
	p=document.getElementById(p).value;
	var sw="<center><table width='100%' class='MRow1'  cellspacing=2 cellpadding=2 border=0 ><tr><td class='bold1'>S.No<td class='bold1'>Items";
	//sw = sw+"<td class='bold1'>Change<td class='bold1'>Change Item";
	var itemname =p.split("~");
	for(x=0;x<itemname.length-1;x++)
	{
		var xitem = itemname[x].split("/");
		sw = sw +"<tr><td class='boldEleven'>"+(x+1)+"<td class='boldEleven'>"+xitem[0]+"<br>";
		/*sw = sw +"<td class='boldEleven'><input name='Check'"+(x+1)+" checked='checked' type='checkbox' />";
		sw = sw +"<td class='boldEleven'><Select class='boldEleven'  name='Cserial'"+(x+1)+"  id='Cserial'"+(x+1)+" >";
		<%
			String query = "SELECT CHR_ITEMID,CHR_ITEMNAME FROM inv_m_item";
			String idata[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(query);
			String sh="";
			for(int a=0;a<idata.length;a++)
			{
				sh="'"+idata[a][1] +"'";
			%>
			if(parseInt(xitem[1]) == "<%=Integer.parseInt(idata[a][0].trim())%>")
			{
				//sw = sw+"<option selected='selected' value='<%=idata[a][0]%>' >" +<%=sh%>+"</option>";
			}
			else
			{
				//sw = sw+"<option  value='<%=idata[a][0]%>' >" +<%=sh%>+"</option>";
			}	
			<%
			}	 
			
		%>
		sw = sw +"</select>"; */
	}
	sw = sw +"</table><center>";	
	
	var tb2=document.getElementById("productlist" );
  	tb2.innerHTML=  sw;
 }
</script>
</head>
<body    onLoad="loadCustomer()">
<%@ include file="indexinv.jsp"%>
<form  AUTOCOMPLETE = "off"   action="" method="post" name="frm" id="frm"><script
	type="text/javascript"><!--

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
	
	//insert swap div
	function insSwapRow(row)
	{
		var x=document.getElementById('swapTable').insertRow(row);
		x.insertCell(9).innerHTML="<div id='SwapCheck'"+row+"></div>";
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
		var s8 = "stock"+r;
		var div ="div"+r;
		var swap ="swap"+r;
		var SwapCheck ="SwapCheck"+r;
		var pitemlist ="pitemlist"+r; 
		var vf1 = "onKeyPress=\"numericValue('"+s3+"','3')\"";
		var vf2 = "onKeyPress=\"doubleValue('"+s4+"','9')\"";
		var vf3 = "onKeyPress=\"doubleValue('"+s5+"','3')\"";
		var vf4 = "onKeyPress=\"doubleValue('"+s6+"','3')\"";
		var vf5 = "onKeyPress=\"doubleValue('"+s7+"','10')\"";
	 	 
		 x.insertCell(0).innerHTML="<select  class='formText135'  name='"+s0+"' id ='"+s0+"' onblur=Loaditemproduct(this,'"+div+"')> <option  value='1'>I</option><option  value='2'>P</option></select>";
		 x.insertCell(1).innerHTML="<div id='"+div+"'></div>";
		
		 x.insertCell(2).innerHTML="<input type='text' size=10  title='Description' class='formText135'  name='"+s2+"' id ='"+s2+"' />";
		 x.insertCell(3).innerHTML="<input type='text' class='formText135' readonly='readonly' size=2  name='"+s8+"' id ='"+s8+"' value='0'/>";
		 
		x.insertCell(4).innerHTML="<input type='text' size=10    onblur='calculateValue(this)' title='Quantity' class='formText135'  name='"+s3+"' id ='"+s3+"' " +vf1 +" style='text-align:right'/>";
		
		x.insertCell(5).innerHTML="<input type='text' size=10    onblur='calculatePrice(this)' title='Unit Price' class='formText135'  name='"+s4+"' id ='"+s4+"' " +vf2+"  style='text-align:right'/>";
		x.insertCell(6).innerHTML="<input type='text' size=10    onblur='calculateDiscount(this)' title='Discount' class='formText135'  name='"+s5+"' id ='"+s5+"' " +vf3+"  style='text-align:right'/>";
		x.insertCell(7).innerHTML="<input type='text' size=10    title='UnitDiscount' class='formText135'  name='"+s6+"' id ='"+s6+"' " +vf4+" readonly='readonly' style='text-align:right'/>";
		x.insertCell(8).innerHTML="<input type='text' size=10    title='Total' class='formText135'  name='"+s7+"' id ='"+s7+"' " +vf5+"   readonly='readonly' style='text-align:right'/>";
		x.insertCell(9).innerHTML="<div id='"+SwapCheck+"'></div>";
		x.insertCell(10).innerHTML="<div id='"+swap+"'></div>";
		x.insertCell(11).innerHTML="<input type=hidden name='"+pitemlist+"' id='"+pitemlist+"' value='0'>";
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
		document.getElementById("totals").value=tvs;		
	}

	//Calculate Nettotal in Quantity Changes
	function calculateValue(qty)
	{
  		var qtyposition = (qty.name.replace("qty",""));	
		var stock =document.getElementById('stock'+qtyposition).value;
		var quantity = qty.value;
		if(parseInt(quantity)<1)
		{
			alert("Quantity Not Zero... ");
			document.getElementById('Submit').disabled=true;
			document.getElementById('stock'+qtyposition).focus();
			
		}
		else if(parseInt(quantity) > parseInt(stock))
		{
			alert("Stock Error... ");
			document.getElementById('Submit').disabled=true;
			document.getElementById('stock'+qtyposition).focus();
		}
		else 
		{
			document.getElementById('Submit').disabled=false;
			var uprice = document.getElementById('uprice'+qtyposition).value;
			var discount =document.getElementById('discount'+qtyposition).value;
			var udiscount = document.getElementById('unitdiscount'+qtyposition).value;
			udiscount =(discount/100)*uprice;
			var total = ((quantity * uprice) - (udiscount*quantity));
			document.getElementById('total'+qtyposition).value = total;
			calculateTotal();
			assignGrandTotal();
			var stname = document.getElementById('item'+qtyposition).value;
			var stqty = document.getElementById('qty'+qtyposition).value;
		}
	}

	//Calculate Nettotal in Price Changes
	function calculatePrice(pre)
	{
  		var priceposition = (pre.name.replace("uprice",""));
  		var price = pre.value;
  		var quantity = document.getElementById('qty'+priceposition).value;
  		var discount =document.getElementById('discount'+priceposition).value;
  		document.getElementById('unitdiscount'+priceposition).value = (discount/100)*price;
  		var udiscount =(discount/100)*price;
  		var total = ((quantity * price) - (udiscount*quantity));
  		document.getElementById('total'+priceposition).value =total;
  		calculateTotal();
  		assignGrandTotal();
	}

	//Calculate Nettotal in Discount Changes
	function calculateDiscount(desc)
	{
 		var descposition = (desc.name.replace("discount",""));
  		var discount = desc.value;
  		var quantity = document.getElementById('qty'+descposition).value;
  		var price = document.getElementById('uprice'+descposition).value;
  		var udiscount =(discount/100)*price;
  		document.getElementById('unitdiscount'+descposition).value = udiscount;
  		udiscount = document.getElementById('unitdiscount'+descposition).value;
  		var total = ((quantity * price) - (udiscount*quantity));
  		document.getElementById('total'+descposition).value = total;
  		calculateTotal();
  		assignGrandTotal();
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
   		display();
		if(parseInt(checkArray.length-1)<1)
		{
			alert("Please Add atleast one item...");
			document.getElementById('buttonitemadd').focus();
			return false;
		}
		var svalue="";
		for(u=0; u<checkArray.length-1;u++)
			if(parseInt(document.getElementById("stock"+checkArray[u]).value)<1)
				document.getElementById('Submit').disabled=true;
			
			
   		svalue="";
   		for(u=0; u<checkArray.length-1;u++)
   			svalue =svalue+"item"+checkArray[u]+","+"qty"+checkArray[u]+","+"uprice"+checkArray[u]+","+"discount"+checkArray[u]+","+"unitdiscount"+checkArray[u]+","+"total"+checkArray[u]+",";
		var s = "cashSaleNo,saleDate,customerId,payment,";
   		s = s+svalue+" totals,totaldiscount,tax,salestax,salestaxamount,nettotal,";
		var v = s.split(",");
		var flag =false;
		for( i=0; i<v.length-1; i++)
		{
			var chk =document.getElementById(v[i]).value;
			var ck = "Enter Data..."+v[i];
			if(checkNull(v[i],ck))
			{
				d=1;
			}
			else
			{
				return false;				
			}	
		}
	}
<%
	String taxid[][] = com.my.org.erp.common.CommonFunctions.QueryExecute("Select INT_TAXID,CHR_TAXNAME,DOU_VALUE from inv_m_tax");
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
	
	function assignGrandTotal()
	{
		calculateTotal();
		var tot = parseFloat(document.getElementById("totals").value);
		var discount = parseFloat(document.getElementById("totaldiscount").value);
		var discountamount=0.0;
		if(discount>0)
			discountamount= (discount/100)*tot;
		else
			discountamount	=0.0;
		var salestax = parseFloat(document.getElementById("salestax").value);
		var salestaxamount = parseFloat((salestax/100)*tot);
		document.getElementById("salestaxamount").value = salestaxamount;
		
		var grandtotal = (tot+salestaxamount);
		document.getElementById("nettotal").value=Math.round((grandtotal-discountamount));
		
	}
	
	
	 
--></script>
<div align="center"><br />
<table width="100%" border="0" cellspacing="1" cellpadding="1">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
		<table class="BackGround1" cellspacing="0" cellpadding="0" width="424"
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
					<td width="412">
					<table width="850" border="0" align="center" cellpadding="1"
						cellspacing="1">
						<tr>
							<td width="650"></td>
						</tr>
						<tr>
							<td>
							<div align="center"><strong>Direct Sale Swap Add </strong></div>
							</td>
						</tr>
						<tr>
							<td>
							<table width="673" border="0" align="center" cellpadding="1"
								cellspacing="1">
								<tr>
									<td width="123" class="boldEleven">
									<div align="left">Direct Sale No.</div>
									</td>
									<td width="229" class="boldEleven">
									<div align="left">
									<table>
										<tr>
											<td><input tabindex="0" name="cashSaleNo" type="text"
												class="formText135" id="cashSaleNo"
												onkeyup="upperMe(this), CheckUniqueNO(this,'soValid','inv_t_directpurchase','CHR_PURCHASEORDERNO')"
												onKeyPress="" size="30" maxlength="11" /></td>
											<td>
											<div id=soValid></div>
											</td>
									</table>

									</div>
									</td>
									<td width="107" class="boldEleven">Sale Date</td>
									<td width="201" class="boldEleven"><input tabindex="2"
										name="saleDate" type="text" class="formText135" id="saleDate"
										size="15" readonly="readonly" /> <a
										href="javascript:cal2.popup();"> <img
										src="../JavaScript/img/cal.gif" width="16" height="16"
										border="0" /> </a> <script language='JavaScript'
										type="text/javascript">
		<!--			
				var cal2 = new calendar1(document.forms['frm'].elements['saleDate']);
				cal2.year_scroll = true;
				cal2.time_comp = false;
				setCurrentDate('saleDate'); 
		//-->
                          </script></td>
								</tr>
								<tr>
									<td class="boldEleven">
									<div align="left">CustomerName</div>
									</td>
									<td class="boldEleven"><input name="txtSer" id="txtSer"
										type="text" class="formText135" size="7"
										onKeyUp="loadCustomer()"> <select name="customerId"
										id="customerId" class="formText135" style="width: 150px">
									</select></td>
									<td class="boldEleven">Payment Terms</td>
									<td class="boldEleven"><select name="payment"
										class="formText135" id="payment" tabindex="3">
										<option>Select</option>
										<%
								String paymentids[][] = com.my.org.erp.common.CommonFunctions.QueryExecute("Select INT_PAYMENTTERMID,CHR_PAYMENTNAME from inv_m_paymentterms");
								for(int u=0; u<paymentids.length; u++)
									out.print("<option value='"+paymentids[u][0]+"'>"+paymentids[u][1]+"</option>");
							%>
									</select></td>
								</tr>
								<tr>
									<td valign="top" class="boldEleven">&nbsp;</td>
									<td class="boldEleven">&nbsp;</td>
									<td class="boldEleven">&nbsp;</td>
									<td class="boldEleven">&nbsp;</td>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td height="9">
							<div id="divscroll" style="OVERFLOW:auto;width:100%;height:150px">
							<table width="100%" border="0" cellpadding="1" cellspacing="1"
								id="myTable">
								<tr>
									<th class="boldEleven">
									<div align="left"><strong>Type</strong></div>
									</th>
									<th class="boldEleven"><b>Item</b></th>
									<th class="boldEleven"><b>Description</b></th>
									<th class="boldEleven"><strong>Stock </strong></th>
									<th class="boldEleven"><b>Quantity</b></th>
									<th class="boldEleven"><b>Unit Price</b></th>
									<th class="boldEleven"><b>Discount(%)</b></th>
									<th class="boldEleven"><b>Unit Discount</b></th>
									<th class="boldEleven"><b>Total</b></th>
									<th class="boldEleven"><b>Swap</b></th>
									<th class="boldEleven">&nbsp;</th>
									<th class="boldEleven">&nbsp;</th>
								</tr>
							</table>
							</div>
							</td>
						</tr>
						<tr>
							<td>
							<div align="left"><input id="buttonitemadd" type="button"
								class="tMLAscreenHead" onClick="insRow()" value="Add"
								tabindex="8"></div>
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td valign="top" class="boldEleven">
							<table width="100%" border="0" cellpadding="1" cellspacing="1"
								id="swapTable">
								<tr>
									<td></td>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td valign="top" class="boldEleven">
							<div id="productlist"></div>
							</td>
						</tr>
						<tr>
							<td valign="top" class="boldEleven">
							<table width="850" border="0" align="center" cellpadding="1"
								cellspacing="1">
								<tr>
									<td width="114" rowspan="4" valign="top" class="boldEleven">
									<div align="left">Memo</div>
									</td>
									<td width="197" rowspan="4" valign="top" class="boldEleven">
									<div align="left"><textarea name="memo" cols="25"
										rows="5" class="formText135" id="memo" tabindex="9"></textarea>
									</div>
									</td>
									<td width="107" valign="top" class="boldEleven">
									<div align="left">Total</div>
									</td>
									<td width="169" valign="top" class="boldEleven" id="totals1">

									<div align="left"><input tabindex="11" name="totals"
										onKeyPress="numericValue('totals','12')" type="text"
										class="formText135" id="totals" readonly="readonly"
										style='text-align:right' /></div>
									</td>
								</tr>
								<tr>
									<td valign="top" class="boldEleven">
									<div align="left">Total Discount (%)</div>
									</td>
									<td width="169" valign="top" class="boldEleven"
										id="totaldiscount1">
									<div align="left"><input tabindex="12"
										name="totaldiscount" type="text" class="formText135"
										id="totaldiscount" value="0" onblur="assignGrandTotal()"
										style='text-align:right'></div>
									</td>
								</tr>
								<tr>
									<td valign="top" class="boldEleven">
									<div align="left">Tax Group</div>
									</td>
									<td width="169" valign="top" class="boldEleven" id="tax1">
									<div align="left"><select name="tax" class="formText135"
										id="tax1" onChange="assignTotals(this)" tabindex="13">
										<option value="Select">Select</option>
										<%
								String taxids[][] = com.my.org.erp.common.CommonFunctions.QueryExecute("Select INT_TAXID,CHR_TAXNAME from inv_m_tax");
								for(int u=0; u<taxids.length; u++)
									out.print("<option value='"+taxids[u][0]+"'>"+taxids[u][1]+"</option>");
							%>
									</select></div>
									</td>
								</tr>
								<tr>
									<td valign="top" class="boldEleven">
									<div align="left">Sales Tax (%)</div>
									</td>
									<td width="169" valign="top" class="boldEleven" id="salestax1">
									<div align="left"><input name="salestax" value="0"
										type="text" class="formText135" id="salestax"
										readonly="readonly" tabindex="14" style='text-align:right' />
									</div>
									</td>
								</tr>
								<tr>
									<td valign="top" class="boldEleven">
									<div align="left">Reference <input name="filename"
										type="hidden" value="DirectSale" /> <input name="actionS"
										type="hidden" value="INVDirectSaleAdd" /> <input name="param"
										type="hidden" id="param" value='0,'></div>
									</td>
									<td class="boldEleven">
									<div align="left"><select name="ref" id="ref"
										class="formText135" size="3">

										<%
				  String empdata[][]=com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT CHR_EMPID,CHR_STAFFNAME  FROM com_m_staff ORDER BY CHR_STAFFNAME");
				  for(int y=0; y<empdata.length;y++)
				  	out.println("<option  value='"+empdata[y][0]+"' title='"+empdata[y][0]+"'>"+empdata[y][1]+" / " +empdata[y][0]+ "</option>");	
				  %>
									</select></div>
									</td>
									<td class="boldEleven">
									<div align="left">Sales Tax Amount</div>
									</td>
									<td class="boldEleven" id="salestaxamount1">
									<div align="left"><input name="salestaxamount" value="0"
										type="text" class="formText135" id="salestaxamount"
										readonly="readonly" tabindex="14" style='text-align:right' />
									</div>
									</td>
								</tr>
								<tr>
									<td class="boldEleven">
									<div align="left"></div>
									</td>
									<td class="boldEleven">
									<div align="left"></div>
									</td>
									<td class="boldEleven">
									<div align="left">Net Total</div>
									</td>
									<td class="boldEleven" id="nettotal1">
									<div align="left"><input name="nettotal" type="text"
										class="formText135" id="nettotal" tabindex="15" value="0"
										style='text-align:right' /></div>
									</td>
								</tr>
								<tr>
									<td colspan="4" class="boldEleven">
									<div align="center"><input name="Submit" type="submit"
										class="tMLAscreenHead" value="Submit"   accesskey="s"    onClick="return valid()" />
									&nbsp;&nbsp; <input name="Submit2" type="button"
										class="tMLAscreenHead" value="  Close  "
										onClick="redirect('Direct Sale.jsp')" /></div>
									<div align="center"></div>
									<div align="left"></div>
									<div align="left"></div>
									</td>
								</tr>
							</table>
							</td>
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
<%
  	//sql = "select * from inv_m_stock where CHR_ITEMID=";
  //checkstock(stname,stqty);
  %>
</form>
<%@ include file="../footer.jsp"%>
<%
 }
 catch(Exception e)
 {
 }
%>
</body>
</html>
