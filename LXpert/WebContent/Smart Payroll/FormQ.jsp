
<%@ page import="com.my.org.erp.common.CommonFunctions"%>

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

</head>
<script language="JavaScript" src="../JavaScript/comfunction.js"></script>
<script language="javascript"
	src="../JavaScript/Attendance/ReportAjax.js"></script>
<script language="javascript">
 
function Validate()
{
	var m = document.getElementById('Month').value;
	var y = document.getElementById('Year').value;
	var m1=parseInt(m)-1;
	var y1= parseInt(y);
	document.getElementById('noofmonth').value=daysInMonth(m1, y1);
	
	if(checkNullSelect('Month','Select Month','0') && checkNullSelect('Year','Select Year','0')  )
		return true;
	else
		return false;
}
function setfocuss()
{
	var m = document.getElementById('Month').value;
	var y = document.getElementById('Year').value;
	var m1=parseInt(m)-1;
	var y1= parseInt(y);
	document.getElementById('noofmonth').value=daysInMonth(m1, y1);
	document.getElementById('company').focus();
}

</script>
<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
	onLoad="setfocuss()">
<%@ include file="index.jsp"%>
<form  AUTOCOMPLETE = "off"   name="frm" method="post" action="FormQResponse.jsp"
	onSubmit="return Validate()">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td height="300">
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
					<table width="455" border="0" align="center" cellpadding="0"
						cellspacing="0"  >
						<!--DWLayoutTable-->
						<tr align="center" valign="middle">
							<td height="30" colspan="2" class="BackGround" >FORM
							Q</td>
						</tr>
						<tr>
							<td width="162" height="28" valign="middle" class="boldEleven">
							Company</td>
							<td width="178"><select name="company" id="company"
								onChange="loadBranch()" onBlur="loadBranch()"
								class="formText135" style="width:200px">
								<%                  
     					String queryBranch1="SELECT INT_COMPANYID,CHR_COMPANYNAME  FROM  com_m_company ";
     					String	branch1[][]= CommonFunctions.QueryExecute(queryBranch1);
     					for(int i=0;i<branch1.length;i++)
 	 						out.println("<option value='"+branch1[i][0]+"'>"+branch1[i][1]+"</option>");
 			   %>
							</select></td>
						</tr>
						<tr>
							<td width="162" height="28" valign="middle" class="boldEleven">
							Branch</td>
							<td width="178"><select name="branch" id="branch"
								class="formText135" style="width:200px">
								<option value="0">All</option>
							</select></td>
						</tr>
						<tr align="center" valign="middle">
							<td height="28" align="left" valign="middle" class="boldEleven">office</td>
							<td align="left" valign="middle" class="boldEleven"><span
								class="bolddeepblue"> <%
			   	String branchid=""+session.getAttribute("BRANCHID");
	   			String oficeid=""+session.getAttribute("OFFICEID");
				 
			  %> <select name="Office" class="formText135" id="Office" style="width:200px">
								<option value="0">All</option>
								<%
								
		String sq=" select INT_OFFICEID,CHR_OFFICENAME from  com_m_office  order by CHR_OFFICENAME";

		String shipids[][] =  CommonFunctions.QueryExecute(sq);
		for(int u=0; u<shipids.length; u++)
			if(shipids[u][0].trim().equals(oficeid.trim()))
				out.print("<option selected = 'selected' value='"+shipids[u][0]+"'>"+shipids[u][1] +"</option>");
			else
				out.print("<option value='"+shipids[u][0]+"'>"+shipids[u][1] +"</option>");
							%>
							</select> </span></td>
						</tr>
						<tr align="center" valign="middle">
							<td width="162" height="28" align="left" valign="middle"
								class="boldEleven">Month</td>
							<td width="178" align="left" valign="middle" class="boldEleven"><%@ include
								file="../JavaScript/month.jsp"%></td>
						</tr>
						<tr>
							<td valign="middle" height="28" class="boldEleven">Year</td>
							<td valign="middle" class="boldEleven"><%@ include
								file="../JavaScript/year.jsp"%> <script
								language='JavaScript' type="text/javascript">
				<!--			
						var d=new Date()
						var month1=d.getMonth() + 1
						if(month1<10) month1="0"+month1;
						var year1=d.getFullYear();
						setOptionValue('Month',month1);
						setOptionValue('Year',year1);							
				//-->
          </script> <input name="noofmonth" type="hidden" id="noofmonth"
								value="0"></td>
						</tr>
						<tr>
							<td height="28" colspan="2" valign="middle" class="bolddeepblue"><!--DWLayoutEmptyCell-->&nbsp;</td>
						</tr>
						<tr>
							<td height="28" colspan="2" valign="middle" class="bolddeepblue">
							<div align="center">
							<table border="0" cellspacing="3" cellpadding="0">
								<tr>
									<td width="56"><input class="buttonbold14" type="submit"
										name="Submit2" value="Submit"   accesskey="s"   ></td>
									<td width="56"><input class="buttonbold14" type="Button"
										name="Submit"  value="Close"   accesskey="c" 
										onClick="redirect('Payrollmain.jsp')"></td>
								</tr>
							</table>
							</div>
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
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
</form>
<%@ include file="../footer.jsp"%>

</body>
</html>
