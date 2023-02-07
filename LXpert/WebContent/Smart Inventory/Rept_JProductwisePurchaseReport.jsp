<%@ page import="java.io.*,java.util.*"%>
<%@ page import="sun.net.smtp.SmtpClient"%>

<html>
<head>
<title><%=com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT CHR_MODULETITLE FROM m_projectmodule WHERE CHR_SHORTNAME='INV' ")[0][0]%></title>
<link rel="icon" type="image/ico" href="../images/ERP.ico"></link>
<link rel="shortcut icon" href="../images/ERP.ico"></link>



<meta name="resource-type" content="document" />
<meta http-equiv="content-type" content="text/html; charset=US-ASCII" />
<meta http-equiv="content-language" content="en-us" />
<meta name="author" content="KALAISELVAN K" />
<meta name="contact" content="abikalaiselvan@yahoo.co.in" />
<meta name="copyright" content="Copyright (c)2006-2011 KALAISELVAN K. All Rights Reserved." />
<meta name="description" content="Office Automation ERP Products." />
<meta name="keywords" content="HRM, Human Resource Management, HR Planning, Job Design, Job Analysing, Applicant, Company, Branch, Division,Model,Color,Office, Qualification, Attendance, Biometric, Finger Print, Forms, Leave, Holiday, Common Holiday, Shift Master, Shift Allocation. Proximity, Smart Card, Manual attendance, personal inforamtion , Basic, Allowance, Payroll, Salary Slab, Allowance, Recovery, Professional Tax, Employee attendance, Promotion, Trainning, Ressigner, Email, Jonners, PF, ESI, CTC, CTC, Take Home, Admin charge, Attendance, Payroll, Inventory, Product, Item, Customer, Vendor, vendor group, customer group, Purchase, sales, purchase paymeny, vendor payment, Sales return, purchase return, Quotation , Po, Purchase report, sales report, Tax, service tax, vat, c-form, taxes, user, employee id, payslip, consolidation, Attendance, stock, stock book , stock view, stock transfer, consumables, Serial number tracking, " />

<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
<link href="../JavaScript/SmartStyles.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="javascript" src="../JavaScript/jquery/jquery-1.7.1.js"></script>
<script language="javascript" src="../JavaScript/jquery/ui/jquery.ui.core.js"></script>
<script language="javascript" src="../JavaScript/jquery/ui/jquery.ui.widget.js"></script>
<script language="javascript" src="../JavaScript/jquery/ui/jquery.ui.datepicker.js"></script>
<script language="javascript" src="../JavaScript/Inventory/PurchaseRequestDate.js"></script>
<script>
	 

 $(function() {
		var dates = $( "#fromdate, #todate" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			changeYear: true,
			maxDate: "+0D" ,
		showOn: "button",
			buttonImage: "../JavaScript/jquery/images/calendar.gif",
			numberOfMonths: 1,
			onSelect: function( selectedDate ) {
				var option = this.id == "fromdate" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				dates.not( this ).datepicker( "option", option, date );
			}
		});
	});

	</script>
<link href="../JavaScript/jquery/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css">





 <script language="JavaScript">

function Validate()
  {
	
	var d1 =  document.getElementById('fromdate').value;
	var d2 =  document.getElementById('todate').value;
	 
	if( checkNull( "Branch","Select Branch" )
		&&checkNull("fromdate","Enter the From Date")
		&& checkNullSelect( "itype","Select Item/Product","0" ) 
		&&checkNull("todate","Enter the To Date")
		&& DateCompares ('fromdate','todate', 'Fromdate shoul not be greaterthan the  To Date')
		&& checkNullSelect( "reportType","Select Export Type" ,'0') 
		)
		return true;
	else
		return false;				
		
 } 	
</script>

