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

<script language="JavaScript" src="../JavaScript/calendar1.js"></script>
<script language="JavaScript" src="../JavaScript/comfunction.js"></script>
<script language="JavaScript">
  function Validate()
  {
    if(checkNull("fromdt","Enter From Date") && checkNull("todt","Enter To Date")
    && checkDate("fromdt","todt")){
  		return true;
	}
	else
	return false;	
  } 
  function mainPage()
  {
	    document.frmAtten.action="Payrollmain.jsp";
		document.frmAtten.submit();
		return true;
  }
  
</script>
<script type="text/javascript">
</script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
</head>
<form  AUTOCOMPLETE = "off"   name="frmAtten" action="DOBView.jsp">
<body  onpaste='return false;'>
<%@ include file="index.jsp"%>
<br>
<br>
<br>
<br>
<table width="100%">
	<!--DWLayoutTable-->
	<tr>
		<td width="38" height="158">
		<td colspan="4" valign="top">
		<table>
			<tr>
				<td width="923" height="143" rowspan="2"><br>
				<table width="400" align="center" border="1"  >
					<!--DWLayoutTable-->
					<tr align="center" valign="middle">
						<td height="25" colspan="2" class="BackGround" >Date
						Of Birth and Wedding Date</td>
					</tr>
					<td width="134" height="32" valign="middle" class="bolddeepblue"><span
						class="style8">Type</span></td>
					<td width="318" align="left" valign="middle"><select
						name="OptType" class="tabledata">
						<option value="select">Select</option>
						<option value="D">DOB</option>
						<option value="M">Marriage</option>
					</select></td>
					<tr>
						<td width="160" height="32" valign="middle" class="bolddeepblue"><span
							class="style8">From Date</span></td>
						<td width="318" align="left" valign="middle"><font size="1"><strong><font
							color="#000000"><font size="1"> <input
							name="fromdt" type="text" class="tabledata" id="fromdt"
							onkeyPress="dateOnly(fromdt)" value="" size="15"> <a
							href="javascript:cal1.popup();"><img
							src="../JavaScript/img/cal.gif" width="16" height="16" border="0"
							alt="Click Here to Pick up the date"></a> </font></font></strong></font> <font size="1"><strong><font
							color="#000000"><font size="1"> </font></font></strong></font> </select></td>
					</tr>
					<tr>
						<td width="160" height="28" valign="middle" class="bolddeepblue">
						<p class="style8">To Date</p>
						</td>
						<td align="left" valign="top"><font size="1"><strong><font
							color="#000000"><font size="1"> <input name="todt"
							type="text" class="tabledata" id="todt"
							onkeyPress="dateOnly(todt)" value="" size="15"> <a
							href="javascript:cal2.popup();"><img
							src="../JavaScript/img/cal.gif" width="16" height="16" border="0"
							alt="Click Here to Pick up the date"></a> </font></font></strong></font> <font size="1"><strong><font
							color="#000000"><font size="1"> </font></font></strong></font></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
	<tr>
		<td height="23">
		<td width="367">
		<td width="52">
		<td width="52">
		<td width="416">
	<tr>
		<td height="26">
		<td>
		<td valign="top"><input name="Submit" type="submit"
			class="buttonbold" value="Submit"   accesskey="s"    onclick="return Validate()">
		<td valign="top"><input name="Button" type="Button"
			class="buttonbold"  value="Close"   accesskey="c"  onclick="mainPage()">
		<td>
	</tr>
	<tr>
		<td height="49">
		<td>
		<td>
		<td>
		<td>
</table>
<script language='JavaScript'>
		<!--
			var cal1 = new calendar1(document.forms['frmAtten'].elements['fromdt']);
			cal1.year_scroll = true;
			cal1.time_comp = false;
			var cal2 = new calendar1(document.forms['frmAtten'].elements['todt']);
			cal1.year_scroll = true;
			cal1.time_comp = false;		
			setCurrentDate('fromdt');
			setCurrentDate('todt');
		//-->
	</script>

<%@ include file="../footer.jsp"%>
</body>
</form>
</html>
