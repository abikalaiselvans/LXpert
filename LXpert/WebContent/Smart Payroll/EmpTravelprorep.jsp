<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript">
	
				function validate()
	
					{
				
						var Aname=document.getElementById("an").value
						var Acode=document.getElementById("ac").value
						
						
  					    submitOK="true"

						
                                          
							
						    if (Aname=="")

 							 {

								alert(" Enter Allowance Name")

								document.a.aname.focus()

                 					         submitOK="false"

							 }
							
							else if (Acode=="")

 							 {

								alert(" Enter Allowance Code")

								document.a.acode.focus()

                 					         submitOK="false"

							 }
							 
                        
						    if (submitOK=="false")
	
							 {
			
								 return false

 							 }
 	
		
					}	
			</script>

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

<style type="text/css">
<!--
.style1 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
}
.style12 {color: #FFFFFF}
.style14 {color: #FFFFFF; font-weight: bold; }
-->
</style>
</head>
<form  AUTOCOMPLETE = "off"   name="a" method="post" action="PayAllowance.jsp"
	onSubmit="return validate()">
<body  onpaste='return false;'>



<p>&nbsp;</p>

<table width="1000" border=0>
	<!--DWLayoutTable-->
	<tr>
		<td width="257" height="689">&nbsp;</td>
		<td colspan="3" valign="top" background="../if">
		<table width="372" border="1" cellspacing="2" cellpadding="2">
			<!--DWLayoutTable-->
			<tr align="center" valign="middle">
				<td height="28" colspan="2">
				<p>Employee Travel Program</p>
				</td>
			</tr>
			<tr>
				<td height="30" colspan="2" valign="top">
				<div align="center">Advance Details</div>
				</td>
			</tr>
			<tr>
				<td width="164">Employee Name</td>
				<td width="188"><select name="select">
				</select></td>
			</tr>
			<tr>
				<td>Visited Place</td>
				<td><input type="text" name="textfield"></td>
			</tr>
			<tr>
				<td>Period</td>
				<td><input type="text" name="textfield2"></td>
			</tr>
			<tr>
				<td>
				<div align="left">Purpose</div>
				</td>
				<td><input type="text" name="textfield22"></td>
			</tr>
			<tr>
				<td colspan="2">
				<div align="center">Ticket Requireds</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<div align="center"><input name="radiobutton" type="radio"
					value="radiobutton"> Yes <input name="radiobutton"
					type="radio" value="radiobutton"> No</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<div align="center">Journey Details</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">Departure Details</td>
			</tr>
			<tr>
				<td>Form Place</td>
				<td><input type="text" name="textfield222"></td>
			</tr>
			<tr>
				<td>To Place</td>
				<td><input type="text" name="textfield223"></td>
			</tr>
			<tr>
				<td>Date</td>
				<td><input type="text" name="textfield224"></td>
			</tr>
			<tr>
				<td>Time</td>
				<td><input type="text" name="textfield225"></td>
			</tr>
			<tr>
				<td>Class</td>
				<td><input type="text" name="textfield226"></td>
			</tr>
			<tr>
				<td>Mode of Transport</td>
				<td><select name="select2">
				</select></td>
			</tr>
			<tr>
				<td colspan="2">Return Jorney</td>
			</tr>
			<tr>
				<td>Form Place</td>
				<td><input type="text" name="textfield2262"></td>
			</tr>
			<tr>
				<td>To Place</td>
				<td><input type="text" name="textfield2263"></td>
			</tr>
			<tr>
				<td>Date</td>
				<td><input type="text" name="textfield2264"></td>
			</tr>
			<tr>
				<td>Time</td>
				<td><input type="text" name="textfield2265"></td>
			</tr>
			<tr>
				<td>Class</td>
				<td><input type="text" name="textfield2266"></td>
			</tr>
			<tr>
				<td>Mode of Transport</td>
				<td><select name="select3">
				</select></td>
			</tr>
		</table>
		</td>
		<td width="356">&nbsp;</td>
	</tr>
	<tr>
		<td height="21">&nbsp;</td>
		<td width="144">&nbsp;</td>
		<td width="59">&nbsp;</td>
		<td width="163">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td height="26">&nbsp;</td>
		<td>&nbsp;</td>
		<td valign="top" background="../if"><input type="submit"
			name="Submit" value="Submit"   accesskey="s"   ></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
<p>&nbsp;</p>

<table width="1000" border=0>
	<!--DWLayoutTable-->
	<tr>
		<td width="254" height="72">&nbsp;</td>
		<td width="93" valign="top" background="../if"><a
			href="SmartpayrollImg.htm"><img
			src="../Image/Smart%20Attendance/Home.gif" width="93" height="70"
			border="0"></a></td>
		<td width="169">&nbsp;</td>
		<td width="92" valign="top" background="../if"><a
			href="PMSmain.htm"><img
			src="../Image/Smart%20Attendance/Back.gif" width="92" height="69"
			border="0"></a></td>
		<td width="370">&nbsp;</td>
	</tr>
</table>
<p><br>
<br>
</p>
</body>
</form>
</html>