<script type="text/javascript">
var isIE;
var req;
var names;
var target1;
var ctrl;
var divi="";
function Loaditemproduct(ctr,div) 
{
	if(ctr.value=="")
	{
		alert("Kindly select Product or Item")
		ctr.focus();
	}
	else
	{
		var url = "../inventory?actionS=INVItemProduct&id="+escape(ctr.value) ;
		divi = div;
		initRequest(url);
		req.onreadystatechange = itemproductRequest;
		req.open("GET", url, true);
		req.send(null);
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
	var batchs = req.responseXML.getElementsByTagName("items")[0];   
   s1 ='item';
	var str="<select name='"+s1+"'  id='"+s1+"' size='1' class='formText135'    style='width:200' ><option value=0>All"; 

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
 
 
 
 
 function LoadItemProductGroup(ctr) 
 {	
 	try
	{
		if(ctr.value=="")
		{
			alert("Kindly select Product or Item")
			ctr.focus();
		}
		else
		{
			var url = "../inventory?actionS=LoadItemProductGroup&id="+escape(ctr.value) ;
			divi = div;
			initRequest(url);
			req.onreadystatechange = LoadItemProductGroupRequest;
			req.open("GET", url, true);
			req.send(null);
		}
		
	}
	catch(err)	
	{
		 alert(err.description)
	}
}

function LoadItemProductGroup() 
{
    if (req.readyState == 4) 
	{
       
		if (req.status == 200) 
		{
          LoadItemProductGroupMessages();
        }
    }
}


function LoadItemProductGroupMessages() 
{
	try
	{ 
		alert("fghfgh");
	 
		var sd = req.responseXML.getElementsByTagName("Rowss")[0];      
		alert(sd);
	}
	catch(err)	
	{
		 alert(err.description)
	}	  
}
 
</script>
<body >
<%@ include file="indexinv.jsp"%>
<form  AUTOCOMPLETE = "off"   name="frm" method="post" action="../SmartLoginAuth" onSubmit="return Validate()" >
<table width="100%" border="0" cellspacing="1" cellpadding="1">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td></td>
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
					<table cellspacing="2" cellpadding="2" width="525" align="center"
						border="0">
						<!--DWLayoutTable-->
						<tbody>
							<tr>
								<td height="16" colspan="3" align="center" valign="top"
									class="boldThirteen">ITEM/PRODUCT  WISE  PURCHASE REPORT  </td>
							</tr>

							<tr>
								<td height="19" colspan="3" align="right" valign="top"><span
									class="bolddeepred">* </span><span class="fairyHead">Mandatory
								</span></td>
							</tr>
							<tr>
								<td width="138" height="17" class="boldEleven">Company 
							  <%
				String branchid=""+session.getAttribute("BRANCHID");
				String usertype=""+session.getAttribute("USRTYPE");
				 	
			%>								</td>
								<td width="373" colspan="2" align="left"><select name="Branch"
									class="formText135" id="Branch" tabindex="6"
									onChange="loadItem('0')" style="width:200">

									<%
								
								String shipids[][] = com.my.org.erp.common.CommonFunctions.QueryExecute("Select a.INT_BRANCHID,a.CHR_BRANCHNAME ,b.CHR_COMPANYNAME from  com_m_branch  a  ,com_m_company b where  a.INT_COMPANYID = b.INT_COMPANYID ");
								if(usertype.equals("F"))
								{
									for(int u=0; u<shipids.length; u++)
										out.print("<option value='"+shipids[u][0]+"'>"+shipids[u][2]+" @ "+shipids[u][1]+"</option>");
								}
								else
								{
									for(int u=0; u<shipids.length; u++)
										if(shipids[u][0].equals(branchid))
											out.print("<option value='"+shipids[u][0]+"'>"+shipids[u][2]+" @ "+shipids[u][1]+"</option>");
																
								}
										
							%>
							  </select> <script language="javascript">
						  	setOptionValue("Branch","<%=branchid%>") 
						  </script></td>
							</tr>
							<tr>
								<td height="17" class="boldEleven">Division</td>
								<td colspan="2" align="left"><select name="division"
									class="formText135" id="division" tabindex="1"style="width:200">
									<option value='0'>All</option>
									<%
								String division[][] = com.my.org.erp.common.CommonFunctions.QueryExecute("Select INT_DIVIID,CHR_DIVICODE from inv_m_division   WHERE INT_DIVIID >0 AND CHR_OFFICEIDS LIKE '%"+session.getAttribute("INVOFFICEID")+"%'  ORDER BY CHR_DIVICODE"); 
								for(int u=0; u<division.length; u++)
									out.print("<option value='"+division[u][0]+"'>"+division[u][1]  +"</option>");
							%>
								</select> 
								<span class="boldred"></span></td>
							</tr>
							
							<tr>
								<td height="17" class="boldEleven"><span class="boldEleven">Vendor</span></td>
								<td colspan="2" align="left"> 
									<select name="vendor"
										class="formText135" id="vendor" tabindex="1"style="width:200">
										<option value='0'>All</option>
										<%
								String vendorids[][] = com.my.org.erp.common.CommonFunctions.QueryExecute("Select INT_VENDORID,CHR_VENDORNAME from  inv_m_vendorsinformation  ORDER BY CHR_VENDORNAME");
								for(int u=0; u<vendorids.length; u++)
									out.print("<option value='"+vendorids[u][0]+"'>"+vendorids[u][1]+" / "+vendorids[u][0] +"</option>");
							%>
									</select></td>
							</tr>
							<tr>
							  <td height="17" class="boldEleven">Payment</td>
							  <td colspan="2" align="left"><select name="payment"
									class="formText135" id="payment" tabindex="1" style="width:200">
                                <option value='0'>All</option>
                                 <option value='Y'>Completed</option>
								  <option value='N'>Partially completed</option>
								   <option value='P'>Pending </option>
                              </select></td>
						  </tr>
							<tr>
								<td height="17" class="boldEleven">Account Received Flag </td>
								<td colspan="2" align="left"><select name="account"
										class="formText135" id="account" tabindex="1" style="width:200">
                                  <option value='0'>All</option>
                                   <option value='Y'>Received</option>
								    <option value='N'>Not Received</option>
									
                                </select></td>
							</tr>   <!-- onBlur="LoadItemProductGroup(this)" -->
							<tr>
								<td height="17" class="boldEleven">Product Type <span class="bolddeepred">*</span> </td> 
								<td colspan="2" align="left"><select class='formText135'
									name='itype' id='itype' onChange="Loaditemproduct(this,'code')" style="width:200" >
									<option value="0">Select</option>
									<option value='1'>Item</option>
									<option value='2'>Product</option>
								</select></td>
							</tr>
							 
							<tr>
								<td height="17" class="boldEleven">Item / Product Code</td>
								<td colspan="2" align="left">
								<div id="code"></div></td>
							</tr>
							<tr>
							  <td height="17" class="boldEleven">From Date </td>
							  <td colspan="2" align="left"><span class="boldEleven">
							    <input   
												name="fromdate" type="text" class="formText135"
												id="fromdate" size="15" maxlength="10" readonly
												  />
                                
                                <script
												language='JavaScript' type="text/javascript">
		 
			setCurrentDate('fromdate');
		 
	                              </script>
							  </span></td>
						  </tr>
							<tr>
							  <td height="17" class="boldEleven">To Date </td>
							  <td colspan="2" align="left"><span class="boldEleven">
							    <input readonly 
												name="todate" type="text" class="formText135" id="todate"  
												size="15" maxlength="10"  />
                               
                                <script
												language='JavaScript' type="text/javascript">
		 
			setCurrentDate('todate');
	 
	                              </script>
							  </span></td>
						  </tr>
							<tr>
                              <td height="17" class="boldEleven">Export Type <span class="bolddeepred">* </span></td>
							  <td colspan="2" align="left"><span class="boldEleven">
                                <select name="reportType" id="reportType" style="width:170">
                                  <option value="0" title="../DropDown - Image/icons/export.jpg" selected="selected">Export Type</option>
                                  <option value="csv" title="../DropDown - Image/icons/csv.jpg">CSV </option>
                                  <option value="xls" title="../DropDown - Image/icons/excel.jpg">Excel </option>
                                  <option value="html" title="../DropDown - Image/icons/html.jpg">Html </option>
                                  <option value="pdf" title="../DropDown - Image/icons/pdf.jpg">Pdf </option>
                                  <option value="rtf" title="../DropDown - Image/icons/rtf.jpg">Rtf </option>
                                  <option value="txt" title="../DropDown - Image/icons/txt.jpg">Txt </option>
                                  <option value="xml" title="../DropDown - Image/icons/xml.jpg">Xml </option>
                                </select>
                                <input name="filename"
									type="hidden" value="Rept_JProductWisePurchaseReport" />
                                <input name="actionS"
									type="hidden" value="INVRept_JProductWisePurchaseReport" />
                                <input name="rptfilename" type="hidden" id="rptfilename" value="itemwisePurchaseReport">
                                <input name="rptfilename1" type="hidden" id="rptfilename1" value="productwisePurchaseReport">
							  </span></td>
						  </tr>
							 
							<tr>
								<td height="17" colspan="3" class="boldEleven">
								<table width="112" border="0" align="center" cellpadding="1"
									cellspacing="1">
									<tr>
										<td><input name="Submit" type="submit"	class="buttonbold13" value="Submit"   accesskey="s"   ></td>
										<td><input name="Close" type="button"
											class="buttonbold13" id="Close"  value="Close"   accesskey="c" 
											onClick="javascript:window.close()"></td>
									</tr>
								</table>								</td>
							</tr>
							<tr>
								<td height="17" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
								<td colspan="2" align="left"><!--DWLayoutEmptyCell-->&nbsp;</td>
							</tr>
						</tbody>
						<input type="hidden" name="mobileBookingOption" />
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
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
 <%@ include file="../footer.jsp"%></form>
</body>
</html>
