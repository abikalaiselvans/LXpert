<%@ page import="java.io.*,java.util.*"%>
<%@ page import="sun.net.smtp.SmtpClient"%>

<html>
<head>

<title> :: DEBUG ::</title>

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
 
<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style>



</head>
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="JavaScript" src="../JavaScript/calendar1.js"
	type="text/javascript"></script>
<script language="javascript">
function Validate()
{
		var d = document.getElementById('desc').value;
		var l = d.length;
		if(l>1000)
		{
			alert("Description Lessthan or equal to 1000chracter");
			return false;
		}	
		if(
			checkNullSelect('package','Select Package..', 'Select')
			&& checkNullSelect('priority','Select Priority..', 'Select')
			&& checkNull('desc', 'Enter Problem Description..')
			 
		)
		{
			return true;
		}
		else
		{
			return false;
		}	
}		
</script>
<body  onpaste='return false;'>
<%@ include file="index.jsp"%>
<form  AUTOCOMPLETE = "off"   name="frm" method="post" action="../SmartLoginAuth"
	onSubmit="return Validate()">
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
		<table class="BackGround1" cellspacing="0" cellpadding="0" width="600"
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
					<table cellspacing="2" cellpadding="2" width="600" align="center"
						border="0">
						<!--DWLayoutTable-->
						<tbody>
							<tr>
								<td height="16" colspan="3" align="center" valign="top"
									class="boldThirteen">TICKET</td>
							</tr>

							<tr>
								<td height="19" colspan="3" align="right" valign="top"><span
									class="bolddeepred">* </span><span class="fairyHead">Mandatory
								</span></td>
							</tr>
							<tr>
								<td width="153" height="17" class="boldEleven"></td>
								<td width="221" colspan="2" align="left">
								<%
				  	String Ticketid = request.getParameter("Ticketid");
					String sql="  SELECT CHR_PACKAGE,CHR_PRIORITY,CHR_PROBLEM from com_m_ticket WHERE INT_TICKETID="+Ticketid;
					String data[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
					String pack =data[0][0].trim();
					String pri =data[0][1].trim();
					String desc =data[0][2] ;
					
				  %> <input name="Ticketid" type="hidden" id="Ticketid"
									value="<%=Ticketid%>"></td>
							</tr>
							<tr>
								<td height="17" class="boldEleven">Package<span
									class="bolddeepred">* </span></td>
								<td colspan="2" align="left">
								<select name="package" id="package">
									<option value='Select' selected>Select </option>
									<%
							
							String dataa[][] = com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT CHR_SHORTNAME,CHR_MODULE FROM  m_projectmodule ORDER BY INT_ID");
							if(dataa.length>0)
								for(int u=0;u<dataa.length;u++)
									out.println("<option value='"+dataa[u][0]+"'>"+dataa[u][1]+"</option>");
							%>
									
								</select>
								<script language="javascript">setOptionValue('package','<%=pack%>')</script>
								</td>
							</tr>
							<tr>
								<td height="17" class="boldEleven">Priority<span
									class="bolddeepred">* </span></td>
								<td colspan="2" align="left"><select name="priority"
									id="priority">
									<option value='Select' selected="selected">Select <%
						if("1".equals(pri))
							out.println("<option value='1' selected >Normal");
						else
							out.println("<option value='1' >Normal");	
						if("2".equals(pri))
							out.println("<option value='2' selected >Medium");
						else
							out.println("<option value='2' >Medium");	
							
						if("3".equals(pri))
							out.println("<option value='3' selected >Urgent");
						else
							out.println("<option value='3' >Urgent");	
							
						if("4".equals(pri))
							out.println("<option value='4' selected >Most Urgent");
						else
							out.println("<option value='4' >Most Urgent");			
							
							
					%>
									
								</select></td>
							</tr>
							<tr>
								<td height="17" valign="top" class="boldEleven">Problem
								Description<span
									class="bolddeepred">* </span></td>
								<td colspan="2" align="left"><textarea name="desc"
									cols="50" rows="10" class="formText135" id="desc"
									maxlength=1000><%=desc%></textarea></td>
							</tr>
							<tr>
								<td height="17" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
								<td colspan="2" align="left" class="bolddeepblue">( max
								1000chr)</td>
							</tr>
							<tr>
								<td height="17" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
								<td colspan="2" align="left"><input name="filename"
									type="hidden" value="Ticket" /> <input name="actionS"
									type="hidden" value="DEBTicketUpdate" /></td>
							</tr>
							<tr>
								<td height="17" colspan="3" class="boldEleven">
								<table width="112" border="0" align="center" cellpadding="1"
									cellspacing="1">
									<tr>
										<td><input name="Submit" type="submit"
											class="buttonbold13" value="Submit"   accesskey="s"   ></td>
										<td><input name="Close" type="button"
											class="buttonbold13" id="Close"  value="Close"   accesskey="c" 
											onClick="redirect('DebugView.jsp')"></td>
									</tr>
								</table>
								</td>
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
