  <%@ page import="java.io.*,java.util.*, com.my.org.erp.common.*" errorPage="../error/index.jsp"%>
  <%@ page import="com.my.org.erp.common.CommonFunctions"%>
<%@ page import="org.apache.commons.lang.ArrayUtils"%> 


<%
try
{
%>


<html>
<head>
<title>:: INVENTORY ::</title><link rel="icon" type="image/ico" href="../images/ERP.ico"></link>
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
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="javascript" src="../JavaScript/calendar1.js"></script>
<script language="javascript" src="../JavaScript/Inventory/bankinformations.js"></script>
<script language="JavaScript">
     function Add()
	{ 
	
		document.frm.action="BankAction.jsp";
		return true;
 	}

	function Edit()
 	{		 
		
		
		obj = findObj("rowid"); 
		if(obj == null)
		{
			alert("Edit not available");
			return false;
		}	
		
		
		
		var count;
		count=0;
		
		coffee1=document.forms[0].rowid
		txt=""
		for (i=0;i<frm.length;++ i)
		{
			if (frm[i].checked)
			{
			count=count+1;
			}
		}
		if(count==0)
		{
			if (document.forms[0].rowid.checked) { count=1;}
		}
		if(count==1){			
			document.frm.action="BankAction.jsp";
			return true;
		}
		else
		{
		    alert("Select Only one Value");
		    return false;
		}
		
 	}	

 	function RDelete()
 	{		
		
		
		obj = findObj("rowid"); 
		if(obj == null)
		{
			alert("Delete not available");
			return false;
		}	
		
		
		var count;
		count=0;
		coffee1=document.forms[0].rowid
		txt=""
		for (i=0;i<frm.length;++ i)
		{
			if (frm[i].checked)
			{
			count=count+1;
			}
		}
		if(count==0)
		{
			if (document.forms[0].rowid.checked) { count=1;}
		}
		if(count>=1){			
			var name=confirm("Confirm to Delete")
			if (name==true)
			{ 
				document.frm.action="../SmartLoginAuth";
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
 <body onLoad="loadBanks('0'),document.getElementById('search').focus()"  >
<%@ include file="indexinv.jsp"%>
<form  AUTOCOMPLETE = "off"   name="frm" method="post" action="../SmartLoginAuth" >
<table width="100%" border="0" align="center" cellpadding="1"
	cellspacing="1">
	<tr>
	  <td>&nbsp;</td>
    </tr>
	<tr>
	  <td>&nbsp;</td>
    </tr>
	<tr>
		<td><a href=javascript:; onClick="windowSave('sample.txt')">
		</a></td>
	</tr>
	<tr>
		<td>
		<table width="800" height="220" border="0" align="center"
			cellpadding="0" cellspacing="0" class="TableDesign"  
			 >
			<tr  >
				<td height="31"  >
				<div align="center" class="whiteMedium">Bank
				Details  </div>				</td>
			</tr>
			<tr  >
			  <td height="31" align="center"  ><table width="655" border="0" align="center" cellpadding="5" cellspacing="0" class="whiteMedium">
                <tr>
                  <td width="86">Bank Name </td>
                  <td width="185"><select name="bankgroup" id="bankgroup"
									class="formText135" style="width:170px" onChange="loadBanks('0')">
                                  <option value="0">All</option>
                                  <%
				  		
				  		String bankdata[][] = CommonFunctions.QueryExecute("SELECT INT_BANKGROUPID,CHR_BANKGROUPNAME FROM com_m_bankgroup ORDER BY CHR_BANKGROUPNAME");
				  		if(bankdata.length>0)
							for(int u=0; u<bankdata.length; u++)
				  				out.print("<option value ='"+bankdata[u][0]+"'>" +bankdata[u][1]+"</option>");
				  %>
                  </select></td>
                  <td width="199" height="27">Search by Bank Branch Name </td>
                  <td width="145"><input name="search" type="text" class="formText135" id="search" onKeyUp="loadBank()" onBlur="loadBank()"     ></td>
                </tr>
              </table></td>
		  </tr>
		 
			<tr class="MRow1">
				<td height="127" valign="top" class="footermenu">
				 
						<div id="CustomerTable" style="OVERFLOW:auto;width:100%;height:300px" class="boldEleven"></div>	
						<br><br><div align="center" id="totRec"></div>	<br>	<br>				</td>
		  </tr>
		</table>		</td>
	</tr>
	<tr>
		<td></td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
    </tr>
	<tr>
		<td>
		<table width="90%" border="0" align="center" cellpadding="1"
			cellspacing="1" class="TableDesign"  >
			<tr class="para">
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('0')">ALL</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('A')">A</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('B')">B</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('C')">C</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('D')">D</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('E')">E</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('F')">F</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('G')">G</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('H')">H</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('I')">I</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('J')">J</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('K')">K</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('L')">L</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('M')">M</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('N')">N</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('O')">O</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('P')">P</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('Q')">Q</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('R')">R</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('S')">S</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('T')">T</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('U')">U</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('V')">V</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('W')">W</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('X')">X</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('Y')">Y</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:loadBanks('Z')">Z</a></div>				</td>
			</tr>
		</table>		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><input name="filename" type="hidden" value="BankInfo" />
          <input
			name="actionS" type="hidden" value="INVbankinfoDelete" /></td>
	</tr>
	<tr>
		<td>
		  <div align="center">
            <%
			out.println("<table   border='0' align='center' cellpadding='1' cellspacing='1'>");
			out.println("<tr>");
			 
			out.println("<td ' valign='top'>");
			if("Y".equals(CommonFunctions.QueryExecute("SELECT CHR_ADD_INV FROM m_user_privilege WHERE CHR_USRNAME ='"+session.getAttribute("USRID").toString()+"'")[0][0]))
				out.println("<input class='ButtonHead' type='submit' onClick='Add()' name='action1' id='action1' value='Add'>");
			else	
				out.println("<input type='hidden' name='action1' id='action1' value='Add'>");
			out.println("</td>");
			
			
			out.println("<td ' valign='top'>");
			if("Y".equals(CommonFunctions.QueryExecute("SELECT CHR_EDIT_INV FROM m_user_privilege WHERE CHR_USRNAME ='"+session.getAttribute("USRID").toString()+"'")[0][0]))
			 out.println("<input class='ButtonHead' type='submit' onClick='return Edit()' name='action12' id='action12' value='Edit'>");
			else	
				out.println("<input type='hidden'  name='Edit' id='Edit' value='Edit'>");
			out.println("</td>");
			
			out.println("<td ' valign='top'>");
			if("Y".equals(CommonFunctions.QueryExecute("SELECT CHR_DELETE_INV FROM m_user_privilege WHERE CHR_USRNAME ='"+session.getAttribute("USRID").toString()+"'")[0][0]))
				out.println("<input class='ButtonHead' type='submit' onClick='return  RDelete()' name='Submit' id='Submit' value='Delete'>");
			else	
				out.println("<input type='hidden'  name='Delete' id='Delete' value='Delete'>");
			out.println("</td>");	
			
			out.println("<td ' valign='top'>");
			out.println("<input type='button' class='ButtonHead' name='Button' value='Close' onClick=\"redirect( 'InventoryMains.jsp')\" />");
			out.println("</td>");
			
			out.println("</tr>");	
			out.println("</table>");
			
			%>
          </div></td>
	</tr>
</table>

<%@ include file="../footer.jsp"%></form>
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
