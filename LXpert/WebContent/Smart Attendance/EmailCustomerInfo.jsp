<%@ page contentType="text/html; charset=iso-8859-1" language="java" 	import="java.sql.*" errorPage=""%>
<html>
<head>
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


<title> :: ATTENDANCE ::</title>


<script language="javascript" src="../JavaScript/comfunction.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<%@ include file="../JavaScript/dynamicStylesheet.jsp" %> 
</head>
<script language="javascript" src="../JavaScript/Attendance/EmailCustomerinfo.js"></script>

<script language="JavaScript">

    function GAdd()
	{ 
		document.frm.action="EmailCustomerInfoAction.jsp";
 	}

	function GEdit()
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
		if(count==1){			
			document.frm.action="EmailCustomerInfoAction.jsp";
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
<body  onpaste="return false;" onLoad="LoadEmailCustomerinfos('0')"   >
<%@ include file="index.jsp"%>
<form  AUTOCOMPLETE = "off"   action="../SmartLoginAuth" method="get" name="frm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
	  <td><table width="90%" height="200" border="0" align="center"
			cellpadding="0" cellspacing="0" class="TableDesign"  
			 >
        <tr>
          <td height="31"><div align="center" class="whiteMedium">Customer  Information for MAIL CAMPAIGN</div></td>
        </tr>
        <tr>
          <td height="31"><table width="120" border="0" align="center" cellpadding="2" cellspacing="2">
              <tr>
                <td class="whiteMedium">Group</td>
                <td><select name="group" class="formText135" id="group" onChange="LoadEmailCustomerinfos('0')" >
                    <option value="0">All</option>
                    <%
			  String sdata[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(" SELECT INT_GROUPID,CHR_GROUPNAME FROM  email_m_customergroup ORDER BY CHR_GROUPNAME ");
			  for(int u=0;u<sdata.length;u++)
			  	out.println("<option value='"+sdata[u][0]+"'>"+sdata[u][1]+"</option>");
			  %>
                  </select>                </td>
                <td><a title="Excel" href=javascript:;
			onClick=" CreateExcelSheet()"><img
			src="../Image/report/Excel.png" width="15" height="14" border="0"></a> </td>
              </tr>
          </table></td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td class="bolddeepblue"><div id="GroupTable" style="OVERFLOW:auto;width:100%;height:300px" class="boldEleven"></div>
              <br>
            <div id="totalrec"></div></td>
        </tr>
        
	    <tr>        </tr>
      </table></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><table width="90%" border="0" align="center" cellpadding="1"
			cellspacing="1" class="TableDesign"  >
          <tr class="para">
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('0')">All</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('A')">A</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('B')">B</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('C')">C</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('D')">D</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('E')">E</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('F')">F</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('G')">G</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('H')">H</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('I')">I</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('J')">J</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('K')">K</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('L')">L</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('M')">M</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('N')">N</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('O')">O</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('P')">P</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('Q')">Q</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('R')">R</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('S')">S</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('T')">T</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('U')">U</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('V')">V</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('W')">W</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('X')">X</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('Y')">Y</a></div></td>
            <td class="boldEleven"><div align="center"><a class="whiteMedium"
					href="javascript:LoadEmailCustomerinfos('Z')">Z</a></div></td>
          </tr>
        </table></td>
	</tr>
	<tr>
	  <td><span class="boldEleven">
	    <input type="hidden" name="filename" value="EmailCustomerInfo" />
        <input type="hidden" name="actionS" value="ATTEmailCustomerGroupDelete" />
      </span></td>
    </tr>
	<tr>
	  <td>&nbsp;</td>
    </tr>
	<tr>
		<td><table width="224" border="0" align="center" cellpadding="1"
			cellspacing="1">
          <!--DWLayoutTable-->
          <tr>
            <td width="56" valign="top"><input type="Submit" class="ButtonHead" name="action1" id="Add"  value="Add"   accesskey="s"   onClick="GAdd()" /></td>
            <td width="56" valign="top"><input type="submit"
					class="ButtonHead" name="Edit" id="Edit" value="Edit"  
					onclick="return GEdit()" /></td>
            <%
	  String usertype=""+session.getAttribute("USRTYPE");
	  if("F".equals(usertype))
	  {
	  %>
            <td width="56" valign="top"><input type="submit"
					class="ButtonHead" name="Submit" id="Delete" value="Delete"  
					onclick="return RDelete()" /></td>
            <%
		}
		%>
            <td width="56"><input type="Button" class="ButtonHead"
					name="submit"  value="Close"   accesskey="c"  onClick="redirect('AttendanceMain.jsp')" /></td>
          </tr>
        </table></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
</form>
<%@ include file="../footer.jsp"%>
</body>
</html>