<%@ include file="index.jsp"%>
<html>
<head>
<title> :: PAYROLL ::</title>

<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
.style8 {font-family: Verdana;
	font-size: 12px;
}
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

<link href="../JavaScript/SmartStyles.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../JavaScript/comfunction.js"></script>
<script language="javascript" src="../JavaScript/smartcommon/LoadBranchAjax.js"></script> 
<script language="JavaScript">
function mainPage()
	{
	    document.f1.action="Payrollmain.jsp";
		document.f1.submit();
		return true;
    }
function Validate()
{
	if(checkNullSelect( "company","Select Company" ,'0')  && checkNullSelect('Month','Select Month','0') && checkNullSelect('Year','Select Year','0') && checkNullSelect( "reportType","Select Export Type" ,'0')  )
		return true;
	else
		return false;
}    
</script>

</head>
<form  AUTOCOMPLETE = "off"   name="f1" action="../SmartLoginAuth" onSubmit="return Validate()">
<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="64">&nbsp;</td>
	</tr>
	<tr>
		<td height="115" valign="bottom">
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

					<table width="350" height="263" border="0" align="center"
						cellpadding="2" cellspacing="2"  >
						<!--DWLayoutTable-->
						<tr align="center" valign="middle">
							<td height="27" colspan="2" class="BackGround" >Mess
							Details</td>
						</tr>
						<tr>
						  <td height="23" valign="middle" class="bolddeepblue"><!--DWLayoutEmptyCell-->&nbsp;</td>
						  <td><!--DWLayoutEmptyCell-->&nbsp;</td>
					  </tr>
						<tr>
							<td width="162" height="28" valign="middle" class="bolddeepblue style1">
							<span class="boldEleven">Company</span> <span class="bolddeepred">*</span> </td>
							<td width="161"><select name="company" id="company"
								onChange="loadBranch()" class="bolddeepblue" style="width:200px">
								<%                  
     					String queryBranch1="SELECT * FROM  com_m_company ";
     					String	branch1[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(queryBranch1);
     					for(int i=0;i<branch1.length;i++)
 	 						out.println("<option value='"+branch1[i][0]+"'>"+branch1[i][1]+"</option>");
 			   %>
							</select></td>
						</tr>
						<tr>
							<td width="162" height="28" valign="middle" class="bolddeepblue style1">
							<span class="boldEleven">Branch</span> <span class="bolddeepred">*</span> </td>
							<td width="161"><select name="branch" id="branch"
								class="bolddeepblue" style="width:200px">
								<option value="0">All</option>
							</select></td>
						</tr>
						<tr align="center" valign="middle">
							<td width="162" height="26" align="center" valign="middle"
								class="bolddeepblue">
							<div align="left" class="style1"><span class="boldEleven">Month</span> <span class="bolddeepred">*</span> </div>							</td>
							<td width="161" align="left" valign="middle"><%@ include
								file="../JavaScript/month.jsp"%></td>
						</tr>
						<tr>
							<td height="26" align="center" valign="middle"
								class="bolddeepblue">
							<div align="left" class="style1"><span class="boldEleven">Year</span> <span class="bolddeepred">*</span> </div>							</td>
							<td valign="top"><%@ include file="../JavaScript/year.jsp"%>
							<script language='JavaScript' type="text/javascript">
				<!--			
						var d=new Date()
						var month1=d.getMonth() + 1
						if(month1<10) month1="0"+month1;
						var year1=d.getFullYear();
						setOptionValue('Month',month1);
						setOptionValue('Year',year1);							
				//-->
            </script> <input type="hidden" name="filename" value="MessBill">
							<input type="hidden" name="actionS" value="PAYMessBillMonthView">
							<input type="hidden" name="view" value="MessBill"></td>
						</tr>
						<tr>
						  <td height="26" align="center" valign="middle"
								class="bolddeepblue style1"><div align="left"><span class="boldEleven">Export Type</span> <span class="bolddeepred">*</span> </div></td>
						  <td valign="top"><span class="boldEleven">
						    <select name="select">
                              <option value="0">Select Export Type</option>
                              <option value="csv">CSV</option>
                              <option value="xls">Excel</option>
                              <option value="html">HTML</option>
                              <option value="pdf">PDF</option>
                              <option value="txt">Text</option>
                              <option value="rtf">Word</option>
                              <option value="xml">XML</option>
                            </select>
						  </span></td>
					  </tr>
						<tr>
						  <td height="23" align="center" valign="middle"
								class="bolddeepblue"><!--DWLayoutEmptyCell-->&nbsp;</td>
						  <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
					  </tr>
						<tr>
							<td height="26" colspan="2" align="center" valign="middle"
								class="bolddeepblue">
							<table border="0" align="center" cellpadding="2" cellspacing="2">
								<tr>
									<td width="56" valign="bottom"><input class="buttonbold14"
										type="submit" name="Submit" value="Submit"   accesskey="s"   ></td>
									<td width="56" valign="bottom"><input class="buttonbold14"
										type="Button" name="Submit"  value="Close"   accesskey="c" 
										onClick="redirect('Payrollmain.jsp')"></td>
								</tr>
							</table>							</td>
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
		<td height="56">&nbsp;</td>
	</tr>
	<tr>
		<td height="67">&nbsp;</td>
	</tr>
</table>
<%@ include file="../footer.jsp"%>
</body>
</form>
</html>