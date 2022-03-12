<%@ page import="com.my.org.erp.common.CommonFunctions"%>
<%@ page import="org.apache.commons.lang.ArrayUtils"%> 


<%
try
{
%>


<html>
<head>
 

<title> :: SERVICE REPORT :: </title>


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
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="javascript" src="../JavaScript/staff/DailyEngineerReport.js"></script>
<script language="JavaScript">

    function RAdd()
	{ 
		 
		document.frm.action="DailyCallsAdd.jsp";
		return true;
 	}

	 
	 
	 
	 function REdit()
 	{		
		var count;
		count=0;
		coffee1=document.forms[0].callid;
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
			if (document.forms[0].callid.checked) { count=1;}
		}
		if(count==1){			
			document.frm.action="DailyCallsEdit.jsp";
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
		coffee1=document.forms[0].callid
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
			if (document.forms[0].callid.checked) { count=1;}
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


<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style>



</head>


<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  onLoad="LoadDailyEngineerReport('0')">
<form  AUTOCOMPLETE = "off"   name="frm" method="post" id="frm"  >

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><%@ include file="index.jsp"%></td>
  </tr>
  <tr>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td  >
	
	
	
	
	<table width="90%" height="256" border="0" align="center"
			cellpadding="0" cellspacing="0" class="TableDesign"
			 >
			<tr  >
				<td height="22"  >
				<div align="center"><span class="boldThirteen"> DAILY CALLS &nbsp;&nbsp; &nbsp;&nbsp;</span></div>				</td>
			</tr>
			<tr  >
				<td height="25"  >
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="whiteMedium">
					<tr>
						 
						<td width="87" >Month</td>
						<td width="76"><select name="month" class="formText135" id="month"
							onBlur="LoadDailyEngineerReport('0')"  onChange="LoadDailyEngineerReport('0')" >
							<%@ include file="../JavaScript/Inventory/month.jsp"%>
						</select></td>
						<td width="50" >Year </td>
						<td width="88"><select name="year" class="formText135" id="year"
							onBlur="LoadDailyEngineerReport('0')"  onChange="LoadDailyEngineerReport('0')" >
							<%@ include file="../JavaScript/Inventory/year.jsp"%>
						</select> <script language='JavaScript' type="text/javascript">
				<!--			
						var d=new Date()
						var month1=d.getMonth() + 1
						if(month1<10) month1="0"+month1;
						var year1=d.getFullYear();
						setOptionValue('month',month1);
						setOptionValue('year',year1);	
				//-->
          </script></td>
					    <td >Day </td>
						 <td >
						 <select name="day" class="formText135" id="day"  tabindex="8"  onChange="LoadDailyEngineerReport('0')" 	>
                   <option value="0" selected="selected">All</option>
                  <%
			for(int u=0;u<31;u++)
				out.println("<option value='"+(u+1)+"'>"+(u+1)+"</option>");
			%>
                </select>						 </td>
					    <td >Call Type</td>
					    <td class="whiteMedium">
						<select name="calltype" class="formText135" id="calltype" onChange="LoadDailyEngineerReport('0')" 	onBlur="LoadDailyEngineerReport('0')"  >
                            <option value="0">All</option>
                            <option value="1">'01' Calls</option>
                            <option value="2">'02' Calls</option>
                          </select>                        </td>
					    <td >Calls Status <span class="errormessage"> </span></td>
					    <td class="whiteMedium">
						<select name="callstatus" class="formText135" id="callstatus" onChange="LoadDailyEngineerReport('0')" onBlur="LoadDailyEngineerReport('0')"  >
                            <option value="0">All</option>
                            <option value="C">Closed</option>
                            <option value="P">Pending</option>
                          </select>                        </td>
					</tr>
				</table>				</td>
			</tr>
			
			<tr class="MRow1">
				<td height="127" valign="top" class="footermenu">
				 
						<div id="GroupTable" style="OVERFLOW:auto;width:100%;height:350px"  ></div>
						<br>
						<div align="center" id="totalrec"></div><br>
							
											 
			  </td>
		  </tr>
		</table>
	  </td>
  </tr>
  <tr>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td  ><table width="90%" border="0" align="center" cellpadding="1"
			cellspacing="1" class="TableDesign"  >
      <tr class="para">
        <td><div align="center"><a  class="whiteMedium" href="javascript:LoadDailyEngineerReport('0')">All</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('A')">A</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('B')">B</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('C')">C</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('D')">D</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('E')">E</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('F')">F</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('G')">G</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('H')">H</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('I')">I</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('J')">J</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('K')">K</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('L')">L</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('M')">M</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('N')">N</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('O')">O</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('P')">P</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('Q')">Q</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('R')">R</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('S')">S</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('T')">T</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('U')">U</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('V')">V</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('W')">W</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('X')">X</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('Y')">Y</a></div></td>
        <td><div align="center"><a  class="whiteMedium"  href="javascript:LoadDailyEngineerReport('Z')">Z</a></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td  ><input name="filename"  id="filename" type="hidden" value="DailyCalls" />
      <input name="actionS"   id="actionS"  type="hidden" value="SSRStaffDailyCallsDelete" /></td>
  </tr>
  <tr>
    <td  ><table border="0" align="center" cellpadding="3" cellspacing="3">
      <tr>
        <td width="56" valign="top"><input type="submit" class="ButtonHead" name="add" id="add"  value="Add"   accesskey="s"    onClick=" return RAdd()" /></td>
        <td width="56" valign="top"><input type="submit" class="ButtonHead" name="edit" id="edit" value="Edit" onClick="return REdit()" /></td>
        
		
		<%
	  String usertype=""+session.getAttribute("USRTYPE");
	  if("F".equals(usertype)|| ArrayUtils.contains(CommonFunctions.QueryExecute("SELECT CHR_DELETEUSER  FROM m_inventorysetting  WHERE INT_ROWID=1")[0][0].split(","), session.getAttribute("USRID").toString()))
	  {
	  %>
				<td width="56"><input type="submit" class="ButtonHead"
					name="Delete" id="Delete" value="Delete"
					onClick="return RDelete()" /></td>
				<%
		}
		else
		{ 
			out.println("<input type='hidden'  name ='Delete' id='Delete'>");
		}


		%>
 
        <td width="56"><input type="button" class="ButtonHead" name="close" id="close"   value="Close"   accesskey="c"   onclick="redirect('ServiceReportmain.jsp')" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td><%@ include file="../footer.jsp"%></td>
  </tr>
</table>
</form>
 
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