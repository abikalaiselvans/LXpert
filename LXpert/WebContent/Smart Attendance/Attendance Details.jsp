<%@ include file="index.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css">

<title> :: ATTENDANCE ::</title>


 
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

<script language="javascript">
function mainPage()
	{
	    document.a.action="AttendanceMain.jsp";
		document.a.submit();
		return true;
    }	
</script>

<style type="text/css">
<!--
.style8 {
	font-family: Verdana;
	font-size: 12px;
}
a:visited {
	color: #663366;
}
a:hover {
	color: #FF0000;
}
a:active {
	color: #0000FF;
}
.style9 {
	font-size: 14px;
	color: #000066;
}
-->
</style>
</head>
<form  AUTOCOMPLETE = "off"   method="post" name="a" action="AttendanceDateView.jsp">
<body  onpaste='return false;'>


<table width="1000">
	<!--DWLayoutTable-->
	<tr>
		<td width="346" height="83">&nbsp;</td>
		<td width="313">&nbsp;</td>
		<td width="319">&nbsp;</td>
	</tr>
	<tr>
		<td height="253"></td>
		<td valign="top">
		<table class="BackGround" cellspacing="0" cellpadding="0" width="314"
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

					<table width="314" border=0    >
						<!--DWLayoutTable-->
						<tr align="center" valign="middle">
							<td height="28" colspan="2" 
								class="BackGround style9">Attendance Details</td>
						</tr>
						<tr>
							<td width="33" height="25" align="center" valign="middle">
							<div align="center"><img src="../Images/dot.gif" width="10"
								height="10"></div>
							</td>
							<td width="265" align="left" valign="middle"><span
								class="style8"> <a href="AttendanceDate.jsp"
								class="tabledata">Datewise</a> </span></td>
						</tr>
						<tr>
							<td height="25" valign="middle">
							<div align="center"><img src="../Images/dot.gif" width="10"
								height="10"></div>
							</td>
							<td valign="middle"><span class="style8"> <a
								href="AttendanceMonth.jsp" class="tabledata">Monthwise</a> </span></td>
						</tr>
						<tr>
							<td height="25" valign="middle">
							<div align="center"><img src="../Images/dot.gif" width="10"
								height="10"></div>
							</td>
							<td valign="middle"><span class="style8"> <!--         <a href="AttendanceIndividual.jsp" class="tabledata">Individual</a> -->
							<a href="AttendanceIndividual.jsp" class="tabledata">Individual</a>
							</span></td>
						</tr>
						<tr>
							<td height="0"></td>
							<td></td>
						</tr>
						<tr>
							<td height="25" valign="middle">
							<div align="center"><img src="../Images/dot.gif" width="10"
								height="10"></div>
							</td>
							<td valign="middle"><a href="AttendanceDesign.jsp"
								class="tabledata"> Designationwise</a></td>
						</tr>
						<tr>
							<td rowspan="2" valign="middle">
							<div align="center"><img src="../Images/dot.gif" width="10"
								height="10"></div>
							</td>
							<td height="1"></td>
						</tr>
						<tr>
							<td height="25" valign="middle"><span class="style8">

							<a href="AttendanceDept.jsp" class="tabledata">Departmentwise</a></span></td>
						</tr>
						<tr>
							<td colspan="2">
							<table border="0" align="center" cellpadding="2" cellspacing="2">
								<tr>
									<td width="56"><input class="buttonbold" type="button"
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
		<td height="13"></td>
		<td></td>
		<td></td>
	</tr>
</table>
<%@ include file="../footer.jsp"%>
</body>
</form>
</html>

