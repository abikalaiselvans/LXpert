<%@ page import="java.sql.*" isErrorPage="false" errorPage="./InValidSession.jsp"%>
<%@ page import="com.my.org.erp.common.*, com.my.org.erp.ServiceLogin.*"%>

<%!
	String sql;
%>
<html>
<head>
 

<title> :: PAYROLL ::</title>



<script language="JavaScript" src="../JavaScript/comfunction.js"></script>
<script language="JavaScript" src="../JavaScript/calendar1.js"></script>
<script language="javascript" src="../JavaScript/jquery/jquery-1.7.1.js"></script>
<script language="javascript" src="../JavaScript/jquery/ui/jquery.ui.core.js"></script>
<script language="javascript" src="../JavaScript/jquery/ui/jquery.ui.widget.js"></script>
<script language="javascript" src="../JavaScript/jquery/ui/jquery.ui.datepicker.js"></script>
<script>
 

$(function() {
		$( "#issuedate" ).datepicker({ minDate: -7, maxDate: "+7D" });
	});
 

	</script>
<link href="../JavaScript/jquery/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css">




<script language="javascript">

	
function validate()
{
	try
	{
		if(
			checkNullSelect('Month','Select Month','0') 
			&& checkNullSelect('Year','Select Year','0')
			&& checkNull('issuedate','Enter issue date')
			&& checkNullSelect('issuemode','Select issue mode','0')
			&& checkNullSelect('bankgroup','Select bank  ','0')
			&& checkNull('memo','Enter the description')
			
			
			 
		 )
				return true;
			else
				return false;
	}
	catch(err)
	{
		alert(err);
		return false;
	}		
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
.style3 {
	color: #FFFFFF;
	font-weight: bold;
}
-->
</style>
<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>

<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style>



</head>
<body  onpaste='return false;'>
<%@ include file="index.jsp"%>
<form  AUTOCOMPLETE = "off"   name="salfrm" action="ArrearIssueResponse.jsp" onSubmit="return validate()">
<p>&nbsp;</p>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td></td>
	</tr>
	<tr>
		<td>
		<table class="BackGround" cellspacing="0" cellpadding="0" width="250"
			align="center" border="0">
			<tbody>
				<tr>
					<td colspan="2" rowspan="2" valign="top"><img height="7"
						src="../Image/General/TLCorner.gif" width="7" /></td>
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
					<table width="500" height="95%" align="right" cellpadding="1"
						cellspacing="1"  1>
						<!--DWLayoutTable-->
						<tr>
							<td height="26" colspan="3" align="center" valign="middle"
								class="BackGround" >ARREAR ISSUE 						  </td>
						</tr>
						<tr>
							<td align=center class="boldgre"></td>
							 
						</tr>
						<tr>
							<td colspan="2" align="center"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
							<table width="85%" border="0" cellpadding="3" cellspacing="0"
								 >
								<tr>
									<td width="26%" class="boldEleven">Office <span
									class="bolddeepred">*</span></td>
									<td width="44%">  <%
			   	String branchid=""+session.getAttribute("BRANCHID");
	   			String oficeid=""+session.getAttribute("OFFICEID");
				 
			  %> <select name="Office" class="formText135" id="Office" style="width: 170"  >
										<option value="0">All</option>
										<%
								
		String sq=" select INT_OFFICEID,CHR_OFFICENAME from  com_m_office  order by CHR_OFFICENAME";

		String shipids[][] = CommonFunctions.QueryExecute(sq);
		for(int u=0; u<shipids.length; u++)
			if(shipids[u][0].trim().equals(oficeid.trim()))
				out.print("<option selected = 'selected' value='"+shipids[u][0]+"'>"+shipids[u][1] +"</option>");
			else
				out.print("<option value='"+shipids[u][0]+"'>"+shipids[u][1] +"</option>");
							%>
									</select>  </td>
							    </tr>
								<tr>
									<td class="boldEleven">Department <span
									class="bolddeepred">*</span></td>
									<td>
									<select name="dept" id="dept" class="formText135"  style="width: 170"  >
										<option value="0">All</option>
										<%
		sq="SELECT INT_DEPARTID,CHR_DEPARTNAME FROM   com_m_depart   ORDER BY  CHR_DEPARTNAME";
		String deptid[][] =  CommonFunction.RecordSetArray(sq);
		
		for(int u=0;u<deptid.length;u++)
			out.print("<option value='"+deptid[u][0]+"'>"+deptid[u][1]+"</option>"); 
	%>
									</select> </td>
							    </tr>
								<tr>
								  <td class="boldEleven">Category <span
									class="bolddeepred">*</span></td>
								  <td> 
								  <select name="Category" class="formText135" id="Category"  style="width: 170"  >
	<option value="0">All</option>
	<%
	String empcategorysql=" SELECT INT_EMPLOYEECATEGORYID,CHR_CATEGORYNAME  FROM   com_m_employeecategory   ORDER BY CHR_CATEGORYNAME ";
	String empcategoryData[][]= CommonFunctions.QueryExecute(empcategorysql);
	if (empcategoryData.length>0)
		for (int i=0; i<empcategoryData.length; i++) 
			out.println("<option value="+empcategoryData[i][0]+">"+empcategoryData[i][1] +"</option>");			
	
						%>
</select></td>
						      </tr>
								<tr>
									<td class="boldEleven">  Month <span
									class="bolddeepred">*</span></td>
									<td>
									
									<%@ include file="../JavaScript/month.jsp"%>									</td>
							    </tr>
								<tr>
									<td class="boldEleven">  Year <span
									class="bolddeepred">*</span></td>
									<td><%@ include file="../JavaScript/year.jsp"%>									</td>
							    </tr>
								<tr>
								  <td class="boldEleven">Issue Date  <span
									class="bolddeepred">*</span></td>
								  <td><span class="boldEleven">
								    <input tabindex="2"		name="issuedate" type="text" class="formText135" id="issuedate" size="15" readonly  required/><script language="javascript">setCurrentDate('issuedate')</script>
								  </span></td>
							  </tr>
								<tr>
								  <td class="boldEleven">Issue Mode  <span
									class="bolddeepred">*</span></td>
								  <td>
								  <select name="issuemode" id="issuemode"  required style="width: 170"  >
								  <option value="0">Select Issue Mode</option>
								  <option value="D">DD</option>
								  <option value="C">CHEQUE</option>
								   
								  <option value="N">NEFT</option>
								  <option value="R">RTGS</option>
								  
								  </select></td>
							  </tr>
								<tr>
								  <td class="boldEleven">Issue Bank Name <span
									class="bolddeepred">*</span></td>
								  <td><select name="bankgroup" id="bankgroup"
									style="width: 170"  required>
                                    <option value="0">Select Bank</option>
                                    <%
					   String banks[][]=CommonFunctions.QueryExecute("SELECT INT_BANKGROUPID, CHR_BANKGROUPNAME FROM com_m_bankgroup ORDER BY CHR_BANKGROUPNAME");
					  for(int u=0; u<banks.length;u++)
					  		out.println("<option value='"+banks[u][0]+"'>"+banks[u][1]+"</option>");
					  %>
                                  </select></td>
							  </tr>
								<tr>
								  <td class="boldEleven">Issue desc  <span
									class="bolddeepred">*</span></td>
								  <td><textarea onKeyUp="textArea('memo','200')" name="memo" cols="30"    onBlur="upperMe(this)"    rows="5" class="formText135" id="memo" tabindex="9" title="Please enter the part description" required ></textarea></td>
							  </tr>
								<tr>
								  <td class="boldEleven">&nbsp;</td>
								  <td>&nbsp; </td>
							  </tr>
							</table>							</td>
						</tr>
						
						<tr>
						  <td colspan="2" align="center"> </td>
					  </tr>
						<tr>
							<td colspan="2" align="center"><label> 
							 
							 </label></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
							<table border="0" cellspacing="0" cellpadding="3">
								<tr>
									<td width="56"><input name="Submit" type="submit"
										class="buttonbold" value="Issue"></td>
									<td width="56"><input name="Submit2" type="button"
										class="buttonbold"  value="Close"   accesskey="c" 
										onClick="redirect('SalaryIssueBefore.jsp')"></td>
								</tr>
							</table>							</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><!--DWLayoutEmptyCell-->&nbsp;							</td>
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
		<td></td>
	</tr>
	<tr>
		<td></td>
	</tr>
</table>
<p>&nbsp;</p>
<%@ include file="../footer.jsp"%></form>
</body>
</html>
