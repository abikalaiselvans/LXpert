<%@ page import="java.io.*,java.util.*"%>
<%@ page import="com.my.org.erp.bean.payroll.*"%>
<%@ page import="com.my.org.erp.SmartPayroll.*"%>
<jsp:useBean id="conbean" class="DBConnection.DBCon"></jsp:useBean>

<html>
<head>

<title> :: PAYROLL ::</title>


 
 
<script src="../JavaScript/common/StaffloadAjax.js"></script>
<script language="JavaScript" src="../JavaScript/comfunction.js"></script>
<script language="JavaScript" src="../JavaScript/calendar1.js"> </script>
<script language="javascript">
function validate()
{
    if(checkNull("ename","Select Staff") && checkNull("amount","Enter Allowance Amount"))
		return true;
    else
    	return false;
}

  
</script>
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
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style3 {COLOR: #000000; LINE-HEIGHT: 15px; FONT-FAMILY: Verdana, Arial, Helvetica, Sans-Serif; TEXT-DECORATION: none; font-size: 10px;}
-->
</style>
</head>

<body  onpaste="return false;" onLoad="init()">
<%@ include file="index.jsp"%>
<form  AUTOCOMPLETE = "off"   name="frm" method="post" action="../SmartLoginAuth"
	onSubmit="return validate()">
<table width="100%" border="0" align="center" cellpadding="2"
	cellspacing="2">
	<tr>
		<td></td>
	</tr>

	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td height="54">
		<table width="563" border="0" align="center" cellpadding="0"
			cellspacing="0" bgcolor="#dce4f9" class="BackGround">
			<tbody>
				<tr>
					<td colspan="2" rowspan="2"><img height="7"
						src="../Image/General/TLCorner.gif" width="7" /></td>
					<td class="BorderLine" height="1"><spacer height="1" width="1"
						type="block" /></td>
					<td colspan="2" rowspan="2"><img height="7"
						src="../Image/General/TRCorner.gif" width="7" /></td>
				</tr>
				<tr>
					<td height="6"><spacer height="1" width="1" type="block" /></td>
				</tr>
				<tr>
					<td class="BorderLine" width="1"><spacer height="1" width="1"
						type="block" /></td>
					<td width="6"><spacer height="1" width="1" type="block"></td>
					<td width="549" valign="top">
					<table width="549" border="0" cellspacing="0" cellpadding="0">
						<tr class="boldEleven">
							<td height="20" colspan="2">
							<div align="center" class="boldEleven"><span
								class="boldEleven"><strong>Monthly Recovery </strong></span><strong></strong></div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<div align="right"><span class="boldEleven">* </span><span
								class="changePos">Mandatory</span></div>
							</td>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>

						<tr>
							<td width="49%" height="19">&nbsp;</td>
							<td width="51%">&nbsp;</td>
						</tr>
						<tr>
							<td height="19" colspan="2">
							<div align="center"><%@ include
								file="../JavaScript/ajax.jsp"%></div>
							</td>
						</tr>
						<tr>
							<td height="19" colspan="2">
							<table width="393" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="140" valign="middle"  
										class="bolddeepblue">Type of Recovery</td>
									<td width="180"><select name="Allowance"
										class="formText135" id="Allowance" tabindex="6">

										<%
								
		String sqs=" select CHR_RCODE,CHR_RNAME from pay_m_recovery WHERE CHR_MONTHFLAG='Y' order by CHR_RNAME";

		String shipidss[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(sqs);
		for(int u=0; u<shipidss.length; u++)
			out.print("<option  value='"+shipidss[u][0]+"'>"+shipidss[u][1] +"</option>");
							%>
									</select></td>
								</tr>
								<tr>
									<td valign="middle"   class="bolddeepblue">Amount
									</td>
									<td><input name="amount" type="text" class="formText135"
										id="amount" size="15" maxlength="7"></td>
								</tr>
								<tr>
									<td valign="middle"   class="bolddeepblue">Month</td>
									<td><select name="month" id="month">
										<%@ include file="../JavaScript/months.jsp"%>
									</select></td>
								</tr>
								<tr>
									<td valign="middle"   class="bolddeepblue">Year</td>
									<td><select name="year" id="year"
										onChange="loadManual('0')">
										<%@ include file="../JavaScript/years.jsp"%>
									</select> <script language='JavaScript' type="text/javascript">
				<!--			
						var d=new Date()
						var month1=d.getMonth() + 1
						if(month1<10) month1="0"+month1;
						var year1=d.getFullYear();
						setOptionValue('month',month1);
						setOptionValue('year',year1);							
				//-->
          </script></td>
								</tr>

							</table>
							</td>
						</tr>
						<tr>
							<td height="19" colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td height="19" colspan="2">
							<div align="center"><input name="filename" type="hidden"
								id="filename" value="MonthlyRecovery" /> <input name="actionS"
								type="hidden" id="actionS" value="PAYMonthlyRecovery" /></div>
							</td>
						</tr>
						<tr>
							<td height="19" colspan="2">
							<table border="0" align="center" cellpadding="2" cellspacing="2">
								<tr>
									<td width="56"><input type="submit" name="Submit"
										id="submit_btn" class="buttonbold14" value="Submit"   accesskey="s"    /></td>
									<td width="56"><input type="button" name="submit"
										class="buttonbold14"  value="Close"   accesskey="c" 
										onClick="redirect('Payrollmain.jsp')" /></td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
					</td>
					<td nowrap="nowrap" width="6"><spacer height="1" width="1"
						type="block" /></td>
					<td class="BorderLine" width="1"><spacer height="1" width="1"
						type="block" /></td>
				</tr>
				<tr>
					<td colspan="2" rowspan="2"><img height="7"
						src="../Image/General/BLCorner.gif" width="7" /></td>
					<td height="6"><spacer height="1" width="1" type="block"></td>
					<td colspan="2" rowspan="2" valign="bottom">
					<div align="right"><img height="7"
						src="../Image/General/BRCorner.gif" width="7" /></div>
					</td>
				</tr>
				<tr>
					<td class="BorderLine" height="1"><spacer height="1" width="1"
						type="block" /></td>
				</tr>
			</tbody>
		</table>
		</td>
	</tr>
	<tr>
		<td height="23">&nbsp;</td>
	</tr>
	<tr>
		<td height="40"><%@ include file="../footer.jsp"%></td>
	</tr>
</table>
</form>