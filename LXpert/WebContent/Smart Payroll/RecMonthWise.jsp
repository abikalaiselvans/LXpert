<%@ include file="index.jsp"%>
<html>
<head>

<title> :: PAYROLL ::</title>

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

<script language="JavaScript" src="../JavaScript/comfunction.js"></script>
<script language="javascript"
	src="../JavaScript/Attendance/ReportAjax.js"></script>
<script language=""="javascript">
 function Validate()
{
	if(checkNullSelect('month','Select Month','select') && checkNullSelect('year','Select Year','select')  )
		return true;
	else
		return false;
}
</script>
<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
</head>
<form  AUTOCOMPLETE = "off"   name="f1" action="../SmartLoginAuth" onSubmit="return Validate()">
<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td height="225" valign="bottom">
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

					<table width="350" height="201" border="0" align="center"
						cellpadding="2" cellspacing="2"  >
						<!--DWLayoutTable-->
						<tr align="center" valign="middle">
							<td height="32" colspan="2" class="BackGround" >RECOVERY DETAILS </td>
						</tr>
						<tr>
							<td width="162" height="28" valign="middle" class="boldEleven">
							Company <span class="boldred">*</span></td>
							<td width="206"><select name="company" id="company"
								onChange="loadBranch()" class="formText135" style="width:200px">
								<%                  
     					String queryBranch1="SELECT * FROM  com_m_company ";
     					String	branch1[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(queryBranch1);
     					for(int i=0;i<branch1.length;i++)
 	 						out.println("<option value='"+branch1[i][0]+"'>"+branch1[i][1]+"</option>");
 			   %>
							</select></td>
						</tr>
						<tr>
							<td width="162" height="28" valign="middle" class="boldEleven">
							Branch <span class="boldred">*</span></td>
							<td width="206"><select name="branch" id="branch"
								class="formText135" style="width:200px">
								<option value="-1">All</option>
							</select></td>
						</tr>

						<tr align="center" valign="middle">
							<td width="162" height="32" align="left" valign="middle"
								class="boldEleven">Month <span class="boldred">*</span></td>
							<td width="206" align="left" valign="middle" class="boldEleven">
								<select	name="month" 	id="month"  class="formText135">
								<option value="select">Select</option>
								<%@ include file="../JavaScript/months.jsp" %>
							</select>
							
						  </td>
						</tr>
						<tr>
							<td height="32" align="left" valign="middle" class="boldEleven">Year <span class="boldred">*</span></td>
							<td valign="top" class="boldEleven">
							<select name="year" id="year" class="formText135">
								<option value="select">Select</option>
								 <%@ include file="../JavaScript/years.jsp" %>
							</select> <script language='JavaScript' type="text/javascript">
				<!--			
						var d=new Date()
						var month1=d.getMonth() + 1
						if(month1<10) month1="0"+month1;
						var year1=d.getFullYear();
						setOptionValue('month',month1);
						setOptionValue('year',year1);							
				//-->
          </script>
							<input type="hidden" name="filename" value="Recovery"> <input
								type="hidden" name="actionS" value="PAYRecoveryMonthView">
						  <input type="hidden" name="view" value="Recovery"></td>
						</tr>
						<tr>
							<td colspan="2" align="left" valign="middle" class="boldEleven">
							<table border="0" align="center" cellpadding="2" cellspacing="2">
								<tr>
									<td width="56"><input class="buttonbold14" type="submit"
										name="Submit" value="Submit"   accesskey="s"   ></td>
									<td width="56"><input class="buttonbold14" type="Button"
										name="Submit"  value="Close"   accesskey="c" 
										onClick="redirect('Payrollmain.jsp')"></td>
								</tr>
							</table>
						  </td>
						</tr>
						<tr>
							<td height="1"></td>
							<td></td>
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
	<tr>
		<td height="80">&nbsp;</td>
	</tr>
	<tr>
		<td><%@ include file="../footer.jsp"%></td>
	</tr>
</table>
</body>
</form>
</html>
