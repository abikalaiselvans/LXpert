<%@ page import="java.io.*,java.util.*" isErrorPage="false" 	errorPage="./error.jsp"%>
<%@ page import="com.my.org.erp.common.CommonFunctions"%>
<%@ page import="org.apache.commons.lang.ArrayUtils"%> 


<%
try
{
%>


<html>
 

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

 

<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="javascript" src="../JavaScript/smartcommon/IdProofAjax.js"></script>


<script language="javascript">    
	function RDelete()
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
	
	
 	function  Edit()
 	{		
		obj = findObj("id"); 
		if(obj == null)
		{
			alert("Edit not available");
			return false;
		}


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
			document.frm.action="IdProofAction.jsp";
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
		document.frm.action="IdProofAction.jsp";
		document.frm.submit();
 	}
 	 
</script>

<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
<form  AUTOCOMPLETE = "off"   method="get" name='frm' action="../SmartLoginAuth" >
<body  onpaste="return false;" onLoad=" LoadIdProof('0')">
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

		<table width="90%" height="220" border="0" align="center" cellpadding="0" cellspacing="0" class="TableDesign"
			 >
			<tr>
			  <td height="30" align="center"  class="whiteMedium">ID PROOF </td>
		  </tr>
			<tr>
				<td height="30" align="center"><table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" class="whiteMedium">
                  <tr>
                    <td width="9%" style="font-weight: bold"><div align="center">S.No</div></td>
                    <td width="91%" style="font-weight: bold"><div align="center">NAME </div></td>
                  </tr>
              </table></td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" >
				
				<div id="LoadIdProofTable" style="OVERFLOW:auto;width:100%;height:300px"></div><br>
				
				<div id="totRec"  > </div><br>		  </td>
			</tr>
		</table>		</td>
	</tr>

	<tr>
	  <td>&nbsp;</td>
  </tr>
	<tr>
	  <td><table width="90%" border="0" align="center" cellpadding="1"
			cellspacing="1" class="TableDesign">
        <tr class="para">
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('0')">All</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('A')">A</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('B')">B</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('C')">C</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('D')">D</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('E')">E</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('F')">F</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('G')">G</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('H')">H</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('I')">I</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('J')">J</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('K')">K</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('L')">L</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('M')">M</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('N')">N</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('O')">O</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('P')">P</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('Q')">Q</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('R')">R</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('S')">S</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('T')">T</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('U')">U</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('V')">V</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('W')">W</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('X')">X</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('Y')">Y</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadIdProof('Z')">Z</a></div></td>
        </tr>
      </table></td>
  </tr>
	<tr>
	  <td><input type="hidden" name="filename"	value="IdProof">
      <input type="hidden" name="actionS"	value="GENIdProofDelete"></td>
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
				out.println("<input class='ButtonHead' type='submit' onClick='return  RDelete()' name='Submit' id='Submit' value='Delete'>");
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


<%
}
catch(Exception e)
{
	out.println(e.getMessage());
	System.out.println(e.getMessage());
}
%>


