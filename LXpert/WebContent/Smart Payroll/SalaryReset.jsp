<%@ page import="java.sql.*" isErrorPage="false" errorPage="./InValidSession.jsp"%>
<%@ page import="com.my.org.erp.common.*"%>
<%!
	String sql;
%>
<html>
<head>
<title> :: PAYROLL ::</title>

<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style>
 
 
<script language="JavaScript" src="../JavaScript/comfunction.js"></script>
<script language="JavaScript" src="../JavaScript/calendar1.js"></script>
<script language="javascript">
 	 
function  Validate()
{
	try
	{
		if(
		  	checkNullSelect('Month','Select Month','0')
			&& checkNullSelect('Year','Select Year','0')
			
		  )
		  {
				var rs=confirm("Are you sure Reset the Salary Process");
				
				if (rs==true)
					return true;
				else
					return false;
			} 
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

 
<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
</head>
<body  onpaste='return false;'>
<%@ include file="index.jsp"%>
<form action="../SmartLoginAuth" method="post"   name="salfrm" onSubmit=" return Validate()"  AUTOCOMPLETE = "off">
<p>&nbsp;</p>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
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
					<table width="400" height="95%" align="right" cellpadding="1"
						cellspacing="1"  1>
						<!--DWLayoutTable-->
						<tr>
							<td height="26" colspan="3" align="center" valign="middle"
								class="BackGround" >SALARY RESET </td>
						</tr>
						<tr>
							<td align=center class="boldgre"></td>
							 
						</tr>
						<tr>
							<td colspan="2" align="center"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
							<table width="100%" border="0" cellpadding="3" cellspacing="0"
								 >
								 
								
								<tr class="bolddeepblue">
                                  <td height="23" valign="middle" class="boldEleven">Office<span class="boldred"> *</span> </td>
								  <td valign="top" class="bolddeepblue"><%
			   	String branchid=""+session.getAttribute("BRANCHID");
	   			String oficeid=""+session.getAttribute("OFFICEID");
				 
			  %>
                                      <select name="Office" class="formText135" id="Office"  style="width:200px">
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
                                    </select></td>
							  </tr>
								<tr class="bolddeepblue">
                                  <td height="22" valign="middle" class="boldEleven">Department<span class="boldred"> *</span> </td>
								  <td valign="top" class="bolddeepblue">
                                  <select name="dept" id="dept" class="formText135"  style="width:200px">
                                      <option value="0">All</option>
                                      <%
		sq="SELECT INT_DEPARTID,CHR_DEPARTNAME FROM   com_m_depart   ORDER BY  CHR_DEPARTNAME";
		String deptid[][] = CommonFunctions.QueryExecute(sq);
		
		for(int u=0;u<deptid.length;u++)
			out.print("<option value='"+deptid[u][0]+"'>"+deptid[u][1]+"</option>"); 
	%>
                                  </select></td>
							  </tr>
								
								<tr>
								  <td class="boldEleven">Category<span class="boldred"> *</span> </td>
								  <td> <select name="Category" class="formText135" id="Category"  style="width:200px">
	<option value="0">All</option>    
	<%
	String empcategorysql=" SELECT INT_EMPLOYEECATEGORYID,CHR_CATEGORYNAME  FROM   com_m_employeecategory   ORDER BY CHR_CATEGORYNAME ";
	String empcategoryData[][]=CommonFunctions.QueryExecute(empcategorysql);
	if (empcategoryData.length>0)
		for (int i=0; i<empcategoryData.length; i++) 
			out.println("<option value="+empcategoryData[i][0]+">"+empcategoryData[i][1] +"</option>");			
	
						%>

</select></td>
							  </tr>
								<tr>
								  <td class="boldEleven">Reset for <span class="boldred"> *</span> </td>
								  <td>
								  <select name="resetfor" class="formText135" id="resetfor"  style="width:200px">
								  <option value="0">All</option>
								  <option value="B">Salary Basic</option>
								  <option value="A">Salary Allowance</option>
								  <option value="R">Salary Recovery</option>
								  <option value="S">Salary</option>
								    </select>
								  </td>
							  </tr>
							  
							  
							  <tr>
									<td class="boldEleven">Month<span class="boldred"> *</span> </td>
									<td class="boldEleven"><%@ include file="../JavaScript/month.jsp"%>								  </td>
							  </tr>
								<tr>
									<td class="boldEleven">Year<span class="boldred"> *</span> </td>
									<td class="boldEleven"><%@ include file="../JavaScript/year.jsp"%>								  </td>
								</tr>
							</table>							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">							</td>
						</tr>
						 
						<tr>
							<td colspan="2" align="center"><label>
							<input name="filename" type="hidden" id="filename" value="SalaryReset">
                            <input name="actionS" type="hidden" id="actionS" value="PAYSalaryResetDelete">  
							 </label></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
							<table border="0" cellspacing="0" cellpadding="3">
								<tr>
									<td width="56"><input name="Submit" type="submit"
										class="buttonbold" value="Reset"></td>
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
