<%@ page import="java.io.*,java.util.*" isErrorPage="false" 	errorPage="./error.jsp"%>
<%@ page import="com.my.org.erp.common.CommonFunctions"%>

<html>
<title><%= CommonFunctions.QueryExecute("SELECT CHR_MODULETITLE FROM m_projectmodule WHERE CHR_SHORTNAME='GEN' ")[0][0]%></title>
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
 
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="javascript" src="../JavaScript/smartcommon/locationAjax.js"></script>
<script language="javascript">    
	function Delete()
 	{		
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
			var name=confirm("Confirm to Delete?")
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
	
	
 	function  Edit()
 	{		
		var count;
		count=0;
		coffee1=document.forms[0].id;
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
		if(count==1){			
			document.frm.action="LocationAction.jsp";
			document.frm.submit();
			return true;
		}
		else
		{
		    alert("Select Only one Value");
		    return false;
		}
 	}
	function Add()
 	{				
		document.frm.action="LocationAction.jsp";
		document.frm.submit();
 	}
 	 
</script>

<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
<link href="../JavaScript/SmartStyles.css" rel="stylesheet" type="text/css">
<form  AUTOCOMPLETE = "off"   method="get" name='frm' >
<body  onpaste="return false;" onLoad="loadlocation('0')">
<%@ include file="index.jsp"%>
<table width="100%" border="0" cellspacing="1" cellpadding="1">
	<tr>
		<td></td>
	</tr>
	<tr>
		<td></td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
  </tr>
	<tr>
		<td>
		<table width="90%" height="220" border="0" align="center" cellpadding="0" cellspacing="0" class="TableDesign">
			<tr>
			  <td height="30" align="center"  class="whiteMedium">LOCATION</td>
		  </tr>
			<tr>
				<td height="30" align="center"><table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" class="whiteMedium">
                  <tr>
                    <td colspan="4" align="center" valign="top" style="font-weight: bold"><table   border="0" align="center" cellpadding="0" cellspacing="0" class="whiteMedium">
                      <tr>
                        <td><div align="center">OFFICE </div></td>
                        <td>&nbsp;</td>
                        <td><span class="boldEleven">
 <select name="officeid"   id="officeid" class="formText135"   style="width:200" onChange="loadlocation('0')" >
                            <option value="0">All</option>
                            <%
				String data[][]= CommonFunctions.QueryExecute("SELECT INT_OFFICEID,CHR_OFFICENAME FROM  com_m_office  ORDER BY CHR_OFFICENAME");
				for(int h=0;h<data.length;h++)
					out.print("<option value='"+data[h][0]+"'>"+data[h][1]+"</option>");
				%>
                          </select>
                        </span></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td width="10%" style="font-weight: bold"><div align="center">S.No</div></td>
                    <td width="30%" style="font-weight: bold"><div align="center">LOCATION</div></td>
					<td width="30%" style="font-weight: bold"><div align="center">OFFICE </div></td>
					<td width="30%" style="font-weight: bold"><div align="center">ACTIVE </div></td>
                  </tr>
              </table></td>
			</tr>
			<tr class="MRow1"  >
				<td >
				
				<div id="locationtable" style="OVERFLOW:auto;width:100%;height:300px"></div><br>
				<div id="totrec"  > </div><br>					</td>
		  </tr>
		</table>		</td>
	</tr>

	<tr>
	  <td>&nbsp;</td>
  </tr>
	<tr>
	  <td><table border="0" align="center" cellpadding="1"
			cellspacing="1" class="TableDesign"  >
        <tr class="para">
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('0')">All</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('A')">A</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('B')">B</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('C')">C</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('D')">D</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('E')">E</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('F')">F</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('G')">G</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('H')">H</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('I')">I</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('J')">J</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('K')">K</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('L')">L</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('M')">M</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('N')">N</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('O')">O</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('P')">P</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('Q')">Q</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('R')">R</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('S')">S</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('T')">T</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('U')">U</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('V')">V</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('W')">W</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('X')">X</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('Y')">Y</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:loadlocation('Z')">Z</a></div></td>
        </tr>
      </table></td>
  </tr>
	<tr>
	  <td><input type="hidden" name="filename"	value="Location">
      <input type="hidden" name="actionS"	value="GENlocationDelete"></td>
  </tr>
	<tr>
		<td>
		  <div align="center">
            <%
			out.println("<table   border='0' align='center' cellpadding='1' cellspacing='1'>");
			out.println("<tr>");
			 
			out.println("<td ' valign='top'>");
			if("Y".equals(CommonFunctions.QueryExecute("SELECT CHR_ADD_GEN FROM m_user_privilege WHERE CHR_USRNAME = '"+session.getAttribute("USRID").toString()+"'")[0][0]))
				out.println("<input class='ButtonHead' type='submit' onClick='Add()' name='action1' id='action1' value='Add'>");
			else	
				out.println("<input type='hidden' name='action1' id='action1' value='Add'>");
			out.println("</td>");
			
			
			out.println("<td ' valign='top'>");
			if("Y".equals(CommonFunctions.QueryExecute("SELECT CHR_EDIT_GEN FROM m_user_privilege WHERE CHR_USRNAME = '"+session.getAttribute("USRID").toString()+"'")[0][0]))
			 out.println("<input class='ButtonHead' type='submit' onClick='return Edit()' name='action1' id='action1' value='Edit'>");
			else	
				out.println("<input type='hidden'  name='Edit' id='Edit' value='Edit'>");
			out.println("</td>");
			
			out.println("<td ' valign='top'>");
			if("Y".equals(CommonFunctions.QueryExecute("SELECT CHR_DELETE_GEN FROM m_user_privilege WHERE CHR_USRNAME ='"+session.getAttribute("USRID").toString()+"'")[0][0]))
				out.println("<input class='ButtonHead' type='submit' onClick='return   Delete()' name='Submit' id='Submit' value='Delete'>");
			else	
				out.println("<input type='hidden'  name='Delete' id='Delete' value='Delete'>");
			out.println("</td>");	
			
			out.println("<td ' valign='top'>");
			out.println("<input type='button' class='ButtonHead' name='Button' value='Close' onClick=\"redirect('commonmain.jsp')\" />");
			out.println("</td>");
			
			out.println("</tr>");	
			out.println("</table>");
			
			%>
          </div></td>
	</tr>
</table>



<%@ include file="../footer.jsp"%>

</body>
</html>



