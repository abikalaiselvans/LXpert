<%@ page import="java.sql.*,java.util.*,java.io.*"%>
<html>
<head>

<title> :: COMMON ::</title>

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

<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
</head>
<script language="javascript" src="../JavaScript/comfunction.js"></script>\


<link href="../DropDown - Image/msdropdown/dd.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../DropDown - Image/msdropdown/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../DropDown - Image/msdropdown/js/uncompressed.jquery.dd.js"></script>
<script language="JavaScript" src="../JavaScript/comfunction.js"></script>

<script language="javascript">
function validate()
{
	 	if(  
		checkNullSelect( "reportType","Select Export Type" ,'0') 
		
	  )
		return true;
	else
		return false;		  
}

</script>
<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
 <%@ include file="index.jsp"%> 
<form  AUTOCOMPLETE = "off"   action="../SmartLoginAuth" method="post" name="frm" onSubmit="return validate()">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
		<table class="BackGround" cellspacing="0" cellpadding="0" width="445"
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
					<td width="429">
					<table width="426" border="0" align="center" cellpadding="3" cellspacing="0"
						 >
						<!--DWLayoutTable-->
						<tr align="center" valign="middle">
							<td height="18" colspan="3"  class="BackGround">PF INFORMATIONS </td>
						</tr>
						<tr class="bolddeepblue">
						  <td height="31" valign="middle" class="boldEleven">Company</td>
						  <td valign="top" class="boldEleven"><select name="company" id="company" 
								class="formText135" style="width:200px">
                            
                            <%                  
     					String queryBranch1="SELECT * FROM  com_m_company ";
     					String	branch1[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(queryBranch1);
     					for(int i=0;i<branch1.length;i++)
 	 						out.println("<option value='"+branch1[i][0]+"'>"+branch1[i][1]+"</option>");
 			   %>
                                                                                                                                  </select></td>
					      <td valign="top" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
					  </tr>
						<tr class="bolddeepblue">
							<td width="102" height="29" valign="middle" class="boldEleven">Office</td>
							<td valign="top" class="boldEleven">
							<%
			   	String branchid=""+session.getAttribute("BRANCHID");
	   			String oficeid=""+session.getAttribute("OFFICEID");
				 
			  %> <select name="Office" class="formText135" id="Office" style="width:200px">
								<option value="0">All</option>
								<%
								
		String sq=" select INT_OFFICEID,CHR_OFFICENAME from  com_m_office  order by CHR_OFFICENAME";

		String shipids[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(sq);
		for(int u=0; u<shipids.length; u++)
			if(shipids[u][0].trim().equals(oficeid.trim()))
				out.print("<option selected = 'selected' value='"+shipids[u][0]+"'>"+shipids[u][1] +"</option>");
			else
				out.print("<option value='"+shipids[u][0]+"'>"+shipids[u][1] +"</option>");
							%>
							</select></td>
						    <td valign="top" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
						</tr>
						<tr class="bolddeepblue">
							<td height="36" valign="middle" class="boldEleven">Department</td>
							<td width="250" valign="top" class="boldEleven"><select
								name="dept" id="dept" class="formText135" style="width:200px">
								<option value="0">All</option>
								<%
		sq="SELECT INT_DEPARTID,CHR_DEPARTNAME FROM   com_m_depart   ORDER BY  CHR_DEPARTNAME";
		String deptid[][] = com.my.org.erp.common.CommonFunction.RecordSetArray(sq);
		
		for(int u=0;u<deptid.length;u++)
			out.print("<option value='"+deptid[u][0]+"'>"+deptid[u][1]+"</option>"); 
	%>
							</select></td>
							<td width="55" valign="top" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp; </td>
						</tr>
						<tr>
							<td height="28" class="boldEleven">Order by</td>
							<td class="boldEleven"><select name="sorting" class="formText135" style="width:200px">
								<option value="a.CHR_EMPID ">Empid</option>
								<option value="a.CHR_STAFFNAME">Staff Name</option>
							</select></td>
						    <td class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
						</tr>
						<tr>
							<td height="30" class="boldEleven"><span class="boldEleven">Sorted
							By </span></td>
							<td class="boldEleven"><select name="ss" class="formText135" style="width:200px">
								<option value="asc">Ascending</option>
								<option value="desc">Descending</option>
							</select></td>
						    <td class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
						</tr>
						<tr>
						  <td height="30" class="boldEleven">With Resigned</td>
						  <td class="boldEleven"><input name="Resigned" type="checkbox" class="formText135" id="Resigned" value="Y"></td>
						  <td class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
					  </tr>
						<tr>
						  <td height="30" class="boldEleven">Export Type <font
																class="bolddeepred" align="absmiddle">*</font></td>
						  <td class="boldEleven"><script language="javascript" type="text/javascript">
	$(document).ready(function() 
	{
		try 
		{
			$("#reportType").msDropDown();
			
		} 
		catch(e) 
		{
				
		}
	}
	)
                          </script>
                              <select name="reportType" id="reportType" style="width:200px;" >
                                <option value="0" title="../DropDown - Image/icons/export.jpg" selected="selected">Export Type</option>
                                <option value="csv" title="../DropDown - Image/icons/csv.jpg">CSV </option>
                                <option value="xls" title="../DropDown - Image/icons/excel.jpg">Excel </option>
                                <option value="html" title="../DropDown - Image/icons/html.jpg">Html </option>
                                <option value="pdf" title="../DropDown - Image/icons/pdf.jpg">Pdf </option>
                                <option value="rtf" title="../DropDown - Image/icons/rtf.jpg">Rtf </option>
                                <option value="txt" title="../DropDown - Image/icons/txt.jpg">Txt </option>
                                <option value="xml" title="../DropDown - Image/icons/xml.jpg">Xml </option>
                            </select></td>
						  <td class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
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
										onClick="javascript:window.close()"></td>
								</tr>
							</table>							
							<span class="boldEleven">
							<input name="filename" type="hidden" id="filename"
										value="StaffPFInfo">
                            <input name="actionS"
										type="hidden" id="actionS"
										value="RPTStaffPFInfo">
                            <input name="rptfilename" type="hidden" id="rptfilename" value="PageWidth2040">
							</span></td>
						</tr>
						<tr>
							<td height="2"></td>
							<td colspan="2"></td>
						</tr>
					</table>
				  </td>
					<td nowrap="nowrap" width="8"><spacer height="1" width="1"
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
