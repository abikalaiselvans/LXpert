<%@ page import="java.io.*,java.util.*"%>
<%@ page import="sun.net.smtp.SmtpClient"%>

<html>
<head>
<title>:: INVENTORY ::</title><link rel="icon" type="image/ico" href="../images/ERP.ico"></link>
<link rel="shortcut icon" href="../images/ERP.ico"></link>

<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style>


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
<script language="JavaScript" src="../JavaScript/calendar1.js"
	type="text/javascript"></script>
<body >
<%@ include file="indexinv.jsp"%>
<form  AUTOCOMPLETE = "off"   name="frm" method="post" action="../SmartLoginAuth">
<table width="100%" border="0" cellspacing="1" cellpadding="1">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
		<table width="222" border="0"
			align="center" cellpadding="0" cellspacing="0" class="BackGround1">
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
					<td width="410">
					<table cellspacing="2" cellpadding="2" width="438" align="center"
						border="0">
						<!--DWLayoutTable-->
						<tbody>
<tr>
  <td height="19" colspan="4" align="center" valign="top" class="copyright">SALES PAYMENT</td>
  </tr>
<tr>
  <td width="22" align="right" valign="top" class="boldEleven">1.</td>
							  <td width="222" height="19" align="right" valign="top"><div align="left"><span class="boldEleven"> <a href="Rept_PaymentCommitment.jsp" target="_blank">Payment Commitment</a></span></div></td>
							  <td width="20" align="right" valign="top" class="boldEleven">2.</td>
							  <td width="210" align="right" valign="top"><div align="left" class="boldEleven"> <a href="PaymentCollection.jsp" target="_blank">Payment Collection </a></div></td>
						  </tr>
							<tr>
							  <td align="right" valign="top" class="boldEleven">3.</td>
							  <td height="19" align="right" valign="top"><div align="left" class="boldEleven"> <a href="Averagecollectionindays.jsp" target="_blank">Average Collection in days </a></div></td>
							  <td align="right" valign="top" class="boldEleven">4.</td>
							  <td align="right" valign="top"><div align="left"><span class="boldEleven"> <a href="PaymentPending.jsp" target="_blank">Payment Pending </a></span></div></td>
					      </tr>
						    <!--<tr>
						      <td height="19" align="right" valign="top"><div align="left"><span class="boldEleven"> <a href="PaymentPendingwithoutcommitment.jsp" target="_blank">Payment Pending (Without Commitment) </a></span></div></td>
					      </tr>-->
					        <tr>
					          <td align="right" valign="top" class="boldEleven">5.</td>
					          <td height="19" align="right" valign="top"><div align="left"><span class="boldEleven"> <a href="Rept_PaymentHonouredCollection.jsp" target="_blank">Payment Honoured Collection</a></span></div></td>
					          <td align="right" valign="top" class="boldEleven">6.</td>
					          <td align="right" valign="top"><div align="left"><span class="boldEleven"> <a href="SalesAnalysisReport.jsp" target="_blank">Sales Analysis</a></span></div></td>
			              </tr>
				          <tr>
				            <td align="right" valign="top" class="boldEleven">7.</td>
							  <td height="19" align="right" valign="top"><div align="left"><span class="boldEleven"> <a href="Rept_ChequeBounds.jsp" target="_blank">Cheque Bounds</a></span></div></td>
							  <td align="right" valign="top" class="boldEleven">8.</td>
							  <td align="right" valign="top"><div align="left"><span class="boldEleven"> <a href="SalesInvoiceAmount.jsp" target="_blank">Amount</a></span></div></td>
						  </tr>
						  
						  
							<tr>
							  <td class="boldEleven">9.</td>
                              <td class="boldEleven"><a href="Rept_Customer_NoofSales.jsp" target="_blank">Customer Wise </a></td>
                              <td class="boldEleven">10.</td>
                              <td class="boldEleven"><a href="Rept_Customer_NoofSaleswithRef.jsp" target="_blank">Customer Wise with Ref </a></td>
					      </tr>
							<tr>
							  <td class="boldEleven">11.</td>
                              <td class="boldEleven"><a href="Rept_DetailedSales.jsp" target="_blank">Detailed Sales Report </a></td>
                              <td class="boldEleven">12</td>
                              <td class="boldEleven"><a href="todayCollectionPayment.jsp" target="_blank">Collection</a></td>
					      </tr>
							
							<tr>
							  <td align="right" valign="top" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
							  <td height="19" align="right" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
							  <td align="right" valign="top" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
							  <td align="right" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
					      </tr>
							<tr>
							  <td height="19" colspan="4" align="right" valign="top">
							    <table align="center">
							      <tr><td>
				              <input name="Close" type="button"
											class="buttonbold13" id="Close"  value="Close"   accesskey="c" 
											onClick="redirect( 'InventoryMains.jsp')"></td></tr></table></td>
							</tr>
						</tbody>
						<input type="hidden" name="mobileBookingOption" />
					</table>
				  </td>
					<td nowrap="nowrap" width="6"><spacer height="1" width="1"
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
	if(checkNull( "SerialNumber","Enter Serial Number" ))
		return true;
	else
		return false;				
		
 } 	
</script> <%@ include file="../footer.jsp"%></form>
</body>
</html>
