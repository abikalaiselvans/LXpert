<%@ page import="java.io.*,java.util.*" isErrorPage="false" errorPage="../error/error.jsp"%>
<%@ page import="com.my.org.erp.common.CommonFunctions"%>
<%@ page import="org.apache.commons.lang.ArrayUtils"%>
<html>
<head>
<title>:: INVENTORY ::</title><link rel="icon" type="image/ico" href="../images/ERP.ico"></link>
<link rel="shortcut icon" href="../images/ERP.ico"></link>
  
<style type="text/css">
@import url("../bootstrap/css/bootstrap.min.css");
@import url("../JavaScript/SmartStyles.css");
</style>
<script src="../bootstrap/js/jquery.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>

<meta http-equiv="refresh" content="300"/>
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
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="javascript" src="../JavaScript/Inventory/POBilling.js"></script>
<script language="JavaScript">

     
	function Edit()
 	{		
		var count;
		count=0;
		coffee1=document.forms[0].rowid
		txt=""
		for (i=0;i<coffee1.length;++ i)
		{
			if (coffee1[i].checked)
			{
			count=count+1;
			}
		}
		if(count==0)
		{
			if (document.forms[0].rowid.checked) { count=1;}
		}
		if(count==1){			
			document.frm.action="POBillingAdd.jsp ";
			return true;
		}
		else
		{
		    alert("Select Only one Value");
		    return false;
		}
 	}	

 	 
 	  
 



function  Delete()
 	{		
		obj = findObj("id"); 
		if(obj == null)
		{
			alert("Delete not available");
			return false;
		}


		var count;
		count=0;
		coffee1=document.forms[0].id
		txt=""
		for (i=0;i<coffee1.length;++ i)
		{
			if (coffee1[i].checked)
			{
			count=count+1;
			}
		}
		if(count==0)
		{
			if (document.forms[0].id.checked) { count=1;}
		}
		if(count>=1){			
			var name=confirm("Confirm to Delete")
			if (name==true)
			{ 
				document.frm.action="../SmartLoginAuth";
				document.frm.submit();
				return true;			
			}
			else
				return false;
		}
		else
		{
		    alert("Select Atleast One Value");
		    return false;
		}		
 	}
	
</script>

<body    onLoad="loadPOBilling('0')">
<%@ include file="indexinv.jsp"%>
 
