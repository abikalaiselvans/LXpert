<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 

<title> :: PAYROLL ::</title>


 
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

<script language="JavaScript" src="../JavaScript/comfunction.js"></script>
<script language="JavaScript" src="../JavaScript/calendar1.js"></script>
<script language="javascript">
				function validate()
	    		{
				       if(payfrm.department.value=="select")
					   {
					       alert("Select Department");
						   return false; 
					   }
	                   if(payfrm.year.value=="select")
					   {
					        alert("Select Year");
                             return false; 					   
					   }			
					   if(payfrm.month.value=="select")
					   {
					        alert("Select Month");
							return false;
					   }
						return true;
		    	}	
	function mainPage()
	{
	    document.payfrm.action="Payrollmain.jsp";
		document.payfrm.submit();
		return true;
    }
			    </script>

<style type="text/css">
<!--
.style4 {font-size: 14px}
-->
</style>
</head>
<form  AUTOCOMPLETE = "off"   name="payfrm" method="post" action="../SmartLoginAuth">
<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%@ include file="index.jsp"%>
<br>
<br>
<br>
<table width="1000" border=0  >
	<!--DWLayoutTable-->
	<tr>
		<td width="258" height="16"></td>
		<td width="151"></td>
		<td width="55"></td>
		<td width="55"></td>
		<td width="228"></td>
		<td width="243"></td>
	</tr>
	<tr>
		<td height="132"></td>
		<td colspan="4" valign="top">
		<table class="BackGround" cellspacing="0" cellpadding="0" width="390"
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

					<table width="500" border="0" cellspacing="2" cellpadding="2"
						 >
						<!--DWLayoutTable-->
						<tr align="center" valign="middle">
							<td height="28" colspan="2" align="center" valign="middle"
								class="tablehead1 style4">Pay Bill Advance</td>
						</tr>
						<tr>
							<td width="193" height="30" valign="middle" class="bolddeepblue"><strong
								class="bolddeepblue">Department <font color="#ff0000">*</font></strong></td>
							<td width="287" valign="middle"><select name="Department"
								class="boldEleven">
								<option value="select">Select</option>
								<%
			     str="select CHR_DEPARTNAME,INT_DEPARTID FROM   com_m_depart   WHERE INT_DEPARTID in(select INT_DEPARTID from  com_m_staff ) order by CHR_DEPARTNAME";
				 rs=st.executeQuery(str);
				 while(rs.next())
				 {
	    	%>
								<option value=<%=rs.getString("INT_DEPARTID")%>><%=rs.getString("CHR_DEPARTNAME")%></option>
								<%}%>
							</select></td>
						</tr>
						<tr>
							<td height="30" valign="middle" class="bolddeepblue">Year<strong>
							<font color="#ff0000">*</font></strong></td>
							<td valign="middle"><%@include file="../JavaScript/year.jsp"%>
							</td>
						</tr>
						<tr>
							<td height="30" valign="middle" class="bolddeepblue">Month<strong>
							<font color="#ff0000">*</font></strong></td>
							<td valign="middle"><%@include
								file="../JavaScript/monthName.jsp"%></td>
						</tr>
						<tr>
							<td height="30" colspan="2" valign="middle" class="bolddeepblue">
							<table border="0" align="center" cellpadding="3" cellspacing="3">
								<tr>
									<td width="56"><input class="buttonbold14" type="submit"
										name="Submit" value="Submit"   accesskey="s"    onsubmit="return validate()"></td>
									<td width="56"><input class="buttonbold14" type="submit"
										name="Submit2"  value="Close"   accesskey="c"  onClick="mainPage()"></td>
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
		<td></td>
	</tr>
	<tr>
		<td height="21"></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td></td>
	</tr>
	<tr>
		<td height="28"></td>
		<td>&nbsp;</td>
		<td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
		<td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
		<td>&nbsp;</td>
		<td></td>
	</tr>
	<tr>
		<td height="78"></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td></td>
	</tr>
</table>
<input type="hidden" name="filename" value="Advance">
<input type="hidden" name="actionS" value="PAYAdvanceRecoveryDepart">



<%@ include file="../footer.jsp"%>
</body>
</form>
</html>
