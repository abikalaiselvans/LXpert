<%@ page import="java.io.*,java.util.*"%>
<%@ include file="index.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.my.org.erp.bean.Designation"%>
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

<script language="JavaScript" src="../JavaScript/comfunction.js"></script>
<script language="javascript"
	src="../JavaScript/Attendance/ReportAjax.js"></script>
<script language="JavaScript">
  function Validate()
  {
  	if(checkNullSelect("Designation","Select The Designation","select")){
  	    document.a.action="../SmartLoginAuth";
		document.a.submit();
		return true;
	}
	return false;
  }
  
  function mainPage()
  {
	    document.a.action="AttendanceMain.jsp";
		document.a.submit();
		return true;
  }

 
</script>
<style type="text/css">
<!--
.style8 {
	font-family: Verdana;
	font-size: 12px;
	font-weight: bold;
}
a:visited {
	color: #663366;
}
a:hover {
	color: #FF0000;
}
a:active {
	color: #0000FF;
}
-->
</style>
</head>
<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form  AUTOCOMPLETE = "off"   name="a" action="../SmartLoginAuth" onSubmit="return Validate()">

<br>
<br>

<%
	String viewType=request.getParameter("view");
	// ?filename=Report&actionS=COM_ATTdesigList&view="<%=viewType 
%> <br>
<table width="1002">
	<!--DWLayoutTable-->
	<tr>
		<td width="268" height="20">
		<td width="154">
		<td width="48">
		<td width="46">
		<td width="176">
		<td width="268">
	<tr>
		<td height="87">
		<td colspan="4" valign="top">
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
					<td width="412" height="30">

					<table align="center" border="0"  >
						<!--DWLayoutTable-->
						<tr align="center" valign="middle">
							<td height="30" colspan="2" class="BackGround" >Personal
							Details - Designation Wise</td>
						</tr>
						<tr>
							<td width="188" height="30" valign="middle" class="tabledata">
							Company</td>
							<td width="193"><select name="company" id="company"
								onChange="loadBranch()" class="tabledata" style="width:200px">
								<%                  
     					String queryBranch1="SELECT * FROM  com_m_company ";
     					String	branch1[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(queryBranch1);
     					for(int i=0;i<branch1.length;i++)
 	 						out.println("<option value='"+branch1[i][0]+"'>"+branch1[i][1]+"</option>");
 			   %>
							</select></td>
						</tr>
						<tr>
							<td width="188" height="30" valign="middle" class="tabledata">
							Branch</td>
							<td width="193"><select name="branch" id="branch"
								class="tabledata" style="width:200px">
								<option value="-1">All</option>
							</select></td>
						</tr>
						<tr>
							<td height="30" valign="middle" class="tabledata">Designation</td>
							<td valign="middle"><select name="Designation"
								class="tabledata">
								<option value="-1">All</option>
								<%
            ArrayList designationList=(ArrayList) session.getAttribute("designationList");
  			for(int i=0;i<designationList.size();i++)
  			{
  				Designation designation= (Designation)designationList.get(i);

		%>
								<option value="<%= designation.getDesigId() %>">
								<% out.println(designation.getDesigName()); %>
								</option>
								<%
			}
		%>
							</select></td>
						</tr>
						<tr>
							<td height="21" colspan="2" valign="middle" class="tabledata"><!--DWLayoutEmptyCell-->&nbsp;</td>
						</tr>
					</table>
					<div align="center">
					<table border="0" cellspacing="3" cellpadding="3">
						<tr>
							<td width="56"><input name="Submit" type="submit"
								class="buttonbold14" value="Submit"   accesskey="s"   ></td>
							<td width="56"><input name="Button" type="Button"
								class="buttonbold14" onClick="redirect('Payrollmain.jsp')"
								 value="Close"   accesskey="c" ></td>
						</tr>
					</table>
					</div>
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

		<input type="hidden" name="filename" value="Report"> <input
			type="hidden" name="actionS" value="COM_ATTdesigList"> <input
			type="hidden" name="view" value="<%=viewType%>">
		<td>
	<tr>
		<td height="26">
		<td>
		<td valign="top">
		<td valign="top">
		<td>
		<td>
	<tr>
		<td height="15">
		<td>
		<td>
		<td>
		<td>
		<td>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
<a href="SmartAttendanceImg.htm"> <%@ include file="../footer.jsp"%></form>
</body>
</html>