<form  AUTOCOMPLETE = "off"   method="get" name='frm' action="../SmartLoginAuth" >
<table width="100%" border="0" cellspacing="1" cellpadding="1">
	<tr>
		<td>&nbsp;</td>
	</tr>
	 
	<tr>
		<td>
		<table height="231" align="center"
			cellpadding="0" cellspacing="0" class="TableDesign"  >
			<tr >
				<td height="23" class="whiteHead" >
			  <div align="center">CUSTOMER PURCHASE ORDER BILLING   </div>				</td>
			</tr>
			<tr >
				<td height="28" >
				<div align="center">
				  <table width="100%" border="0" cellpadding="4" cellspacing="4" class="whiteMedium">
                    <tr>
                      <td height="19" colspan="8" ><table height="19"   border="0" align="center" cellpadding="3" cellspacing="2">
                        <tr>
                          <td class="whiteMedium">Search by CPO/Customer</td>
                          <td class="whiteMedium"><input name="search" type="text" class="formText135" id="search" maxlength="10" onKeyUp="loadPOBillings(this)" ></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="19" >Division</td>
                      <td ><select
							name="division" class="formText135" id="division" tabindex="1"
							onChange="loadPOBilling('0')" style="width:150">
                        <option value='0'>All</option>
                        <%
								String division[][] = com.my.org.erp.common.CommonFunctions.QueryExecute("Select INT_DIVIID,CHR_DIVICODE from inv_m_division   WHERE INT_DIVIID >0 AND CHR_OFFICEIDS LIKE '%"+session.getAttribute("INVOFFICEID")+"%'  ORDER BY CHR_DIVICODE"); 
								for(int u=0; u<division.length; u++)
									out.print("<option value='"+division[u][0]+"'>"+division[u][1]  +"</option>");
							%>
                      </select></td>
                      <td>Cancel</td>
                      <td><select name="cancel" class="formText135" id="cancel"  onBlur="loadPOBilling('0') "  >
                        <option value="0">All</option>
                        <option value="N" selected="selected">Live</option>
                        <option value="Y">Cancell</option>
                      </select></td>
                      <td >Status</td>
                      <td ><select name="status" class="formText135" id="status"  onBlur="loadPOBilling('0') ">
                        <option value="0">All</option>
                        <option value="N" selected="selected">Pending</option>
                        <option value="Y">Completed</option>
                        <option value="P">Partial</option>
                      </select></td>
                      <td >&nbsp;</td>
                      <td >&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="19" >Customer</td>
                      <td ><select
							name="customer" id="customer" class="formText135"
							onChange="loadPOBilling('0')" style="width:150">
                          <option value="0">All</option>
                          <jsp:include page="LoadCustomer.jsp" />                    
                      </select></td>
					  <td>Day</td>
                <td><select name="day" class="formText135" id="day" style="width:50"  onBlur="loadPOBilling('0') ">
                  <option value="0" selected>All</option>
                  <%
						for(int u=1;u<32;u++)
							out.println("<option value='"+(u)+"'>"+u+"</option>");
						%>
                </select></td>
                      <td >Month</td>
                      <td ><select name="month" class="formText135" id="month" onChange="loadPOBilling('0')">
                        <option value="0" selected>All</option>
						<%@ include file="../JavaScript/Inventory/month.jsp"%>
                      </select></td>
                      <td >Year</td>
                      <td ><select name="year" class="formText135" id="year"
					onChange="loadPOBilling('0')">
                        <%@ include file="../JavaScript/Inventory/year.jsp"%>
                      </select>
			  <script language='JavaScript' type="text/javascript">
						 	
						var d=new Date()
						var month1=d.getMonth() + 1
						if(month1<10) month1="0"+month1;
						var year1=d.getFullYear();
						var day=d.getDate();
						//setOptionValue('day',day);	
						//setOptionValue('month',month1);
						setOptionValue('year',year1);	
				</script>					  </td>
                    </tr>
                  </table>
			  </div>				</td>
			</tr>
			 
			<tr class="MRow1">
				<td height="127" valign="top" class="footermenu">
				 
						<div id="divscroll" style="OVERFLOW:auto;width:100%;height:300px" >
						<div id="loadPOVerificationTable"></div>
						</div> 
						<br>
							<div align="center" id="totRec"></div>
						<br>				</td>
		  </tr>
		</table>		</td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
    </tr>
	<tr>
		<td>
		<table border="0" align="center" cellpadding="1"
			cellspacing="1" class="TableDesign"  >
			<tr class="para">
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('0')">All</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('A')">A</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('B')">B</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('C')">C</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('D')">D</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('E')">E</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('F')">F</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('G')">G</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('H')">H</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('I')">I</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('J')">J</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('K')">K</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('L')">L</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('M')">M</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('N')">N</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('O')">O</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('P')">P</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('Q')">Q</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('R')">R</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('S')">S</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('T')">T</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('U')">U</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('V')">V</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('W')">W</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('X')">X</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('Y')">Y</a></div>				</td>
				<td >
				<div align="center"><a class="whiteMedium" href="javascript:loadPOBilling('Z')">Z</a></div>				</td>
			</tr>
		</table>		</td>
	</tr>
	<tr>
		<td><input name="filename" type="hidden" />
		<input name="actionS" type="hidden" /></td>
	</tr>
	<tr>
		<td>
		 <%
			out.println("<table   border='0' align='center' cellpadding='1' cellspacing='1'>");
			out.println("<tr>");
			 
			 
			
			out.println("<td ' valign='top'>");
			if("Y".equals(CommonFunctions.QueryExecute("SELECT CHR_EDIT_INV FROM m_user_privilege WHERE CHR_USRNAME ='"+session.getAttribute("USRID").toString()+"'")[0][0]))
			 out.println("<input class='ButtonHead' type='submit' onClick='return Edit()' name='action1' id='action1' value='Billing'>");
			else	
				out.println("<input type='hidden'  name='Edit' id='Edit' value='Edit'>");
			out.println("</td>");
			
			out.println("<td ' valign='top'>");
			if("Y".equals(CommonFunctions.QueryExecute("SELECT CHR_DELETE_INV FROM m_user_privilege WHERE CHR_USRNAME ='"+session.getAttribute("USRID").toString()+"'")[0][0]))
				out.println("<input class='ButtonHead' type='submit' onClick='return Delete()' name='Submit' id='Submit' value='Delete'>");
			else	
				out.println("<input type='hidden'  name='Delete' id='Delete' value='Delete'>");
			out.println("</td>");	
			
			out.println("<td ' valign='top'>");
			out.println("<input type='button' class='ButtonHead' name='Button' value='Close' onClick=\"redirect( 'InventoryMains.jsp')\" />");
			out.println("</td>");
			
			out.println("</tr>");	
			out.println("</table>");
			
			%>		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<%@ include file="../footer.jsp"%></form>
</body>
</html>