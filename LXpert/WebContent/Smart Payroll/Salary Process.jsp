<%@ page import="java.sql.*" isErrorPage="false" errorPage="./InValidSession.jsp"%>
<%@ page import="com.my.org.erp.common.*, com.my.org.erp.ServiceLogin.*"%>
<%@ page import="com.my.org.erp.common.CommonFunctions"%>
<%
try
{
%>

<%!
	String sql;
%>
<html>
<head>
 <title> :: PAYROLL ::</title>



<script language="JavaScript" src="../JavaScript/comfunction.js"></script>
<script language="JavaScript" src="../JavaScript/calendar1.js"></script>

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

<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style>



</head>
<body  onpaste='return false;'>
<%@ include file="index.jsp"%>
<form  AUTOCOMPLETE = "off"   name="salfrm" action="../SmartLoginAuth" onSubmit="return validate()">
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
					<td width="412" align="center">
					<table width="400" height="95%" align="right" cellpadding="1"
						cellspacing="1"  1>
						<!--DWLayoutTable-->
						<tr>
							<td height="26" colspan="3" align="center" valign="middle"
								class="BackGround" >
								<%
								String filename= "";
								String SData[][] =  CommonFunctions.QueryExecute("SELECT CHR_SALAYCALCULATION FROM  pay_m_basicsettings WHERE INT_ID=1");
								if("MTH".equals(SData[0][0]))
								{
									out.println("<h1> MONTH BASED SALARY PROCESS</h1>");
									filename= "SalaryProcessMonth";//NewSalaryProcessMonth
								}
								else if("CTC".equals(SData[0][0]))
								{
									out.println("<h1>CTC BASED SALARY PROCESS</h1>");	
									filename= "SalaryProcess";
								}
								else if("WRK".equals(SData[0][0]))
								{
									out.println("<h1>WORKING DAYS BASED SALARY PROCESS</h1>");	
									filename= "SalaryProcessWork";
								}
								%>								</td>
						</tr>
						<tr>
							<td align=center class="boldgre"></td>
							<!--<td width="242" align=center class="boldgre"><div align="center" class="bolddeepblue">
            <input type="radio" id="date1" name="reportType" value="Date" onClick="disableYearWise()" >
            DateWise</div></td>-->
						</tr>
						<tr>
							<td colspan="2" align="center"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
							<table width="100%" border="0" cellpadding="3" cellspacing="0"
								 >
								<tr>
									<td width="29%" class="boldEleven">Office <span class="boldred">*</span></td>
									<td width="55%">  <%
			   	String branchid=""+session.getAttribute("BRANCHID");
	   			String oficeid=""+session.getAttribute("OFFICEID");
				 
			  %> <select name="Office" class="formText135" id="Office" style="width:150">
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
								  </select>  </td>
								    <td width="16%">&nbsp;</td>
								</tr>
								<tr>
									<td class="boldEleven">Department <span class="boldred">*</span></td>
									<td>
									<select name="dept" id="dept" class="formText135"  style="width:150">
										<option value="0">All</option>
										<%
		sq="SELECT INT_DEPARTID,CHR_DEPARTNAME FROM   com_m_depart   ORDER BY  CHR_DEPARTNAME";
		String deptid[][] =  CommonFunction.RecordSetArray(sq);
		
		for(int u=0;u<deptid.length;u++)
			out.print("<option value='"+deptid[u][0]+"'>"+deptid[u][1]+"</option>"); 
	%>
									</select> </td>
								    <td>&nbsp;</td>
								</tr>
								<tr>
								  <td class="boldEleven">Category <span class="boldred">*</span></td>
								  <td> 
								  <select name="Category" class="formText135" id="Category"  style="width:150">
	<option value="0">All</option>
	<%
	String empcategorysql=" SELECT INT_EMPLOYEECATEGORYID,CHR_CATEGORYNAME  FROM   com_m_employeecategory   ORDER BY CHR_CATEGORYNAME ";
	String empcategoryData[][]= CommonFunctions.QueryExecute(empcategorysql);
	if (empcategoryData.length>0)
		for (int i=0; i<empcategoryData.length; i++) 
			out.println("<option value="+empcategoryData[i][0]+">"+empcategoryData[i][1] +"</option>");			
	
						%>
</select></td>
							      <td><table width="60%" border="0" cellpadding="0" cellspacing="0" class="boldEleven">
                                    <tr>
                                      <td><input type="checkbox" name="lucas"  id="lucas" value="lucas" onClick="AssignSalary()">
									  <script language="javascript">
									  function AssignSalary()
									  {
									  		if(document.getElementById('lucas').checked)
											{
												document.getElementById('filename') = "SalaryProcessLucas";
											}
											else
											{
												document.getElementById('filename') = "<%=filename.trim()%>";
											}
									  }
									  </script>									  </td>
                                      <td><p>Labor</p></td>
                                    </tr>
                                  </table></td>
							  </tr>
								<tr>
									<td class="boldEleven">Select Month <span class="boldred">*</span></td>
									<td>
									
									<%@ include file="../JavaScript/month.jsp"%>									</td>
								    <td>&nbsp;</td>
								</tr>
								<tr>
									<td class="boldEleven">Select Year <span class="boldred">*</span></td>
									<td><%@ include file="../JavaScript/year.jsp"%>									</td>
								    <td>&nbsp;</td>
								</tr>
								<tr>
								  <td class="boldEleven">Check Attendance </td>
								  <td><input name="attendancecheck" type="checkbox" id="attendancecheck" value="Y"></td>
								  <td>&nbsp;</td>
							  </tr>
								<tr>
								  <td class="boldEleven">Attendance Cycle  <span class="boldred">*</span></td>
								  <td>
								  <select name="attendancecycle" id="attendancecycle" class="formText135">
											<option value="0"  selected="selected">Select Attendance Cycle</option>
											<option value="1">1-31</option>
											<option value="2">20th to 19th</option>
                                  </select>											</td>
							      <td>&nbsp;</td>
							  </tr>
							</table>							</td>
						</tr>
						
						<tr>
						  <td colspan="2" align="center"><%
								String s =""+request.getParameter("er");
								if(!"null".equals(s))
									out.println("<font class='boldred'>"+s+"</font>");
							%></td>
					  </tr>
						<tr>
							<td colspan="2" align="center">  
							<input type="hidden" name="filename" id="filename"  value="<%=filename.trim()%>"> 
							<input type="hidden" name="actionS" value="PAYSalary"> </label></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
							<table border="0" cellspacing="0" cellpadding="3">
								<tr>
									<td width="56"><input name="Submit" type="submit"
										class="buttonbold" value="Calculate"></td>
									<td width="56"><input name="Submit2" type="button"
										class="buttonbold"  value="Close"   accesskey="c" 
										onClick="redirect('Payrollmain.jsp')"></td>
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

<script language="javascript">


function validate()
{
	try
	{
		if(
			checkNullSelect('Month','Select Month','0') 
			&& checkNullSelect('Year','Select Year','0')
			&& checkNullSelect('attendancecycle','Select attendancecycle','0')
			&& LucasAlert()
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
	
function LucasAlert()
{
	try
	{
		if(document.getElementById('lucas').checked)
		{
			var rs=confirm("YOU ARE PROCESSING THE LABOR SALARY.....");
			if (rs==true)
				return true;
			else
				return false;	
		}
		else
		{
			return true;
		}
	}
	catch(err)
	{
		alert(err);
		return false;
	}	
}	
	
	
</script>

<p>&nbsp;</p>
<%@ include file="../footer.jsp"%></form>
</body>
</html>
<%
}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>