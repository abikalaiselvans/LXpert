  <%@ page import="java.io.*,java.util.*"%>
<%@ page import="sun.net.smtp.SmtpClient"%>
<%@ page import="com.my.org.erp.common.CommonFunctions"%>
<html>
<head>
<title>:: INVENTORY ::</title>
<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style>

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
			changeMonth: true,maxDate: "+0D" ,
			changeYear: true,
			maxDate: "+0D" ,showOn: "button",
			buttonImage: "../JavaScript/jquery/images/calendar.gif",
			numberOfMonths: 1,
			buttonImageOnly: true,
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



 
<body >
<%@ include file="indexinv.jsp"%>
<form  AUTOCOMPLETE = "off"   name="frm" method="post" action="Rept_MyProductwiseSalesReportAllResponse.jsp" onSubmit="return Validate()" >
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
					<table cellspacing="2" cellpadding="2" width="500" align="center"
						border="0">
						<!--DWLayoutTable-->
						<tbody>
							<tr>
								<td height="16" colspan="3" align="center" valign="top"
									class="boldThirteen">CUSTOMER WISE PRODUCT SALE REPORT  </td>
							</tr>

							<tr>
								<td height="19" colspan="3" align="right" valign="top"><span
									class="bolddeepred">* </span><span class="fairyHead">Mandatory
								</span></td>
							</tr>
							<tr>
							  <td height="17" class="boldEleven">Company <%
				String branchid=""+session.getAttribute("BRANCHID");
				String usertype=""+session.getAttribute("USRTYPE");
				 	
			%>								<span class="bolddeepred">*</span></td>
								<td colspan="2" align="left"><select name="Branch"
									class="formText135" id="Branch" tabindex="6"
									onChange="loadItem('0')" style="width:200">

									<%
								
								String sql ="Select a.INT_BRANCHID,a.CHR_BRANCHNAME ,b.CHR_COMPANYNAME from  com_m_branch  a  ,com_m_company b where  a.INT_COMPANYID = b.INT_COMPANYID ";	
				if("N".equals(CommonFunctions.QueryExecute("SELECT  CHR_DISPLAYINACTIVECOMPANY FROM m_institution  WHERE INT_ID=1")[0][0]))			  
					sql = sql + " AND b.INT_ACTIVE =1 ";
								
				String shipids[][] =  CommonFunctions.QueryExecute(sql);
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
								<td height="17" class="boldEleven">Division<span class="bolddeepred">*</span></td>
								<td colspan="2" align="left"><select name="division"
									class="formText135" id="division" tabindex="1"  style="width:200">
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
							  <td height="17" class="boldEleven">From Date <span class="bolddeepred">*</span></td>
							  <td colspan="2" align="left"><span class="boldEleven">
							    <input   
												name="fromdate" type="text" class="formText135"
												id="fromdate" size="15" maxlength="10" readonly="true"
												  />
                               
                                <script
												language='JavaScript' type="text/javascript">
		<!--
			 
			setCurrentDate('fromdate');
		//-->
	                              </script>
							  </span></td>
						  </tr>
							<tr>
							  <td height="17" class="boldEleven">To Date <span class="bolddeepred">*</span></td>
							  <td colspan="2" align="left"><span class="boldEleven">
							    <input
												name="todate" type="text" class="formText135" id="todate"  
												size="15" maxlength="10"  readonly="true" />
                               
                                <script
												language='JavaScript' type="text/javascript">
		<!--
			 
			setCurrentDate('todate');
		//-->
	                              </script>
							  </span></td>
						  </tr>
							 
							<tr>
								<td height="17" colspan="3" class="boldEleven">
								<table width="112" border="0" align="center" cellpadding="1"
									cellspacing="1">
									<tr>
										<td><input name="Submit" id="Submit" type="submit"	class="buttonbold13" value="Submit"   accesskey="s"   ></td>
										<td><input name="Close"   type="button"  class="buttonbold13" id="Close"  value="Close"   accesskey="c"  onClick="javascript:window.close()"></td>
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
<script language="JavaScript">

function Validate()
  {
	
	var d1 =  document.getElementById('fromdate').value;
	var d2 =  document.getElementById('todate').value;
	 //&& checkNullSelect( "itype","Select Item/Product","0" ) 
	if(checkNull( "Branch","Select Branch" )&& checkDate('fromdate','todate'))
		return true;
	else
		return false;				
		
 } 	
</script> <%@ include file="../footer.jsp"%></form>
</body>
</html>
