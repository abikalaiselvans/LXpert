
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="../JavaScript/AJAXFunction.js"></script>
<script src="../JavaScript/common/StaffloadAjax.js"></script>
<script language="JavaScript" src="../JavaScript/comfunction.js"></script>
<script language="JavaScript" src="../JavaScript/calendar1.js"> </script>
<script language="javascript">
 function Validate()
  {
  	if(checkNull("ename","Select Staff...") && checkNullSelect( "reportType","Select Export Type" ,'0') 
  	
	)
		return true;
	else
		return false;
  }
  
function mainPage()
{
	    document.payslipfrm.action="Payrollmain.jsp";
		document.payslipfrm.submit();
		return true;
}	
</script>
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

<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
<link href="../JavaScript/SmartStyles.css" rel="stylesheet" type="text/css">
</head>
<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
	onLoad="init()">

<%@ include file="index.jsp"%>
<!--PaySlipView.jsp-->
<form  AUTOCOMPLETE = "off"   name="payslipfrm" method="post"  action="../SmartLoginAuth" onSubmit="return Validate()">

<table width="100%" height="412" border="0" align="center"
	cellpadding="0" cellspacing="0">
	<tr>
		<td height="31">&nbsp;</td>
	</tr>
	<tr>
		<td>
		<table class="BackGround" cellspacing="0" cellpadding="0" width="390"
			align="center" border="0">
			<tbody>
				<tr>
					<td colspan="2" rowspan="2" valign="top"><img height="7"
						src="../Image/General/TLCorner.gif" width="7" /></td>
					<td class="BorderLine" height="0"><spacer height="1" width="1"
						type="block" /></td>
					<td colspan="2" rowspan="2" valign="top"><img height="7"
						src="../Image/General/TRCorner.gif" width="7" /></td>
				</tr>
				<tr>
					<td height="6"><spacer height="1" width="1" type="block" /></td>
				</tr>
				<tr>
					<td class="BorderLine" width="1"><spacer height="1" width="1"
						type="block" /></td>
					<td width="6"><spacer height="1" width="1" type="block" /></td>
					<td width="412">

					<table width="400" height="124" border="0" align="center"
						  class="bolddeepblue">
						<!--DWLayoutTable-->
						<tr align="center" valign="middle">
							<td width="390" height="28" colspan="3" align="center"
								valign="middle" class="boldgre">
							<div align="center">Appointment Order</div>
							</td>
						</tr>
						<tr align="center" valign="middle">
							<td height="29" colspan="3" valign="middle" class="BackGround"
								 >
								 
								 <%@ include file="../JavaScript/ajax.jsp"%>&nbsp;
								
								<%
								String data[][] = 	com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT INT_PFAMT,INT_ESIAMT,INT_CPY_PFAMT,INT_CPY_PENSIONAMT,INT_CPY_ESIAMT FROM  m_institution WHERE INT_ID=1");
								%>
								</td>
						</tr>

						<tr>
							<td height="28" valign="middle" class="bolddeepblue">
							<table width="92%" border="0" align="center" cellpadding="3"
								cellspacing="2">
								
								<tr>
									<td width="42%" class="boldEleven"><div align="left">Export Type <span class="bolddeepred">*</span>  </div></td>
									<td width="58%" colspan="2" class="boldEleven"><select name="reportType" id="reportType">
                                      <option value="0">Select Export Type</option>
                                      <option value="csv">CSV</option>
                                      <option value="xls">Excel</option>
                                      <option value="html">HTML</option>
                                      <option value="pdf" selected="selected">PDF</option>
                                      <option value="txt">Text</option>
                                      <option value="rtf">Word</option>
                                      <option value="xml">XML</option>
                                    </select></td>
								</tr>
								<tr>
								  <td class="boldEleven"><input name="filename" type="hidden" id="filename"
										value="Rept_JAppointmentOrder">
                                    <input name="actionS"
										type="hidden" id="actionS"
										value="PAYRept_JAppointmentOrder">
                                    <input name="rptfilename" type="hidden" id="rptfilename" value="Rept_JAppointmentOrder">
                                    <input name="subRptfilename1" type="hidden" id="subRptfilename1" value="Rept_JAppointmentOrder_subreport1"></td>
								  <td colspan="2" class="boldEleven">&nbsp;</td>
							  </tr>
								 
								<tr>
								  <td colspan="3" class="boldEleven">
								  
 



								  <!--Gross,Basic,Hr,Ta,Ga, Vall,Splall,Emprpf,Empresi, Ctcmonth, Emppf, Empesi,Takehome Ctc--></td>
							  </tr>
							</table>
							</td>
						</tr>
						<tr>
							<td height="29" valign="middle" class="bolddeepblue">
							<table border="0" align="center" cellpadding="3" cellspacing="3">
								<tr>
									<td width="56"><input name="Submit" type="submit"
										class="buttonbold14" value="Submit"   accesskey="s"   ></td>
									<td width="56"><input name="Button" type="Button"
										class="buttonbold14"  value="Close"   accesskey="c" 
										onClick="redirect('Payrollmain.jsp')"></td>
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
						src="../Image/General/BLCorner.gif" width="7" /></td>
					<td height="6"><spacer height="1" width="1" type="block" /></td>
					<td colspan="2" rowspan="2"><img height="7"
						src="../Image/General/BRCorner.gif" width="7" /></td>
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
		<td height="19">&nbsp;</td>
	</tr>
	<tr>
		<td height="37">&nbsp;</td>
	</tr>
</table>
</form>

<%@ include file="../footer.jsp"%>
</body>
</html>
