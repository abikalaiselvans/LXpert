 <%@ page import="java.sql.*,java.util.*,java.io.*"%>
<html>
<head>

<title> :: COMMON ::</title>


 
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
@import url("../JavaScript/SmartStyles.css");
-->
</style>



</head>
<script language="javascript" src="../JavaScript/comfunction.js">
</script>

<!--../JavaScript/smartcommon/BranchAjax.js-->
<script language="javascript" src="../JavaScript/Attendance/ReportAjax.js"  ></script>

<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%@ include file="index.jsp"%>
<form  AUTOCOMPLETE = "off"   action="Rept_StaffCTCResponse.jsp" method="post" name="frm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
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
					<table width="519" border="0" cellspacing="0" cellpadding="3"
						 >
						<!--DWLayoutTable-->
						<tr align="center" valign="middle">
							<td height="18" colspan="2"  class="BackGround">STAFF CTC INFORMATIONS
							
							<%
			   	    String branchid=""+session.getAttribute("BRANCHID");
	   			   String offid=""+session.getAttribute("OFFICEID");
				   String usertype=""+session.getAttribute("USRTYPE");
				   String userid=""+session.getAttribute("USRID");
				   String category=""+session.getAttribute("CATEGORY");
			  %>							 </td>
						    <td width="46" height="18"  class="BackGround"><!--DWLayoutEmptyCell-->&nbsp;</td>
						</tr>
						<tr class="bolddeepblue">
							<td width="159" height="19" valign="middle" class="boldEleven">Company</td>
							<td valign="top" class="boldEleven"><select name="company"
								id="company" onChange="loadBranch()" class="formText135"
								style="width:200px">
								<option value="0">All</option>
								<%                  
     					 
     					String	branch1[][]=com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT INT_COMPANYID,CHR_COMPANYNAME FROM  com_m_company ORDER BY CHR_COMPANYNAME");
     					for(int i=0;i<branch1.length;i++)
 	 						out.println("<option value='"+branch1[i][0]+"'>"+branch1[i][1]+"</option>");
 			   %>
							</select></td>
							<td valign="top" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
						</tr>
						<tr class="bolddeepblue">
							<td height="19" valign="middle" class="boldEleven">Branch</td>
							<td valign="top" class="boldEleven"><span class="tabledata">
							<select name="branch" id="branch" class="formText135"
								style="width:200px">
								<option value="0">All</option>
							</select> </span></td>
							<td valign="top" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
						</tr>
						<tr class="bolddeepblue">
							<td height="19" valign="middle" class="boldEleven">Office</td>
							<td valign="top" class="boldEleven">
							 
							 
							 <select name="Office" class="formText135" id="Office">
								<option value="0">All</option>
								<%
								
		 String OfficeData[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(" SELECT b.INT_OFFICEID,b.CHR_OFFICENAME FROM  com_m_office  b WHERE b.INT_OFFICEID IN("+com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT a.CHR_OFFICELIST FROM m_user a WHERE a.CHR_USRNAME='"+userid+"' ")[0][0]+" )");
 if(OfficeData.length>0)
 	for(int u=0;u<OfficeData.length;u++)
		out.println("<option value='"+OfficeData[u][0]+"'>"+OfficeData[u][1]+"</option>"); 
 %>
	  </select><script language="javascript">setOptionValue('Office','<%=offid%>')</script></td>
							<td valign="top" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
						</tr>
						<tr class="bolddeepblue">
						  <td valign="middle" class="boldEleven">Department</td>
							<td width="296" valign="top" class="boldEleven"><select
								name="dept" id="dept" class="formText135">
                                <option value="0">All</option>
                                <%
	
		String deptid[][] = com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT INT_DEPARTID,CHR_DEPARTNAME FROM com_m_depart ORDER BY CHR_DEPARTNAME");
		
		for(int u=0;u<deptid.length;u++)
			out.print("<option value='"+deptid[u][0]+"'>"+deptid[u][1]+"</option>"); 
	%>
                            </select></td>
							<td valign="top" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
						</tr>
						<tr class="bolddeepblue">
						  <td class="boldEleven">Category</td>
						  <td class="boldEleven"><select name="Category" class="formText135" id="Category"  >
                            <option value='0' >All</option>
                            <%
 
String empcategoryData[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(" SELECT b.INT_EMPLOYEECATEGORYID,b.CHR_CATEGORYNAME FROM  com_m_employeecategory  b WHERE b.INT_EMPLOYEECATEGORYID IN("+com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT a.CHR_GATEGORYLIST  FROM m_user a WHERE a.CHR_USRNAME='"+userid+"' ")[0][0]+" )");
 if(empcategoryData.length>0)
 	for(int u=0;u<empcategoryData.length;u++)
		out.println("<option value='"+empcategoryData[u][0]+"'>"+empcategoryData[u][1]+"</option>");
 %>
                          </select></td>
						  <td valign="top" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
					  </tr>
						<tr class="bolddeepblue">
						  <td class="boldEleven">Resigned</td>
						  <td class="boldEleven"><table width="32%" border="0" cellspacing="2" cellpadding="1">
                            <tr>
                              <td class="boldEleven"><input name="Resigned" type="radio" value="Y"></td>
                              <td class="boldEleven">Yes</td>
                              <td class="boldEleven"><input name="Resigned" type="radio" value="N" checked></td>
                              <td class="boldEleven">No</td>
                            </tr>
                          </table></td>
						  <td valign="top" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
					  </tr>
						<tr class="bolddeepblue">
						  <td class="boldEleven">Order by</td>
							<td class="boldEleven"><select name="sorting" class="formText135">
                                <option value="a.CHR_EMPID ">Empid</option>
                                <option value="a.CHR_STAFFNAME">Staff Name</option>
                            </select></td>
							<td valign="top" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
						</tr>
						<tr class="bolddeepblue">
						  <td class="boldEleven"><span class="boldEleven">Sorted
						    By </span></td>
						  <td class="boldEleven"><select name="ss" class="formText135">
                              <option value="asc">Ascending</option>
                              <option value="desc">Descending</option>
                          </select></td>
						  <td valign="top" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
					  </tr>
						 
						<tr>
							<td height="28" colspan="3" valign="middle" class="bolddeepblue">
							<table width="142" border="0" align="center" cellpadding="3"
								cellspacing="3">
								<tr>
									<td width="61"><input name="Submit2" type="submit"
										class="buttonbold" id="submit" value="Submit"   accesskey="s"   ></td>
									<td width="60"><input class="buttonbold" type="button"
										name="Submit"  value="Close"   accesskey="c" 
										onClick="redirect('Rept_Staff.jsp')"></td>
								</tr>
							</table>							</td>
						</tr>
						<tr>
							<td height="2"></td>
							<td colspan="2"></td>
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
<p><%@ include file="../footer.jsp"%></p>
</body>
</html>
