<%@ page import="java.io.*,java.util.*"%>
<%@ page import="com.my.org.erp.common.CommonFunctions"%>
<html>
<head>
<title>:: INVENTORY ::</title> <style type="text/css">
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
<script language="JavaScript" src="../JavaScript/calendar1.js" type="text/javascript"></script>
<body >
<%@ include file="indexinv.jsp"%>

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
		<table class="BackGround1" cellspacing="0" cellpadding="0" width="250"
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
				  <td width="412"><table width="250" border="0" align="center" cellpadding="5" cellspacing="0">
					
					
					
				<!--	 <tr>
					  <td class="boldEleven"><div align="left">17</div></td>
					  <td class="boldEleven"><div align="left"><a href="Rept_StockBookCompanyWiseview.jsp" target="_blank">Stock Book view Conpany Wise </a></div></td>
				    </tr>
					<tr>
                      <td class="boldEleven"><div align="left">18</div></td>
                      <td class="boldEleven"><div align="left"><a href="Rept_StockBookview.jsp" target="_blank">Stock Book view Branch Wise</a> </div></td>
                    </tr>
					
					<tr>
                      <td class="boldEleven"><div align="left">19</div></td>
                      <td class="boldEleven"><div align="left"><a href="Rept_StockBookOfficeview.jsp" target="_blank">Stock Book view Office Wise</a> </div></td>
                    </tr>
					
					<%
						if("F".equals(session.getAttribute("USRTYPE").toString()))
						{
					%>
                    <tr>
                      <td class="boldEleven"><div align="left">20</div></td>
                      <td class="boldEleven"><div align="left"><a href="Rept_StockbookCreateCompanywise.jsp" target="_blank">Stock Book create Comapany Wise </a></div></td>
                    </tr>
					<%
					}
					%>
					
					<%
						if("F".equals(session.getAttribute("USRTYPE").toString()))
						{
					%>
                   
                    <tr>
                      <td class="boldEleven"><div align="left">21</div></td>
                      <td class="boldEleven"><div align="left"><a href="Rept_StockbookCreate.jsp" target="_blank">Stock Book create Branch Wise</a></div></td>
                    </tr> 
					<%
					}
					%>
					
					-->
					  <tr>
					   <td width="11%" class="boldEleven">1.</td>
					   <td width="89%" class="boldEleven"><a href="Rept_newDC.jsp" target="_blank">DC Report -1 </a></td>
				    </tr>
					
					 <tr>
                      <td class="boldEleven">2.</td>
                      <td class="boldEleven"><a href="Rept_DC.jsp" target="_blank">DC Report - 2  </a></td>
                    </tr>
					
                  </table></td>
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
		</table>	  </td>
  </tr>
  <tr>
	  <td>&nbsp;</td>
  </tr>
  <tr>
	  <td>
	  <%
	 /* String data2[][] =CommonFunctions.QueryExecute(" CALL FUN_INV_GET_STOCK_SERIALNUMBER(20,1,'I','000018')");
	  if(data2.length>0)
	  	for(int u=0;u<data2.length;u++)
			out.println(data2[u][0]+"<br>");*/
	  %>
	  </td>
  </tr>
  <tr>
	  <td>&nbsp;</td>
  </tr>
</table>
<%@ include file="../footer.jsp"%>
</body>
</html>
